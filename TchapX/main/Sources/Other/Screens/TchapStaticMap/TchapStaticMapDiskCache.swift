//
// Copyright 2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import CryptoKit
import Foundation

public struct TchapStaticMapDiskCache {
    private let rootDirectory: URL
    private let maxAge: TimeInterval = 60 * 60 * 24 * 30 // 1 month
    
    enum TchapStaticMapDiskCacheError: Error {
        case writeToCacheError
    }
    
    init?() {
        let rootDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! // swiftlint:disable:this force_unwrapping
            .appendingPathComponent(Bundle.main.bundleIdentifier!) // swiftlint:disable:this force_unwrapping
            .appendingPathComponent("map-snapshot-cache", isDirectory: true)
        
        #if targetEnvironment(simulator)
        MXLog.info("[TchapStaticMapDiskCacheError] \(rootDirectory)")
        #endif
        
        do {
            try FileManager.default.createDirectoryIfNeeded(at: rootDirectory)
            self.rootDirectory = rootDirectory
            
            // Try to clear cache at each call.
            removeFiles(olderThan: maxAge)
        } catch {
            return nil
        }
    }
    
    func readData(for url: URL) -> Data? {
        cachedData(for: url)
    }
    
    func store(data: Data, for url: URL) throws {
        try writeToCache(key: url, value: data)
    }
    
    func removeFiles(olderThan age: TimeInterval) {
        let now = Date.now
        
        try? FileManager.default.contentsOfDirectory(at: rootDirectory, includingPropertiesForKeys: [.creationDateKey]).forEach { fileUrl in
            if let fileCreationDate = try? fileUrl.resourceValues(forKeys: [.creationDateKey]).creationDate,
               now.timeIntervalSince(fileCreationDate) > age {
                try? FileManager.default.removeItem(at: fileUrl)
            }
        }
    }
    
    func removeAll() {
        removeFiles(olderThan: 0.0)
    }
    
    // MARK: - Private

    private func hashString(data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
    }
    
    private func hashString(for url: URL) -> String? {
        guard let urlData = url.absoluteString.data(using: .utf8) else {
            return nil
        }
        return hashString(data: urlData)
    }
    
    private func fileUrl(for url: URL) -> URL? {
        guard let hashString = hashString(for: url) else {
            return nil
        }
        return rootDirectory.appendingPathComponent(hashString)
    }
    
    private func cachedData(for url: URL) -> Data? {
        guard let fileUrl = fileUrl(for: url) else {
            return nil
        }
        return FileManager.default.contents(atPath: fileUrl.path)
    }
    
    private func writeToCache(key: URL, value: Data) throws {
        guard let fileUrlForKey = fileUrl(for: key) else {
            throw TchapStaticMapDiskCacheError.writeToCacheError
        }
        try value.write(to: fileUrlForKey, options: .atomic)
    }
}
