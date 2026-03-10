//
// Copyright 2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import CoreLocation
import MapLibre
import SwiftUI

// From example: https://github.com/maplibre/maplibre-native/blob/249e77c7fafc4dbb8e80699bf7254ebe94969bdb/platform/ios/app-swift/Sources/StaticSnapShotExample.swift#L48
@Observable public final class TchapStaticMapLoader {
    // Static map loading states
    public enum StaticMapLoaderPhase {
        case inited
        case loading
        case failure(Error)
        case success(UIImage)
    }

    private let snapshotter: MLNMapSnapshotter?
    private let backgroundQueue = DispatchQueue.global(qos: .background)
    private let cache: TchapStaticMapDiskCache?
    private let cacheKey: URL?
    var state = StaticMapLoaderPhase.inited
    
    private var cachedImage: UIImage? {
        guard let cacheKey,
              let data = cache?.readData(for: cacheKey),
              let cachedImage = UIImage(data: data) else {
            return nil
        }
        return cachedImage
    }
    
    static func buildMapLoader(mapUrlBuilder: MapTilerURLBuilderProtocol, style: MapTilerStyle, location: CLLocationCoordinate2D, zoom: Double, size: CGSize, attribution: MapTilerAttributionPlacement) -> TchapStaticMapLoader {
        let cacheKey = mapUrlBuilder.staticMapTileImageURL(for: style, coordinates: location, zoomLevel: zoom, size: size, attribution: attribution)

        // Check if exsiting running loader exists. Returns it if it exists to avoid running concurrent loaders on same map.
        if let existingLoader = Self.getRunningMapLoader(for: cacheKey) {
            return existingLoader
        }
        
        // No existing loader. Build it.
        let mapLoader = TchapStaticMapLoader(mapUrlBuilder: mapUrlBuilder,
                                             style: style,
                                             location: location,
                                             zoom: zoom,
                                             size: size,
                                             attribution: attribution)
        
        // If existing cached image is found, returns it with `success` state to avoid init with `loading` state which would make map view flickers while scrolling timeline.
        if let cachedImage = mapLoader.cachedImage {
            mapLoader.state = .success(cachedImage)
        } else {
            mapLoader.startLoading()
        }
        
        return mapLoader
    }
    
    init(mapUrlBuilder: MapTilerURLBuilderProtocol, style: MapTilerStyle, location: CLLocationCoordinate2D, zoom: Double, size: CGSize, attribution: MapTilerAttributionPlacement) {
        let camera = MLNMapCamera(lookingAtCenter: location, altitude: 0.0, pitch: 0.0, heading: 0.0)
        let snapshotterOptions = MLNMapSnapshotOptions(styleURL: mapUrlBuilder.staticMapStyleURL(for: style, attribution: attribution),
                                                       camera: camera,
                                                       size: size)
        snapshotterOptions.zoomLevel = zoom
        snapshotter = MLNMapSnapshotter(options: snapshotterOptions)
        cacheKey = mapUrlBuilder.staticMapTileImageURL(for: style, coordinates: location, zoomLevel: zoom, size: size, attribution: attribution)
        cache = TchapStaticMapDiskCache()
    }
    
    private func startLoading() {
        state = .loading
        
        // Store loader in global cache in case timeline cell is regenerated and loader is recreated (to avoid concurrent loaders on same resource).
        Self.storeRunningMapLoader(mapLoader: self)
        
        // Start Snapshotter on background queue to avoid blocking UI.
        // It seems to be faster and more reliable too.
        snapshotter?.start(with: backgroundQueue) { snapshot, error in
            guard error == nil else {
                self.state = .failure(error!) // swiftlint:disable:this force_unwrapping
                Self.removeRunningMapLoader(mapLoader: self)
                return
            }
            
            if let snapshot {
                if let cacheKey = self.cacheKey,
                   let pngData = snapshot.image.dataForPNGRepresentation() {
                    try? self.cache?.store(data: pngData, for: cacheKey)
                }
                self.state = .success(snapshot.image)
            }
            
            Self.removeRunningMapLoader(mapLoader: self)
        }
    }
}

// TchapStaticMapLoader running loaders cache.
extension TchapStaticMapLoader {
    private static var currentlyLoadingMap = [URL: TchapStaticMapLoader]()
    
    private static func storeRunningMapLoader(mapLoader: TchapStaticMapLoader) {
        guard let key = mapLoader.cacheKey else {
            return
        }
        currentlyLoadingMap[key] = mapLoader
        MXLog.info("[TchapStaticMapLoader] current loaders running: \(currentlyLoadingMap.count)")
    }
    
    private static func removeRunningMapLoader(mapLoader: TchapStaticMapLoader) {
        guard let key = mapLoader.cacheKey else {
            return
        }
        currentlyLoadingMap.removeValue(forKey: key)
        MXLog.info("[TchapStaticMapLoader] current loaders running: \(currentlyLoadingMap.count)")
    }
    
    private static func getRunningMapLoader(for key: URL?) -> TchapStaticMapLoader? {
        guard let key = key,
              let mapLoader = currentlyLoadingMap[key] else {
            return nil
        }
        return mapLoader
    }
}
