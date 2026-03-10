//
// Copyright 2025 Element Creations Ltd.
// Copyright 2022-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

<<<<<<< HEAD
import XCTest

// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
#endif
=======
@testable import ElementX
import Testing
>>>>>>> release/26.03.0

@MainActor
@Suite
struct SoftLogoutScreenViewModelTests {
    private let credentials = SoftLogoutScreenCredentials(userID: "mock_user_id",
                                                          homeserverName: "https://example.com",
                                                          userDisplayName: "mock_username",
                                                          deviceID: "ABCDEFGH")
    
    @Test
    func initialStateForBasicServer() {
        let viewModel = SoftLogoutScreenViewModel(credentials: credentials,
                                                  homeserver: .mockBasicServer,
                                                  keyBackupNeeded: false)
        let context = viewModel.context
        
        // Given a view model where the user hasn't yet sent the verification email.
        #expect(context.password.isEmpty, "The view model should start with an empty password.")
        #expect(!context.viewState.canSubmit, "The view model should start with an invalid password.")
        #expect(context.viewState.loginMode == .password, "The view model should show login form for the given homeserver.")
        #expect(!context.viewState.showRecoverEncryptionKeysMessage, "The view model should not show recover encryption keys message.")
    }
    
    @Test
    func initialStateForBasicServerPasswordEntered() {
        let viewModel = SoftLogoutScreenViewModel(credentials: credentials,
                                                  homeserver: .mockBasicServer,
                                                  keyBackupNeeded: true,
                                                  password: "12345678")
        let context = viewModel.context

        // Given a view model where the user hasn't yet sent the verification email.
        #expect(context.viewState.canSubmit, "The view model should start with a valid password.")
        #expect(context.viewState.loginMode == .password, "The view model should show login form for the given homeserver.")
        #expect(context.viewState.showRecoverEncryptionKeysMessage, "The view model should show recover encryption keys message.")
    }

    @Test
    func initialStateForOIDC() {
        let viewModel = SoftLogoutScreenViewModel(credentials: credentials,
                                                  homeserver: .mockMatrixDotOrg,
                                                  keyBackupNeeded: false)
        let context = viewModel.context
        
        // Given a view model where the user hasn't yet sent the verification email.
        #expect(context.password.isEmpty, "The view model should start with an empty password.")
        #expect(!context.viewState.canSubmit, "The view model should start with an invalid password.")
        #expect(context.viewState.loginMode.supportsOIDCFlow, "The view model should show OIDC button for the given homeserver.")
        #expect(!context.viewState.showRecoverEncryptionKeysMessage, "The view model should not show recover encryption keys message.")
    }
    
    @Test
    func initialStateForUnsupported() {
        let viewModel = SoftLogoutScreenViewModel(credentials: credentials,
                                                  homeserver: .mockUnsupported,
                                                  keyBackupNeeded: false)
        let context = viewModel.context

        // Given a view model where the user hasn't yet sent the verification email.
        #expect(context.password.isEmpty, "The view model should start with an empty password.")
        #expect(!context.viewState.canSubmit, "The view model should start with an invalid password.")
        #expect(context.viewState.loginMode == .unsupported, "The view model should show unsupported text for the given homeserver.")
        #expect(!context.viewState.showRecoverEncryptionKeysMessage, "The view model should not show recover encryption keys message.")
    }
}
