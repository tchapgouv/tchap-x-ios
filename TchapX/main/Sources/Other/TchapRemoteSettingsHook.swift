//
// Copyright 2026 Tchap.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Foundation
import MatrixRustSDK

struct TchapRemoteSettingsHook: RemoteSettingsHookProtocol {
    private let defaultHook = DefaultRemoteSettingsHook()
    
    #if IS_MAIN_APP
    func initializeCache(using client: ClientProtocol, applyingTo appSettings: CommonSettingsProtocol) async -> Result<Void, RemoteSettingsError> {
        let result = await defaultHook.initializeCache(using: client, applyingTo: appSettings)
        
        guard case .success = result else {
            return result
        }
        
        applyContentScannerURL(client.homeserver(), to: appSettings)
        return result
    }
    
    func updateCache(using client: ClientProtocol) async {
        await defaultHook.updateCache(using: client)
    }
    
    func reset(_ appSettings: CommonSettingsProtocol) {
        defaultHook.reset(appSettings)
        appSettings.contentScannerURL.reset()
    }
    #endif
    
    func loadCache(forHomeserver homeserver: String, applyingTo appSettings: CommonSettingsProtocol) {
        defaultHook.loadCache(forHomeserver: homeserver, applyingTo: appSettings)
        applyContentScannerURL(homeserver, to: appSettings)
    }
    
    private func applyContentScannerURL(_ homeserver: String, to appSettings: CommonSettingsProtocol) {
        guard let contentScannerURL = URL(string: homeserver) else {
            appSettings.contentScannerURL.reset()
            return
        }
        
        appSettings.contentScannerURL.applyRemoteValue(contentScannerURL)
    }
}

extension AppHooks {
    func setUp() {
        registerRemoteSettingsHook(TchapRemoteSettingsHook())
    }
}
