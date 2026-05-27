/*
 * MIT License
 *
 * Copyright (c) 2026. DINUM
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
 * OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Compound
import SwiftUI

struct AccountExpiredScreen: View {
    @Bindable var context: AccountExpiredScreenViewModel.Context

    var body: some View {
        FullscreenDialog(topPadding: UIConstants.startScreenBreakerScreenTopPadding) {
            mainContent
        } bottomContent: {
            buttons
        }
        .background()
        .backgroundStyle(.compound.bgCanvasDefault)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .interactiveDismissDisabled()
        .alert(item: $context.alertInfo)
    }

    private var mainContent: some View {
        VStack(spacing: 8) {
            BigIcon(icon: \.calendar, style: .alertSolid)
                .padding(.bottom, 8)

            Text(TchapL10n.screenAccountExpiredTitle)
                .font(.compound.headingMDBold)
                .multilineTextAlignment(.center)
                .foregroundColor(.compound.textPrimary)

            Text(TchapL10n.screenAccountExpiredDescription)
                .font(.compound.bodyMD)
                .multilineTextAlignment(.center)
                .foregroundColor(.compound.textSecondary)

            Text(learnMoreLink)
                .textCase(nil)
                .compoundListSectionHeader()
        }
    }

    private var buttons: some View {
        VStack(spacing: 16) {
            Button {
                context.send(viewAction: .resyncAccount)
            } label: {
                HStack(spacing: 8) {
                    if context.viewState.isResyncing {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    Text(L10n.actionContinue)
                }
            }
            .buttonStyle(.compound(.primary))
            .disabled(context.viewState.isResyncing || context.viewState.isSendingEmail)

            Button {
                context.send(viewAction: .sendEmail)
            } label: {
                HStack(spacing: 8) {
                    if context.viewState.isSendingEmail {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    Text(TchapL10n.screenAccountExpiredSendEmail)
                        .font(.compound.bodyLGSemibold)
                }
                .padding(14)
            }
            .disabled(context.viewState.isResyncing || context.viewState.isSendingEmail)
        }
    }

    private var learnMoreLink: AttributedString {
        var link = AttributedString(L10n.actionLearnMore)
        link.underlineStyle = .single
        link.link = context.viewState.tchapAccountExpiredFaqURL
        link.foregroundColor = UIColor(.compound.textSecondary)

        return link
    }
}

// MARK: - Previews

struct AccountExpiredScreen_Previews: PreviewProvider, TestablePreview {
    static let viewModel = makeViewModel()
    static var previews: some View {
        AccountExpiredScreen(context: viewModel.context)
    }

    static func makeViewModel() -> AccountExpiredScreenViewModel {
        let userSession = UserSessionMock(.init(clientProxy: ClientProxyMock(.init(userID: "@userid:example.com", deviceID: "AAAAAAAAAAA"))))
        let appSettings = AppSettings()
        return AccountExpiredScreenViewModel(appSettings: appSettings, clientProxy: userSession.clientProxy)
    }
}
