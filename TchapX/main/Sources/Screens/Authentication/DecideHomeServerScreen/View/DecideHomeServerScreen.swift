//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

struct DecideHomeServerScreen: View {
    /// The focus state of the username text field.
    @FocusState private var isUsernameFocused: Bool
    
    @Bindable var context: DecideHomeServerScreenViewModel.Context
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                header
                    .padding(.top, UIConstants.titleTopPaddingToNavigationBar)
                    .padding(.bottom, 32)
                
                loginForm
            }
            .readableFrame()
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .background(Color.compound.bgCanvasDefault.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .alert(item: $context.alertInfo)
        .introspect(.window, on: .supportedVersions) { window in
            context.send(viewAction: .updateWindow(window))
        }
        .onAppear {
            context.send(viewAction: .resetLoadingState)
        }
    }
    
    /// The header containing the title and icon.
    var header: some View {
        VStack(spacing: 8) {
            BigIcon(icon: \.lockSolid)
                .padding(.bottom, 8)
            // Tchap: [Beta DINUM] Customize login title
            Text(context.viewState.authenticationFlow == .register ? TchapL10n.screenLoginTitleRegister : TchapL10n.screenLoginTitleLogin)
                .font(.compound.headingMDBold)
                .multilineTextAlignment(.center)
                .foregroundColor(.compound.textPrimary)
                .padding(.bottom, 8)
            // Tchap: [Beta DINUM] Add Tchap description
            Text(TchapL10n.screenLoginDescriptionWithTchap)
                .font(.compound.bodyMD)
                .multilineTextAlignment(.center)
                .foregroundColor(.compound.textPrimary)
        }
        .padding(.horizontal, 16)
    }
    
    /// The form with text fields for username and password, along with a submit button.
    var loginForm: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(TchapL10n.screenLoginInputEmailLabel)
                .font(.compound.bodySM)
                .foregroundColor(.compound.textPrimary)
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            
            TextField(text: $context.username) {
                // Tchap: Hint as "Email" rather than "User name".
                Text(TchapL10n.commonEmail).foregroundColor(.compound.textSecondary)
            }
            .focused($isUsernameFocused)
            .textFieldStyle(.element(accessibilityIdentifier: A11yIdentifiers.loginScreen.emailUsername))
            .disableAutocorrection(true)
            .textContentType(.username)
            .autocapitalization(.none)
            .submitLabel(.next)
            .onSubmit { submit() }
            .padding(.bottom, 20)
            .disabled(context.viewState.blockUserInteraction)
            
            Spacer().frame(height: 32)

            Button(action: submit) {
                Text(L10n.actionContinue)
            }
            .buttonStyle(.compound(.primary))
            .disabled(!context.viewState.canSubmit)
            .accessibilityIdentifier(A11yIdentifiers.loginScreen.continue)
        }
    }
    
    /// Sends the `next` view action so long as valid credentials have been input.
    private func submit() {
        guard context.viewState.canSubmit else { return }
        context.send(viewAction: .requestForHomeserver)
        isUsernameFocused = false
    }
}

// MARK: - Previews

struct DecideHomeServerScreen_Previews: PreviewProvider, TestablePreview {
    static let viewModel = makeViewModel()
    static let credentialsViewModel = makeViewModel(withCredentials: true)
    static let unconfiguredViewModel = makeViewModel(homeserverAddress: "somethingtofailconfiguration")
    
    static var previews: some View {
        NavigationStack {
            DecideHomeServerScreen(context: viewModel.context)
        }
        .previewDisplayName("Initial State")
        
        NavigationStack {
            DecideHomeServerScreen(context: credentialsViewModel.context)
        }
        .previewDisplayName("Credentials Entered")
        
        NavigationStack {
            DecideHomeServerScreen(context: unconfiguredViewModel.context)
        }
        .previewDisplayName("Unsupported")
    }
    
    static func makeViewModel(homeserverAddress: String = "example.com", withCredentials: Bool = false) -> DecideHomeServerScreenViewModel {
        let authenticationService = AuthenticationService.mock
        
        Task { await authenticationService.configure(for: homeserverAddress, flow: .login) }
        
        let viewModel = DecideHomeServerScreenViewModel(authenticationService: authenticationService,
                                                        authenticationFlow: .login,
                                                        loginHint: nil,
                                                        accountProviders: AppSettings().accountProviders,
                                                        userIndicatorController: UserIndicatorControllerMock(),
                                                        appSettings: ServiceLocator.shared.settings,
                                                        analytics: ServiceLocator.shared.analytics)
        
        if withCredentials {
            viewModel.context.username = "alice"
        }
        
        return viewModel
    }
}
