//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//
// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
#endif
@testable import Kingfisher
import UIKit

class MockImageCache: ImageCache, @unchecked Sendable {
    var retrievedImagesInMemory = [String: UIImage]()
    var retrievedImages = [String: UIImage]()
    var storedImages = [String: UIImage]()

    override func retrieveImageInMemoryCache(forKey key: String, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        retrievedImagesInMemory[key]
    }
    
    override func retrieveImage(forKey key: String, options: KingfisherOptionsInfo? = nil, callbackQueue: CallbackQueue = .mainCurrentOrAsync, completionHandler: ((Result<ImageCacheResult, KingfisherError>) -> Void)?) {
        if let image = retrievedImages[key] {
            completionHandler?(.success(ImageCacheResult.disk(image)))
        } else {
            let error = KingfisherError.cacheError(reason: .imageNotExisting(key: key))
            completionHandler?(.failure(error))
        }
    }
    
    override func store(_ image: KFCrossPlatformImage,
                        original: Data? = nil,
                        forKey key: String,
                        processorIdentifier identifier: String = "",
                        forcedExtension: String? = nil,
                        cacheSerializer serializer: CacheSerializer = DefaultCacheSerializer.default,
                        toDisk: Bool = true,
                        callbackQueue: CallbackQueue = .untouch,
                        completionHandler: ((CacheStoreResult) -> Void)? = nil) {
        storedImages[key] = image
        completionHandler?(.init(memoryCacheResult: .success(()), diskCacheResult: .success(())))
    }
}
