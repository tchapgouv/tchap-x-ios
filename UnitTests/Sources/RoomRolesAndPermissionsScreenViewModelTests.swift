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
struct RoomRolesAndPermissionsScreenViewModelTests {
    var viewModel: RoomRolesAndPermissionsScreenViewModelProtocol!
    var roomProxy: JoinedRoomProxyMock!

    var context: RoomRolesAndPermissionsScreenViewModelType.Context {
        viewModel.context
    }

    @Test
    mutating func emptyCounters() {
        setup(members: .allMembers)

        #expect(context.viewState.administratorCount == 0)
        #expect(context.viewState.moderatorCount == 0)
    }

    @Test
    mutating func filledCounters() {
        setup(members: .allMembersAsAdmin)

        #expect(context.viewState.administratorCount == 2)
        #expect(context.viewState.moderatorCount == 1)
    }
    
    @Test
    mutating func resetPermissions() async throws {
        setup(members: .allMembersAsAdmin)

        context.send(viewAction: .reset)
        #expect(context.alertInfo != nil)

        context.alertInfo?.primaryButton.action?()
        
        try await Task.sleep(for: .milliseconds(100))
        
        #expect(roomProxy.resetPowerLevelsCalled)
    }
    
    @Test
    mutating func demoteToModerator() async throws {
        setup(members: .allMembersAsAdmin)

        context.send(viewAction: .editOwnUserRole)
<<<<<<< HEAD
        XCTAssertNotNil(context.alertInfo)
        
        context.alertInfo?.verticalButtons?.first {
            // Tchap: adapt test
//            $0.title.localizedStandardContains("moderator")
            $0.title.localizedStandardContains("moderator") || $0.title.localizedStandardContains("modérateur")
        }?.action?()
        
=======
        #expect(context.alertInfo != nil)

        context.alertInfo?.verticalButtons?.first { $0.title.localizedStandardContains("moderator") }?.action?()

>>>>>>> release/26.03.0
        try await Task.sleep(for: .milliseconds(100))

        #expect(roomProxy.updatePowerLevelsForUsersCalled)
        #expect(roomProxy.updatePowerLevelsForUsersReceivedUpdates?.first?.powerLevel == RoomRole.moderator.powerLevelValue)
    }
    
    @Test
    mutating func demoteToMember() async throws {
        setup(members: .allMembersAsAdmin)

        context.send(viewAction: .editOwnUserRole)
<<<<<<< HEAD
        XCTAssertNotNil(context.alertInfo)
        
        context.alertInfo?.verticalButtons?.first {
            // Tchap: adapt test
//            $0.title.localizedStandardContains("member")
            $0.title.localizedStandardContains("member") || $0.title.localizedStandardContains("membre")
        }?.action?()
        
=======
        #expect(context.alertInfo != nil)

        context.alertInfo?.verticalButtons?.first { $0.title.localizedStandardContains("member") }?.action?()

>>>>>>> release/26.03.0
        try await Task.sleep(for: .milliseconds(100))

        #expect(roomProxy.updatePowerLevelsForUsersCalled)
        #expect(roomProxy.updatePowerLevelsForUsersReceivedUpdates?.first?.powerLevel == RoomRole.user.powerLevelValue)
    }

    // MARK: - Helpers

    private mutating func setup(members: [RoomMemberProxyMock]) {
        roomProxy = JoinedRoomProxyMock(.init(members: members))
        viewModel = RoomRolesAndPermissionsScreenViewModel(roomProxy: roomProxy,
                                                           userIndicatorController: UserIndicatorControllerMock(),
                                                           analytics: ServiceLocator.shared.analytics)
    }
}
