//
// Copyright 2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import CoreLocation
import Mapbox
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
    
    private let snapshotter: MGLMapSnapshotter?
    private let backgroundQueue = DispatchQueue.global(qos: .background)
    private let cache: TchapStaticMapDiskCache?
    private let cacheKey: URL?
    var state = StaticMapLoaderPhase.inited
    
    init(mapUrlBuilder: MapTilerURLBuilderProtocol, style: MapTilerStyle, location: CLLocationCoordinate2D, zoom: Double, size: CGSize, attribution: MapTilerAttributionPlacement) {
        let camera = MGLMapCamera(lookingAtCenter: location, altitude: 0.0, pitch: 0.0, heading: 0.0)
        let snapshotterOptions = MGLMapSnapshotOptions(styleURL: mapUrlBuilder.staticMapStyleURL(for: style, attribution: attribution),
                                                       camera: camera,
                                                       size: size)
        snapshotterOptions.zoomLevel = zoom
        snapshotter = MGLMapSnapshotter(options: snapshotterOptions)
        cacheKey = mapUrlBuilder.staticMapTileImageURL(for: style, coordinates: location, zoomLevel: zoom, size: size, attribution: attribution)
        cache = TchapStaticMapDiskCache()
        
        startLoading()
    }
    
    private func startLoading() {
        state = .loading
        
        if let cacheKey,
           let data = cache?.readData(for: cacheKey),
           let cachedImage = UIImage(data: data) {
            Task {
                self.state = .success(cachedImage)
            }
        } else {
            // Start Snapshotter on background queue to avoid blocking UI.
            // It seems to be faster and more reliable too.
            snapshotter?.start(with: backgroundQueue) { snapshot, error in
                guard error == nil else {
                    self.state = .failure(error!) // swiftlint:disable:this force_unwrapping
                    return
                }
                
                if let snapshot {
                    self.state = .success(snapshot.image)
                    if let cacheKey = self.cacheKey,
                       let pngData = snapshot.image.dataForPNGRepresentation() {
                        try? self.cache?.store(data: pngData, for: cacheKey)
                    }
                }
            }
        }
    }
}
