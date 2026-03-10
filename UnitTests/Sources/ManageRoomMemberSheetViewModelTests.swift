//
// Copyright 2025 Element Creations Ltd.
// Copyright 2025 New Vector Ltd.
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
struct ManageRoomMemberSheetViewModelTests {
    private var viewModel: ManageRoomMemberSheetViewModel!
    private var context: ManageRoomMemberSheetViewModel.Context! {
        viewModel.context
    }
    
    @Test
    mutating func kick() async throws {
        let testReason = "Kick Test"
        let roomProxy = JoinedRoomProxyMock(.init(members: [RoomMemberProxyMock.mockAdmin, RoomMemberProxyMock.mockAlice]))
        var kickCalled = false
        roomProxy.kickUserReasonClosure = { userID, reason in
            kickCalled = true
            #expect(userID == RoomMemberProxyMock.mockAlice.userID)
            #expect(reason == testReason)
            return .success(())
        }
        
        viewModel = ManageRoomMemberSheetViewModel(memberDetails: .memberDetails(roomMember: .init(withProxy: RoomMemberProxyMock.mockAlice)),
                                                   permissions: .init(canKick: true, canBan: true, ownPowerLevel: RoomMemberProxyMock.mockAdmin.powerLevel),
                                                   roomProxy: roomProxy,
                                                   userIndicatorController: UserIndicatorControllerMock(),
                                                   analyticsService: ServiceLocator.shared.analytics,
                                                   mediaProvider: MediaProviderMock(configuration: .init()))
        
        let deferred = deferFulfillment(context.observe(\.viewState.bindings.alertInfo)) { $0 != nil }
        let deferredAction = deferFulfillment(viewModel.actions) { action in
            action == .dismiss(shouldShowDetails: false)
        }
        context.send(viewAction: .kick)
        try await deferred.fulfill()
        
        context.alertInfo?.textFields?[0].text.wrappedValue = testReason
        context.alertInfo?.secondaryButton?.action?()
        try await deferredAction.fulfill()
        #expect(kickCalled)
    }
    
    @Test
    mutating func ban() async throws {
        let testReason = "Ban Test"
        let roomProxy = JoinedRoomProxyMock(.init(members: [RoomMemberProxyMock.mockAdmin, RoomMemberProxyMock.mockAlice]))
        var banCalled = false
        roomProxy.banUserReasonClosure = { userID, reason in
            banCalled = true
            #expect(userID == RoomMemberProxyMock.mockAlice.userID)
            #expect(reason == testReason)
            return .success(())
        }
        
        viewModel = ManageRoomMemberSheetViewModel(memberDetails: .memberDetails(roomMember: .init(withProxy: RoomMemberProxyMock.mockAlice)),
                                                   permissions: .init(canKick: true, canBan: true, ownPowerLevel: RoomMemberProxyMock.mockAdmin.powerLevel),
                                                   roomProxy: roomProxy,
                                                   userIndicatorController: UserIndicatorControllerMock(),
                                                   analyticsService: ServiceLocator.shared.analytics,
                                                   mediaProvider: MediaProviderMock(configuration: .init()))
        
        let deferred = deferFulfillment(context.observe(\.viewState.bindings.alertInfo)) { $0 != nil }
        context.send(viewAction: .ban)
        try await deferred.fulfill()
        
        let deferredAction = deferFulfillment(viewModel.actions) { action in
            action == .dismiss(shouldShowDetails: false)
        }
        context.alertInfo?.textFields?[0].text.wrappedValue = testReason
        context.alertInfo?.secondaryButton?.action?()
        try await deferredAction.fulfill()
        #expect(banCalled)
    }
    
    @Test
    mutating func displayDetails() async throws {
        let roomProxy = JoinedRoomProxyMock(.init(members: [RoomMemberProxyMock.mockAdmin, RoomMemberProxyMock.mockAlice]))
        viewModel = ManageRoomMemberSheetViewModel(memberDetails: .memberDetails(roomMember: .init(withProxy: RoomMemberProxyMock.mockAlice)),
                                                   permissions: .init(canKick: true, canBan: true, ownPowerLevel: RoomMemberProxyMock.mockAdmin.powerLevel),
                                                   roomProxy: roomProxy,
                                                   userIndicatorController: UserIndicatorControllerMock(),
                                                   analyticsService: ServiceLocator.shared.analytics,
                                                   mediaProvider: MediaProviderMock(configuration: .init()))
        
        let deferredAction = deferFulfillment(viewModel.actions) { action in
            action == .dismiss(shouldShowDetails: true)
        }
        context.send(viewAction: .displayDetails)
        try await deferredAction.fulfill()
        #expect(context.alertInfo == nil)
    }
}
