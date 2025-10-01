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
    
    init?() {
        let rootDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
            .appendingPathComponent(Bundle.main.bundleIdentifier!)
            .appendingPathComponent("map-snapshot-cache", isDirectory: true)
        
        do {
            try FileManager.default.createDirectoryIfNeeded(at: rootDirectory)
            self.rootDirectory = rootDirectory
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
    
    // MARK: - Private

    private func hashString(data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
    }
    
    private func hashString(for url: URL) -> String {
        hashString(data: url.absoluteString.data(using: .utf8)!)
    }
    
    private func fileUrl(for url: URL) -> URL {
        rootDirectory.appendingPathComponent(hashString(for: url))
    }
    
    private func cachedData(for url: URL) -> Data? {
        FileManager.default.contents(atPath: fileUrl(for: url).path)
    }
    
    private func writeToCache(key: URL, value: Data) throws {
        try value.write(to: fileUrl(for: key), options: .atomic)
    }
}
