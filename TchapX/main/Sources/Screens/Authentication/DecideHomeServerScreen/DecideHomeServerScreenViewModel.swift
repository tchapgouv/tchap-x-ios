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
    private let authenticationFlow: AuthenticationFlow
    private let userIndicatorController: UserIndicatorControllerProtocol
    private let appSettings: AppSettings
    private let analytics: AnalyticsService
    private let accountProviders: [String]
    private var requestServerDomainsTask: Task<Void, Never>? // Will be canceled if View is leaved.
    
    private var actionsSubject: PassthroughSubject<DecideHomeServerScreenViewModelAction, Never> = .init()
    var actions: AnyPublisher<DecideHomeServerScreenViewModelAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }

    init(authenticationService: AuthenticationServiceProtocol,
         authenticationFlow: AuthenticationFlow,
         loginHint: String?,
         accountProviders: [String],
         userIndicatorController: UserIndicatorControllerProtocol,
         appSettings: AppSettings,
         analytics: AnalyticsService) {
        self.authenticationService = authenticationService
        self.authenticationFlow = authenticationFlow
        self.userIndicatorController = userIndicatorController
        self.appSettings = appSettings
        self.analytics = analytics
        self.accountProviders = accountProviders
        
        let username = switch loginHint {
        case .some(let hint) where hint.hasPrefix("mxid:"): String(hint.dropFirst(5)) // MSC4198
        case .some(let hint): hint
        case .none: ""
        }
        
        let viewState = DecideHomeServerScreenViewState(bindings: DecideHomeServerScreenBindings(username: username),
                                                        authenticationFlow: authenticationFlow) // Needed to display UI elments.
        
        super.init(initialViewState: viewState)
    }

    override func process(viewAction: DecideHomeServerScreenViewAction) {
        switch viewAction {
        case .updateWindow(let window):
            guard state.window != window else { return }
            Task { state.window = window }
        case .requestForHomeserver:
            requestForHomeserver()
        case .resetLoadingState: // Called when the view comes to screen (or going back to the view).
            resetLoadingState()
        }
    }
    
    func resetLoadingState() {
        stopLoading()
        state.blockUserInteraction = false
    }
    
    func stopLoading() {
        state.isLoading = false
        userIndicatorController.retractIndicatorWithId(Self.loadingIndicatorIdentifier)
        // Don't unblock submit button else it can be tapped before going to next screen.
        // It will be enabled again when coming back to this screen if necessary.
    }
    
    // MARK: - Private
        
    /// Requests the homeservers' list for the homeserver attached to the email address.
    /// The homeservers list is randomized before use..
    /// Each server is requested one at a time until the first correct response.
    /// Display an error if no response is obtained.
    private func requestForHomeserver() {
        MXLog.info("[DecideHomeServerScreen] Starting requesting homeserver attachment for email login.")
        startLoading(isInteractionBlocking: true)
        
        // Randonize order of servers list to avoid requesting the same servers in the same order (balance the charge).
        let requestServerDomains = accountProviders.shuffled()

        // Init and keep strong ref to task.
        // It will be canceled if view is dismissed.
        requestServerDomainsTask = Task(priority: .background) {
            defer {
                stopLoading()
            }
            
            // Trim option numerical suffix (if account was closed and recreated multiple times).
            // Else, the returned domain will be domain for external users, and the user won't be able to login if not external.
            let usernameIdWithoutNumericalSuffix = String(self.context.username.trimmingSuffix { $0.isNumber })
            
            for domain in requestServerDomains {
                if Task.isCancelled {
                    return
                }
                
                switch await self.requestHomeserverForInfo(homeserver: domain, forEmail: usernameIdWithoutNumericalSuffix) {
                case .success(let homeserverDomain):
                    MXLog.info("[DecideHomeServerScreen] requestForHomeserver \(domain) returned domain -> \(homeserverDomain)")
                    if Task.isCancelled {
                        return
                    }
                    await initAuthenticationService(for: homeserverDomain, loginHint: self.context.username)
                    // exit method now that AuthenticationService is inited.
                    return
                case .failure(let error):
                    MXLog.error("[DecideHomeServerScreen] requestForHomeserver \(domain) returned error -> \(error)")
                }
            }
            
            if Task.isCancelled {
                return
            }
            // No homeserver returned a domain for the email specified. Throw error.
            MXLog.error("[DecideHomeServerScreen] No homeserver returned a domain for the email \(self.context.username).")
            handleError(.tchapGetInstanceError)
        }
    }
    
    private func requestHomeserverForInfo(homeserver: String, forEmail: String) async -> Result<String, DecideHomeServerScreenErrorType> {
        let config = TchapGetInstanceConfig(homeServer: homeserver, userAgent: UserAgentBuilder.makeASCIIUserAgent())
        do {
            let tchapInstance = try tchapGetInstance(config: config, forEmail: forEmail)
            // Reject login attempt if returned instance in not in a listed account provider.
            if !accountProviders.contains(tchapInstance) {
                return .failure(.tchapGetInstanceError)
            }
            return .success(tchapInstance)
        } catch {
            return .failure(.tchapGetInstanceError)
        }
    }
    
    /// Initialize the Authentication service with the returned homeServer.
    private func initAuthenticationService(for homeserverDomain: String, loginHint: String) async {
        // Try to configure the Authentication Service to use the selected Homeserver.
        // Pass the Authentication service the desired flow: .login or .register
        switch await authenticationService.configure(for: homeserverDomain, flow: authenticationFlow) {
        case .success:
            if authenticationService.homeserver.value.loginMode.supportsOIDCFlow {
                switch await prepareOIDCFlow() {
                case .success((let oidcData, let window)):
                    actionsSubject.send(.authenticationServiceConfiguredForOIDC(data: oidcData, window: window))
                case .failure(let error):
                    handleError(error)
                    MXLog.error("[DecideHomeServerScreen] initAuthenticationService error: can't prepare OIDC flow")
                }
            } else if authenticationService.homeserver.value.loginMode == .password {
                // Redirect to Login flow.
                // Should not occur: TchapX only supports OIDC / MAS.
                actionsSubject.send(.authenticationServiceConfiguredForLogin(loginHint: loginHint))
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

    /// Request the OIDC server with the user email to prepare OIDC data.
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
        state.blockUserInteraction = true
    }
    
    /// Processes an error to either update the flow or display it to the user.
    private func handleError(_ error: DecideHomeServerScreenErrorType) {
        MXLog.info("[DecideHomeServerScreen] Error occurred: \(error)")
        resetLoadingState()
        
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
