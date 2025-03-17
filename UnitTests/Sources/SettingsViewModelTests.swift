//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Combine
import XCTest

// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
#endif

@MainActor
class SettingsScreenViewModelTests: XCTestCase {
    var viewModel: SettingsScreenViewModelProtocol!
    var context: SettingsScreenViewModelType.Context!
    var cancellables = Set<AnyCancellable>()
    
    @MainActor override func setUpWithError() throws {
        cancellables.removeAll()
        let userSession = UserSessionMock(.init(clientProxy: ClientProxyMock(.init(userID: ""))))
        // Tchap: specify target for unit tests
        #if IS_TCHAP_UNIT_TESTS
        viewModel = SettingsScreenViewModel(userSession: userSession, appSettings: AppSettings())
        #else
        viewModel = SettingsScreenViewModel(userSession: userSession)
        #endif
        context = viewModel.context
    }

    @MainActor func testLogout() async throws {
        var correctResult = false
        
        viewModel.actions
            .sink { action in
                switch action {
                case .logout:
                    correctResult = true
                default:
                    break
                }
            }
            .store(in: &cancellables)

        context.send(viewAction: .logout)
        await Task.yield()
        XCTAssert(correctResult)
    }

    func testReportBug() async throws {
        var correctResult = false
        viewModel.actions
            .sink { action in
                correctResult = action == .reportBug
            }
            .store(in: &cancellables)
        
        context.send(viewAction: .reportBug)
        await Task.yield()
        XCTAssert(correctResult)
    }
    
    func testAnalytics() async throws {
        var correctResult = false
        viewModel.actions
            .sink { action in
                correctResult = action == .analytics
            }
            .store(in: &cancellables)
        
        context.send(viewAction: .analytics)
        await Task.yield()
        XCTAssert(correctResult)
    }
}
