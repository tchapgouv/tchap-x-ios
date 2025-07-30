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
class BlockedUsersScreenViewModelTests: XCTestCase {
    func testInitialState() async throws {
        let clientProxy = ClientProxyMock(.init(userID: RoomMemberProxyMock.mockMe.userID))
        
        let viewModel = BlockedUsersScreenViewModel(hideProfiles: true,
                                                    clientProxy: clientProxy,
                                                    mediaProvider: MediaProviderMock(configuration: .init()),
                                                    userIndicatorController: ServiceLocator.shared.userIndicatorController)
        
        let deferred = deferFailure(viewModel.context.observe(\.viewState.blockedUsers), timeout: 1) { $0.contains { $0.displayName != nil } }
        try await deferred.fulfill()
        
        XCTAssertFalse(viewModel.context.viewState.blockedUsers.isEmpty)
        XCTAssertFalse(clientProxy.profileForCalled)
    }
    
    func testProfiles() async throws {
        let clientProxy = ClientProxyMock(.init(userID: RoomMemberProxyMock.mockMe.userID))
        
        let viewModel = BlockedUsersScreenViewModel(hideProfiles: false,
                                                    clientProxy: clientProxy,
                                                    mediaProvider: MediaProviderMock(configuration: .init()),
                                                    userIndicatorController: ServiceLocator.shared.userIndicatorController)
        
        let deferred = deferFulfillment(viewModel.context.observe(\.viewState.blockedUsers)) { $0.contains { $0.displayName != nil } }
        try await deferred.fulfill()
        
        XCTAssertFalse(viewModel.context.viewState.blockedUsers.isEmpty)
        XCTAssertTrue(clientProxy.profileForCalled)
    }
}
