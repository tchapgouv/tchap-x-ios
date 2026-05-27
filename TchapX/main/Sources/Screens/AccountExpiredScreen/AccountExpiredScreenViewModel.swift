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

import Combine
import SwiftUI

typealias AccountExpiredScreenViewModelType = StateStoreViewModelV2<AccountExpiredScreenViewState, AccountExpiredScreenViewAction>

class AccountExpiredScreenViewModel: AccountExpiredScreenViewModelType, AccountExpiredScreenViewModelProtocol {
    private let clientProxy: ClientProxyProtocol

    private let actionsSubject: PassthroughSubject<AccountExpiredScreenViewModelAction, Never> = .init()
    var actionsPublisher: AnyPublisher<AccountExpiredScreenViewModelAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }

    init(appSettings: AppSettings, clientProxy: ClientProxyProtocol) {
        self.clientProxy = clientProxy
        super.init(initialViewState: AccountExpiredScreenViewState(tchapAccountExpiredFaqURL: appSettings.tchapAccountExpiredFaqURL, bindings: .init()))
    }
    
    // MARK: - Public
    
    override func process(viewAction: AccountExpiredScreenViewAction) {
        MXLog.info("View model: received view action: \(viewAction)")
        
        switch viewAction {
        case .resyncAccount:
            Task { await resyncAccount() }
        case .sendEmail:
            Task { await sendEmail() }
        }
    }

    private func resyncAccount() async {
        guard !state.isResyncing else { return }
        state.isResyncing = true
        defer { state.isResyncing = false }

        clientProxy.startSync()

        // Wait for the account to no longer be expired.
        // If it succeeds, the flow coordinator will dismiss this screen.
        let didResync = await waitForAccountNotExpired(timeout: .milliseconds(250))

        if !didResync {
            state.bindings.alertInfo = .init(id: .resyncFailed,
                                             title: TchapL10n.screenAccountExpiredResyncErrorTitle,
                                             message: TchapL10n.screenAccountExpiredResyncErrorMessage,
                                             primaryButton: .init(title: L10n.actionOk, action: nil))
        }
    }

    private func waitForAccountNotExpired(timeout: Duration) async -> Bool {
        await withTaskGroup(of: Bool.self) { group in
            group.addTask { [clientProxy] in
                for await isExpired in clientProxy.accountExpiredSubjectPublisher.values where !isExpired {
                    return true
                }
                return false
            }

            group.addTask {
                try? await Task.sleep(for: timeout)
                return false
            }

            let result = await group.next() ?? false
            group.cancelAll()
            return result
        }
    }

    private func sendEmail() async {
        guard !state.isSendingEmail else { return }
        state.isSendingEmail = true
        defer { state.isSendingEmail = false }

        do {
            try await clientProxy.accountExpiredSendEmail()
        } catch {
            MXLog.error("Failed to send account expired email: \(error)")
            state.bindings.alertInfo = .init(id: .sendEmailFailed,
                                             title: TchapL10n.screenAccountExpiredSendEmailErrorTitle,
                                             message: TchapL10n.screenAccountExpiredSendEmailErrorMessage,
                                             primaryButton: .init(title: L10n.actionOk, action: nil))
        }
    }
}
