//
// Copyright 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Foundation
import MatrixRustSDK

extension ClientSDKMock {
    struct Configuration {
        // MARK: Authentication
        
        var serverAddress = "matrix.org"
        var homeserverURL = "https://matrix-client.matrix.org"
        var slidingSyncVersion = SlidingSyncVersion.native
        var oidcLoginURL: String? = "https://account.matrix.org/authorize"
        var supportsOIDCCreatePrompt = true
        var supportsPasswordLogin = true
        var validCredentials = (username: "alice", password: "12345678")
        
        // MARK: Session
        
        var userID: String?
        var session = Session(accessToken: UUID().uuidString,
                              refreshToken: nil,
                              userId: "@alice:matrix.org",
                              deviceId: UUID().uuidString,
                              homeserverUrl: "https://matrix-client.matrix.org",
                              oidcData: nil,
                              slidingSyncVersion: .native)
    }
    
    enum MockError: Error { case generic }
    
    convenience init(configuration: Configuration) {
        self.init()
        
        homeserverLoginDetailsReturnValue = HomeserverLoginDetailsSDKMock(configuration: configuration)
        slidingSyncVersionReturnValue = configuration.slidingSyncVersion
        userIdServerNameThrowableError = MockError.generic
        serverReturnValue = "https://\(configuration.serverAddress)"
        urlForOidcOidcConfigurationPromptLoginHintDeviceIdReturnValue = OAuthAuthorizationDataSDKMock(configuration: configuration)
        loginUsernamePasswordInitialDeviceNameDeviceIdClosure = { username, password, _, _ in
            guard username == configuration.validCredentials.username,
                  password == configuration.validCredentials.password else {
                throw MockError.generic // use the matrix error
            }
        }
        
        userIdReturnValue = configuration.userID
        sessionReturnValue = configuration.session
    }
}

extension HomeserverLoginDetailsSDKMock {
    convenience init(configuration: ClientSDKMock.Configuration) {
        self.init()
        
        slidingSyncVersionReturnValue = configuration.slidingSyncVersion
        supportsPasswordLoginReturnValue = configuration.supportsPasswordLogin
        supportsOidcLoginReturnValue = configuration.oidcLoginURL != nil
        supportedOidcPromptsReturnValue = switch (configuration.oidcLoginURL, configuration.supportsOIDCCreatePrompt) {
        case (.none, _): []
        case (.some, true): [.consent, .create]
        case (.some, false): [.consent]
        }
        urlReturnValue = configuration.homeserverURL
    }
}

extension OAuthAuthorizationDataSDKMock {
    convenience init(configuration: ClientSDKMock.Configuration) {
        self.init()
        
        loginUrlReturnValue = configuration.oidcLoginURL
    }
}
