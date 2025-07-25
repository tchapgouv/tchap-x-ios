//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import XCTest

import Combine

// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
#endif

@MainActor
class RoomFlowCoordinatorTests: XCTestCase {
    var clientProxy: ClientProxyMock!
    var timelineControllerFactory: TimelineControllerFactoryMock!
    var roomFlowCoordinator: RoomFlowCoordinator!
    var navigationStackCoordinator: NavigationStackCoordinator!
    var cancellables = Set<AnyCancellable>()
    
    func testRoomPresentation() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .room(roomID: "1", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        
        try await clearRoute(expectedActions: [.finished])
        XCTAssertNil(navigationStackCoordinator.rootCoordinator)
    }
    
    func testRoomDetailsPresentation() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .roomDetails(roomID: "1"))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomDetailsScreenCoordinator)
        
        try await clearRoute(expectedActions: [.finished])
        XCTAssertNil(navigationStackCoordinator.rootCoordinator)
    }
    
    func testNoOp() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .roomDetails(roomID: "1"))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomDetailsScreenCoordinator)
        let detailsCoordinator = navigationStackCoordinator.rootCoordinator
        
        roomFlowCoordinator.handleAppRoute(.roomDetails(roomID: "1"), animated: true)
        await Task.yield()
        
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomDetailsScreenCoordinator)
        XCTAssert(navigationStackCoordinator.rootCoordinator === detailsCoordinator)
    }
    
    func testPushDetails() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .room(roomID: "1", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        try await process(route: .roomDetails(roomID: "1"))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        XCTAssert(navigationStackCoordinator.stackCoordinators.first is RoomDetailsScreenCoordinator)
    }
    
    func testChildRoomFlow() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .room(roomID: "1", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        try await process(route: .childRoom(roomID: "2", via: []))
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        XCTAssert(navigationStackCoordinator.stackCoordinators.first is RoomScreenCoordinator)
        
        try await process(route: .childRoom(roomID: "3", via: []))
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 2)
        XCTAssert(navigationStackCoordinator.stackCoordinators.first is RoomScreenCoordinator)
        XCTAssert(navigationStackCoordinator.stackCoordinators.last is RoomScreenCoordinator)
        
        try await clearRoute(expectedActions: [.finished])
        XCTAssertNil(navigationStackCoordinator.rootCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
    }
    
    /// Tests the child flow teardown in isolation of it's parent.
    func testChildFlowTearDown() async throws {
        await setupRoomFlowCoordinator(asChildFlow: true)
        navigationStackCoordinator.setRootCoordinator(BlankFormCoordinator())
        
        try await process(route: .room(roomID: "1", via: []))
        try await process(route: .roomDetails(roomID: "1"))
        XCTAssertTrue(navigationStackCoordinator.rootCoordinator is BlankFormCoordinator, "A child room flow should push onto the stack, leaving the root alone.")
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 2)
        XCTAssertTrue(navigationStackCoordinator.stackCoordinators.first is RoomScreenCoordinator)
        XCTAssertTrue(navigationStackCoordinator.stackCoordinators.last is RoomDetailsScreenCoordinator)
        
        try await clearRoute(expectedActions: [.finished])
        XCTAssertTrue(navigationStackCoordinator.rootCoordinator is BlankFormCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 2, "A child room flow should leave its parent to clean up the stack.")
        XCTAssertTrue(navigationStackCoordinator.stackCoordinators.first is RoomScreenCoordinator, "A child room flow should leave its parent to clean up the stack.")
        XCTAssertTrue(navigationStackCoordinator.stackCoordinators.last is RoomDetailsScreenCoordinator, "A child room flow should leave its parent to clean up the stack.")
    }
    
    func testChildRoomMemberDetails() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .room(roomID: "1", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        try await process(route: .childRoom(roomID: "2", via: []))
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        XCTAssert(navigationStackCoordinator.stackCoordinators.first is RoomScreenCoordinator)
        
        try await process(route: .roomMemberDetails(userID: RoomMemberProxyMock.mockMe.userID))
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 2)
        XCTAssert(navigationStackCoordinator.stackCoordinators.first is RoomScreenCoordinator)
        XCTAssert(navigationStackCoordinator.stackCoordinators.last is RoomMemberDetailsScreenCoordinator)
    }
    
    func testChildRoomIgnoresDirectDuplicate() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .room(roomID: "1", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        try await process(route: .childRoom(roomID: "1", via: []))
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0,
                       "A room flow shouldn't present a direct child for the same room.")
        
        try await process(route: .childRoom(roomID: "2", via: []))
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        XCTAssert(navigationStackCoordinator.stackCoordinators.first is RoomScreenCoordinator)
        
        try await process(route: .childRoom(roomID: "1", via: []))
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 2,
                       "Presenting the same room multiple times should be allowed when it's not a direct child of itself.")
        XCTAssert(navigationStackCoordinator.stackCoordinators.first is RoomScreenCoordinator)
        XCTAssert(navigationStackCoordinator.stackCoordinators.last is RoomScreenCoordinator)
    }
    
    func testRoomMembershipInvite() async throws {
        await setupRoomFlowCoordinator(roomType: .invited(roomID: "InvitedRoomID"))
        
        try await process(route: .room(roomID: "InvitedRoomID", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is JoinRoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        try await clearRoute(expectedActions: [.finished])
        XCTAssertNil(navigationStackCoordinator.rootCoordinator)
        
        await setupRoomFlowCoordinator(roomType: .invited(roomID: "InvitedRoomID"))
        
        try await process(route: .room(roomID: "InvitedRoomID", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is JoinRoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        // "Join" the room
        clientProxy.roomForIdentifierClosure = { _ in
            .joined(JoinedRoomProxyMock(.init()))
        }
        
        try await process(route: .room(roomID: "InvitedRoomID", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
    }
    
    func testChildRoomMembershipInvite() async throws {
        await setupRoomFlowCoordinator(asChildFlow: true, roomType: .invited(roomID: "InvitedRoomID"))
        navigationStackCoordinator.setRootCoordinator(BlankFormCoordinator())
        
        try await process(route: .room(roomID: "InvitedRoomID", via: []))
        XCTAssertTrue(navigationStackCoordinator.rootCoordinator is BlankFormCoordinator, "A child room flow should push onto the stack, leaving the root alone.")
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        XCTAssertTrue(navigationStackCoordinator.stackCoordinators.last is JoinRoomScreenCoordinator)
        
        try await clearRoute(expectedActions: [.finished])
        XCTAssertNil(navigationStackCoordinator.stackCoordinators.last, "A child room flow should remove the join room scren on dismissal")
        
        await setupRoomFlowCoordinator(asChildFlow: true, roomType: .invited(roomID: "InvitedRoomID"))
        navigationStackCoordinator.setRootCoordinator(BlankFormCoordinator())
        
        try await process(route: .room(roomID: "InvitedRoomID", via: []))
        XCTAssertTrue(navigationStackCoordinator.rootCoordinator is BlankFormCoordinator, "A child room flow should push onto the stack, leaving the root alone.")
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        XCTAssertTrue(navigationStackCoordinator.stackCoordinators.last is JoinRoomScreenCoordinator)
        
        // "Join" the room
        clientProxy.roomForIdentifierClosure = { _ in
            .joined(JoinedRoomProxyMock(.init()))
        }
        
        try await process(route: .room(roomID: "InvitedRoomID", via: []))
        XCTAssertTrue(navigationStackCoordinator.rootCoordinator is BlankFormCoordinator, "A child room flow should push onto the stack, leaving the root alone.")
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        XCTAssertTrue(navigationStackCoordinator.stackCoordinators.last is RoomScreenCoordinator)
    }
    
    func testEventRoute() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .event(eventID: "1", roomID: "1", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        try await process(route: .childEvent(eventID: "2", roomID: "1", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        try await process(route: .childEvent(eventID: "3", roomID: "2", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        XCTAssert(navigationStackCoordinator.stackCoordinators.first is RoomScreenCoordinator)
    }
    
    func testShareMediaRoute() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .room(roomID: "1", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        let sharePayload: ShareExtensionPayload = .mediaFile(roomID: "1", mediaFile: .init(url: .picturesDirectory, suggestedName: nil))
        try await process(route: .share(sharePayload))
        
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        XCTAssertTrue((navigationStackCoordinator.sheetCoordinator as? NavigationStackCoordinator)?.rootCoordinator is MediaUploadPreviewScreenCoordinator)
        
        try await process(route: .childRoom(roomID: "2", via: []))
        XCTAssertNil(navigationStackCoordinator.sheetCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        
        try await process(route: .share(sharePayload))
        
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        XCTAssertTrue((navigationStackCoordinator.sheetCoordinator as? NavigationStackCoordinator)?.rootCoordinator is MediaUploadPreviewScreenCoordinator)
    }
    
    func testShareTextRoute() async throws {
        await setupRoomFlowCoordinator()
        
        try await process(route: .room(roomID: "1", via: []))
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        let sharePayload: ShareExtensionPayload = .text(roomID: "1", text: "Important text")
        try await process(route: .share(sharePayload))
        
        XCTAssert(navigationStackCoordinator.rootCoordinator is RoomScreenCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        
        XCTAssertNil(navigationStackCoordinator.sheetCoordinator, "The media upload sheet shouldn't be shown when sharing text.")
        
        try await process(route: .childRoom(roomID: "2", via: []))
        XCTAssertNil(navigationStackCoordinator.sheetCoordinator)
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 1)
        
        try await process(route: .share(sharePayload))
        
        XCTAssertEqual(navigationStackCoordinator.stackCoordinators.count, 0)
        XCTAssertNil(navigationStackCoordinator.sheetCoordinator, "The media upload sheet shouldn't be shown when sharing text.")
    }
    
    func testLeavingRoom() async throws {
        await setupRoomFlowCoordinator()
        
        var configuration = JoinedRoomProxyMockConfiguration()
        let roomProxy = JoinedRoomProxyMock(configuration)
        
        let roomInfoSubject = CurrentValueSubject<RoomInfoProxyProtocol, Never>(RoomInfoProxyMock(configuration))
        roomProxy.infoPublisher = roomInfoSubject.asCurrentValuePublisher()
        
        clientProxy.roomForIdentifierClosure = { _ in
            .joined(roomProxy)
        }
        
        try await process(route: .room(roomID: "1", via: []))
        
        let fulfillment = deferFulfillment(roomFlowCoordinator.actions) { action in
            action == .finished
        }
        
        configuration.membership = .left
        roomInfoSubject.send(RoomInfoProxyMock(configuration))
        
        try await fulfillment.fulfill()
    }
    
    // MARK: - Private
    
    private func process(route: AppRoute) async throws {
        roomFlowCoordinator.handleAppRoute(route, animated: true)
        // A single yield isn't enough when creating the new flow coordinator.
        try await Task.sleep(for: .milliseconds(100))
    }
    
    private func clearRoute(expectedActions: [RoomFlowCoordinatorAction]) async throws {
        try await processRouteOrClear(route: nil, expectedActions: expectedActions)
    }
    
    private func process(route: AppRoute, expectedActions: [RoomFlowCoordinatorAction]) async throws {
        try await processRouteOrClear(route: route, expectedActions: expectedActions)
    }
    
    private func processRouteOrClear(route: AppRoute?, expectedActions: [RoomFlowCoordinatorAction]) async throws {
        guard !expectedActions.isEmpty else {
            return
        }
        
        var fulfillments = [DeferredFulfillment<RoomFlowCoordinatorAction>]()
        
        for expectedAction in expectedActions {
            fulfillments.append(deferFulfillment(roomFlowCoordinator.actions) { action in
                action == expectedAction
            })
        }
        
        if let route {
            roomFlowCoordinator.handleAppRoute(route, animated: true)
        } else {
            roomFlowCoordinator.clearRoute(animated: true)
        }
        
        for fulfillment in fulfillments {
            try await fulfillment.fulfill()
        }
    }
    
    private func setupRoomFlowCoordinator(asChildFlow: Bool = false, roomType: RoomType? = nil) async {
        cancellables.removeAll()
        clientProxy = ClientProxyMock(.init(userID: "hi@bob", roomSummaryProvider: RoomSummaryProviderMock(.init(state: .loaded(.mockRooms)))))
        timelineControllerFactory = TimelineControllerFactoryMock(.init())
        
        clientProxy.roomPreviewForIdentifierViaClosure = { [roomType] roomID, _ in
            switch roomType {
            case .invited:
                return .success(RoomPreviewProxyMock.invited(roomID: roomID))
            default:
                fatalError("Something isn't set up right")
            }
        }
        
        let navigationSplitCoordinator = NavigationSplitCoordinator(placeholderCoordinator: PlaceholderScreenCoordinator())
        navigationStackCoordinator = NavigationStackCoordinator()
        navigationSplitCoordinator.setDetailCoordinator(navigationStackCoordinator)
        
        let roomID = switch roomType {
        case .invited(let roomID):
            roomID
        default:
            "1"
        }
        
        roomFlowCoordinator = await RoomFlowCoordinator(roomID: roomID,
                                                        userSession: UserSessionMock(.init(clientProxy: clientProxy)),
                                                        isChildFlow: asChildFlow,
                                                        timelineControllerFactory: timelineControllerFactory,
                                                        navigationStackCoordinator: navigationStackCoordinator,
                                                        emojiProvider: EmojiProvider(appSettings: ServiceLocator.shared.settings),
                                                        ongoingCallRoomIDPublisher: .init(.init(nil)),
                                                        appMediator: AppMediatorMock.default,
                                                        appSettings: ServiceLocator.shared.settings,
                                                        appHooks: AppHooks(),
                                                        analytics: ServiceLocator.shared.analytics,
                                                        userIndicatorController: ServiceLocator.shared.userIndicatorController)
    }
}

private enum RoomType {
    case invited(roomID: String)
}
