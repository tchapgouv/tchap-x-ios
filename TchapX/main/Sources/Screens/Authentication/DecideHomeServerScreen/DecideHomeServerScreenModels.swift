//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Foundation
import MatrixRustSDK
import SwiftUI

enum DecideHomeServerScreenViewModelAction {
    /// The homeserver domain is obtained and the Authentication Service supports OIDC
    case authenticationServiceConfiguredForOIDC(data: OIDCAuthorizationDataProxy, window: UIWindow)
    /// The homeserver domain is obtained and the Authentication Service is configured for login
    case authenticationServiceConfiguredForLogin(loginHint: String)
}

struct DecideHomeServerScreenViewState: BindableState {
    /// Whether a new homeserver is currently being loaded.
    var isLoading = false
    /// View state that can be bound to from SwiftUI.
    var bindings = DecideHomeServerScreenBindings()
    /// The presentation anchor used for OIDC authentication.
    var window: UIWindow?
    
    /// `true` when valid credentials have been entered and a homeserver has been loaded.
    var canSubmit: Bool {
        !blockUserInteraction && !isLoading && bindings.username.isEmailAddress
    }

    /// The  authentication flow: .login or .register.
    let authenticationFlow: AuthenticationFlow
    
    /// A flag to block submit button once it is tapped else it can be tapped again before leaving screen.
    /// It is resetted when coming back to screen if needed.
    var blockUserInteraction = false
}

struct DecideHomeServerScreenBindings {
    /// The username input by the user.
    var username = ""
    /// The password input by the user.
    var alertInfo: AlertInfo<DecideHomeServerScreenErrorType>?
}

enum DecideHomeServerScreenViewAction {
    /// Updates the window used as the OIDC presentation anchor.
    case updateWindow(UIWindow)
    /// Ask any HomeServer the homeServer attached to this email address .
    case requestForHomeserver
    //// Reset loading state of view
    case resetLoadingState
}

enum DecideHomeServerScreenErrorType: Error, Hashable {
    ///  An error on requesting homeserver with the email address.
    case tchapGetInstanceError
    /// An error if the Authentication service can't get the configuration of the server.
    case homeserverConfigurationUnreachable
    /// An error if the Authentication service can't be configured as OIDC.
    case homeserverDoesntSupportOIDCLoginFlow
    /// An error while trying to instantiate the Authentication service after getting the homeserver domain.
    case authenticationServiceError
}
