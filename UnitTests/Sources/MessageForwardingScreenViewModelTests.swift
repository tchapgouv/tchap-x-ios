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
class MessageForwardingScreenViewModelTests: XCTestCase {
    let forwardingItem = MessageForwardingItem(id: .event(uniqueID: .init("t1"), eventOrTransactionID: .eventID("t1")),
                                               roomID: "1",
                                               content: .init(noPointer: .init()))
    var viewModel: MessageForwardingScreenViewModelProtocol!
    var context: MessageForwardingScreenViewModelType.Context!
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        cancellables.removeAll()
        
        let clientProxy = ClientProxyMock(.init())
        clientProxy.roomForIdentifierClosure = { .joined(JoinedRoomProxyMock(.init(id: $0))) }
        
        viewModel = MessageForwardingScreenViewModel(forwardingItem: forwardingItem,
                                                     clientProxy: clientProxy,
                                                     roomSummaryProvider: RoomSummaryProviderMock(.init(state: .loaded(.mockRooms))),
                                                     userIndicatorController: UserIndicatorControllerMock(),
                                                     mediaProvider: MediaProviderMock(configuration: .init()))
        context = viewModel.context
    }
    
    func testInitialState() {
        XCTAssertNil(context.viewState.rooms.first { $0.id == forwardingItem.roomID }, "The source room ID shouldn't be shown")
    }
    
    func testRoomSelection() {
        context.send(viewAction: .selectRoom(roomID: "2"))
        XCTAssertEqual(context.viewState.selectedRoomID, "2")
    }
    
    func testSearching() async throws {
        let defered = deferFulfillment(context.$viewState) { state in
            state.rooms.count == 1
        }
        
        context.searchQuery = "Second"
            
        try await defered.fulfill()
    }
    
    func testForwarding() {
        context.send(viewAction: .selectRoom(roomID: "2"))
        XCTAssertEqual(context.viewState.selectedRoomID, "2")
        
        let expectation = expectation(description: "Wait for confirmation")
        
        viewModel.actions
            .sink { action in
                switch action {
                case .sent(let roomID):
                    XCTAssertEqual(roomID, "2")
                    expectation.fulfill()
                default:
                    break
                }
            }
            .store(in: &cancellables)
        
        context.send(viewAction: .send)
        
        waitForExpectations(timeout: 5.0)
    }
}
