//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Combine
import MatrixRustSDK
import SwiftUI

typealias DecideHomeServerScreenViewModelType = StateStoreViewModelV2<DecideHomeServerScreenViewState, DecideHomeServerScreenViewAction>

class DecideHomeServerScreenViewModel: DecideHomeServerScreenViewModelType, DecideHomeServerScreenViewModelProtocol {
    private let authenticationService: AuthenticationServiceProtocol
    private let userIndicatorController: UserIndicatorControllerProtocol
    private let appSettings: AppSettings
    private let analytics: AnalyticsService
    
    private var actionsSubject: PassthroughSubject<DecideHomeServerScreenViewModelAction, Never> = .init()
    var actions: AnyPublisher<DecideHomeServerScreenViewModelAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }

    init(authenticationService: AuthenticationServiceProtocol,
         loginHint: String?,
         userIndicatorController: UserIndicatorControllerProtocol,
         appSettings: AppSettings,
         analytics: AnalyticsService) {
        self.authenticationService = authenticationService
        self.userIndicatorController = userIndicatorController
        self.appSettings = appSettings
        self.analytics = analytics
        
        let username = switch loginHint {
        case .some(let hint) where hint.hasPrefix("mxid:"): String(hint.dropFirst(5)) // MSC4198
        case .some(let hint): hint
        case .none: ""
        }
        
        let viewState = DecideHomeServerScreenViewState(bindings: DecideHomeServerScreenBindings(username: username))
        
        super.init(initialViewState: viewState)
    }

    override func process(viewAction: DecideHomeServerScreenViewAction) {
        switch viewAction {
        case .updateWindow(let window):
            guard state.window != window else { return }
            Task { state.window = window }
        case .requestForHomeserver:
            requestForHomeserver()
        }
    }

    func stopLoading() {
        state.isLoading = false
        userIndicatorController.retractIndicatorWithId(Self.loadingIndicatorIdentifier)
    }
    
    // MARK: - Private
        
    /// Requests the homeservers' list for the homeserver attached to the email address.
    /// The homeservers list must have been randomized on init.
    /// Each server .is requested one at a time until the first correct response.
    /// Display an error if no response is obtained.
    private func requestForHomeserver() {
        MXLog.info("[DecideHomeServerScreen]Starting requesting homeserver attachment for email.")
        startLoading(isInteractionBlocking: true)

        let config = TchapGetInstanceConfig(homeServer: "dev01.tchap.incubateur.net", userAgent: UserAgentBuilder.makeASCIIUserAgent())
        Task {
            do {
                let homeserverDomain = try tchapGetInstance(config: config, forEmail: context.username)
                MXLog.info("[DecideHomeServerScreen] requestForHomeserver -> \(homeserverDomain)")
                await initAuthenticationService(for: homeserverDomain)
                stopLoading()
            } catch {
                stopLoading()
                MXLog.error("[DecideHomeServerScreen] requestForHomeserver -> \(error)")
                handleError(.tchapGetInstanceError)
            }
        }
    }
    
    // Initialize the Authentication service with the returned homeServer.
    private func initAuthenticationService(for homeserverDomain: String) async {
        // Try to configure the Authentication Service to use the selected Homeserver.
        switch await authenticationService.configure(for: homeserverDomain, flow: .login) {
        case .success:
            if authenticationService.homeserver.value.loginMode.supportsOIDCFlow {
                switch await prepareOIDCFlow() {
                case .success((let oidcData, let window)):
                    actionsSubject.send(.authenticationServiceConfiguredForOIDC(data: oidcData, window: window))
                case .failure(let error):
                    handleError(error)
                    MXLog.error("[DecideHomeServerScreen] initAuthenticationService error: can't prepare OIDC flow")
                }
            } else {
                // TchapX only supports authentication via OIDC / MAS
                MXLog.error("[DecideHomeServerScreen] initAuthenticationService error: homeserverDoesntSupportOIDCLoginFlow")
                handleError(.homeserverDoesntSupportOIDCLoginFlow)
            }
        case .failure:
            MXLog.error("[DecideHomeServerScreen] initAuthenticationService error: homeserverConfigurationUnreachable")
            handleError(.homeserverConfigurationUnreachable)
        }
    }

    // Request the OIDC server with the user email to prepare OIDC data.
    private func prepareOIDCFlow() async -> Result<(OIDCAuthorizationDataProxy, UIWindow), DecideHomeServerScreenErrorType> {
        guard let window = state.window else {
            return .failure(.authenticationServiceError)
        }
        switch await authenticationService.urlForOIDCLogin(loginHint: context.username) {
        case .success(let oidcData):
            MXLog.info("[DecideHomeServerScreen] prepareOIDC succeed.")
            return .success((oidcData, window))
        case .failure:
            MXLog.error("[DecideHomeServerScreen] prepareOIDC failed.")
            return .failure(.homeserverDoesntSupportOIDCLoginFlow)
        }
    }
    
    private static let loadingIndicatorIdentifier = "\(DecideHomeServerScreenCoordinatorAction.self)-Loading"
    
    private func startLoading(isInteractionBlocking: Bool) {
        if isInteractionBlocking {
            userIndicatorController.submitIndicator(UserIndicator(id: Self.loadingIndicatorIdentifier,
                                                                  type: .modal,
                                                                  title: L10n.commonLoading,
                                                                  persistent: true))
        } else {
            state.isLoading = true
        }
    }
    
    /// Processes an error to either update the flow or display it to the user.
    private func handleError(_ error: DecideHomeServerScreenErrorType) {
        MXLog.info("[DecideHomeServerScreen] Error occurred: \(error)")
       
        switch error {
        case .tchapGetInstanceError:
            state.bindings.alertInfo = AlertInfo(id: .tchapGetInstanceError,
                                                 title: TchapL10n.screenDecideHomeserverErrorGetInstanceTitle,
                                                 message: TchapL10n.screenDecideHomeserverErrorGetInstanceMessage)
        case .homeserverConfigurationUnreachable:
            state.bindings.alertInfo = AlertInfo(id: .homeserverDoesntSupportOIDCLoginFlow,
                                                 title: TchapL10n.screenDecideHomeserverErrorHomeserverConfigurationUnreachableTitle,
                                                 message: TchapL10n.screenDecideHomeserverErrorHomeserverConfigurationUnreachableMessage)
        case .homeserverDoesntSupportOIDCLoginFlow:
            state.bindings.alertInfo = AlertInfo(id: .homeserverDoesntSupportOIDCLoginFlow,
                                                 title: TchapL10n.screenDecideHomeserverErrorHomeserverDoesntSupportOidcLoginFlowTitle,
                                                 message: TchapL10n.screenDecideHomeserverErrorHomeserverDoesntSupportOidcLoginFlowMessage)
        case .authenticationServiceError:
            state.bindings.alertInfo = AlertInfo(id: .authenticationServiceError)
        }
    }
}
