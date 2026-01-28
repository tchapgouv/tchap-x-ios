//
// Copyright 2025 Element Creations Ltd.
// Copyright 2022-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
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
class CreateRoomScreenViewModelTests: XCTestCase {
    var viewModel: CreateRoomScreenViewModelProtocol!
    var clientProxy: ClientProxyMock!
    var userSession: UserSessionMock!
    
    private let usersSubject = CurrentValueSubject<[UserProfileProxy], Never>([])
    
    var context: CreateRoomScreenViewModel.Context {
        viewModel.context
    }
    
    override func setUpWithError() throws {
        clientProxy = ClientProxyMock(.init(userIDServerName: "matrix.org", userID: "@a:b.com"))
        clientProxy.roomForIdentifierClosure = { roomID in .joined(JoinedRoomProxyMock(.init(id: roomID))) }
        userSession = UserSessionMock(.init(clientProxy: clientProxy))
        ServiceLocator.shared.settings.knockingEnabled = true
        let viewModel = CreateRoomScreenViewModel(isSpace: false,
                                                  userSession: userSession,
                                                  analytics: ServiceLocator.shared.analytics,
                                                  userIndicatorController: UserIndicatorControllerMock(),
                                                  appSettings: ServiceLocator.shared.settings)
        self.viewModel = viewModel
    }
    
<<<<<<< HEAD
    func testDefaulSecurity() {
        // Tchap: handle `isRoomEncrypted` and `isFederated` additional properties
//        XCTAssertTrue(context.viewState.bindings.isRoomPrivate)
        XCTAssertTrue(context.viewState.bindings.isRoomPrivate && context.viewState.bindings.isRoomEncrypted && context.viewState.bindings.isRoomFederated)
=======
    override func tearDown() {
        AppSettings.resetAllSettings()
    }
    
    func testDefaultSecurity() {
        XCTAssertEqual(context.viewState.bindings.selectedAccessType, .private)
>>>>>>> release/26.01.0
    }
    
    func testCreateRoomRequirements() {
        XCTAssertFalse(context.viewState.canCreateRoom)
        context.send(viewAction: .updateRoomName("A"))
        XCTAssertTrue(context.viewState.canCreateRoom)
    }
    
    func testCreateRoom() async throws {
        // Given a form with a blank topic.
        context.send(viewAction: .updateRoomName("A"))
        context.roomTopic = ""
        context.selectedAccessType = .private
        XCTAssertTrue(context.viewState.canCreateRoom)
        
        // When creating the room.
<<<<<<< HEAD
        // Tchap: adapted test adding `isEncrypted`
        clientProxy.createRoomNameTopicIsRoomPrivateIsRoomEncryptedIsKnockingOnlyUserIDsAvatarURLAliasLocalPartReturnValue = .success("1")
=======
        clientProxy.createRoomNameTopicAccessTypeIsSpaceUserIDsAvatarURLAliasLocalPartReturnValue = .success("1")
>>>>>>> release/26.01.0
        let deferred = deferFulfillment(viewModel.actions) { action in
            guard case .createdRoom(let roomProxy) = action, roomProxy.id == "1" else { return false }
            return true
        }
        context.send(viewAction: .createRoom)
        try await deferred.fulfill()
        
        // Then the room should be created and a topic should not be set.
<<<<<<< HEAD
        // Tchap: adapted test adding `isEncrypted`
        XCTAssertTrue(clientProxy.createRoomNameTopicIsRoomPrivateIsRoomEncryptedIsKnockingOnlyUserIDsAvatarURLAliasLocalPartCalled)
        XCTAssertEqual(clientProxy.createRoomNameTopicIsRoomPrivateIsRoomEncryptedIsKnockingOnlyUserIDsAvatarURLAliasLocalPartReceivedArguments?.name, "A")
        XCTAssertNil(clientProxy.createRoomNameTopicIsRoomPrivateIsRoomEncryptedIsKnockingOnlyUserIDsAvatarURLAliasLocalPartReceivedArguments?.topic,
=======
        XCTAssertTrue(clientProxy.createRoomNameTopicAccessTypeIsSpaceUserIDsAvatarURLAliasLocalPartCalled)
        XCTAssertEqual(clientProxy.createRoomNameTopicAccessTypeIsSpaceUserIDsAvatarURLAliasLocalPartReceivedArguments?.name, "A")
        XCTAssertNil(clientProxy.createRoomNameTopicAccessTypeIsSpaceUserIDsAvatarURLAliasLocalPartReceivedArguments?.topic,
>>>>>>> release/26.01.0
                     "The topic should be sent as nil when it is empty.")
    }
    
    func testCreateKnockingRoom() async {
        context.send(viewAction: .updateRoomName("A"))
        context.roomTopic = "B"
        context.selectedAccessType = .askToJoin
        // When setting the room as private we always reset the knocking state to the default value of false
        // so we need to wait a main actor cycle to ensure the view state is updated
        await Task.yield()
        XCTAssertTrue(context.viewState.canCreateRoom)
        
        let expectation = expectation(description: "Wait for the room to be created")
<<<<<<< HEAD
        // Tchap: adapted test adding `isEncrypted`
//        clientProxy.createRoomNameTopicIsRoomPrivateIsKnockingOnlyUserIDsAvatarURLAliasLocalPartClosure = { _, _, isPrivate, isKnockingOnly, _, _, localAliasPart in
        clientProxy.createRoomNameTopicIsRoomPrivateIsRoomEncryptedIsKnockingOnlyUserIDsAvatarURLAliasLocalPartClosure = { _, _, isPrivate, _, isKnockingOnly, _, _, localAliasPart in
            XCTAssertTrue(isKnockingOnly)
            XCTAssertFalse(isPrivate)
=======
        clientProxy.createRoomNameTopicAccessTypeIsSpaceUserIDsAvatarURLAliasLocalPartClosure = { _, _, accessType, _, _, _, localAliasPart in
            XCTAssertEqual(accessType, .askToJoin)
>>>>>>> release/26.01.0
            XCTAssertEqual(localAliasPart, "a")
            defer { expectation.fulfill() }
            return .success("")
        }
        context.send(viewAction: .createRoom)
        await fulfillment(of: [expectation])
    }
    
    func testCreatePublicRoomFailsForInvalidAlias() async throws {
        context.send(viewAction: .updateRoomName("A"))
        context.roomTopic = "B"
        context.selectedAccessType = .public
        // When setting the room as private we always reset the alias
        // so we need to wait a main actor cycle to ensure the view state is updated
        await Task.yield()
        
        // we wait for the debounce to show the error
        let deferred = deferFulfillment(context.$viewState) { viewState in
            viewState.aliasErrors.contains(.invalidSymbols) && !viewState.canCreateRoom
        }
        context.send(viewAction: .updateAliasLocalPart("#:"))
        try await deferred.fulfill()
        
        // We also want to force the room creation in case the user may tap the button before the debounce
        // blocked it
        context.send(viewAction: .createRoom)
        await Task.yield()
<<<<<<< HEAD
        // Tchap: adapted test adding `isEncrypted`
//        XCTAssertFalse(clientProxy.createRoomNameTopicIsRoomPrivateIsKnockingOnlyUserIDsAvatarURLAliasLocalPartCalled)
        XCTAssertFalse(clientProxy.createRoomNameTopicIsRoomPrivateIsRoomEncryptedIsKnockingOnlyUserIDsAvatarURLAliasLocalPartCalled)
=======
        XCTAssertFalse(clientProxy.createRoomNameTopicAccessTypeIsSpaceUserIDsAvatarURLAliasLocalPartCalled)
>>>>>>> release/26.01.0
    }
    
    func testCreatePublicRoomFailsForExistingAlias() async throws {
        clientProxy.isAliasAvailableReturnValue = .success(false)
        context.send(viewAction: .updateRoomName("A"))
        context.roomTopic = "B"
        context.selectedAccessType = .public
        // When setting the room as private we always reset the alias
        // so we need to wait a main actor cycle to ensure the view state is updated
        await Task.yield()
        
        // we wait for the debounce to show the error
        let deferred = deferFulfillment(context.$viewState) { viewState in
            viewState.aliasErrors.contains(.alreadyExists) && !viewState.canCreateRoom
        }
        context.send(viewAction: .updateAliasLocalPart("abc"))
        try await deferred.fulfill()
        
        // We also want to force the room creation in case the user may tap the button before the debounce
        // blocked it
        let expectation = expectation(description: "Wait for the alias to be checked again")
        clientProxy.isAliasAvailableClosure = { _ in
            defer {
                expectation.fulfill()
            }
            return .success(false)
        }
        context.send(viewAction: .createRoom)
        await fulfillment(of: [expectation])
        XCTAssertEqual(clientProxy.isAliasAvailableCallsCount, 2)
<<<<<<< HEAD
        // Tchap: adapted test adding `isEncrypted`
//        XCTAssertFalse(clientProxy.createRoomNameTopicIsRoomPrivateIsKnockingOnlyUserIDsAvatarURLAliasLocalPartCalled)
        XCTAssertFalse(clientProxy.createRoomNameTopicIsRoomPrivateIsRoomEncryptedIsKnockingOnlyUserIDsAvatarURLAliasLocalPartCalled)
    }
    
    func testCreatePrivateRoomCantHaveKnockRule() async {
        context.send(viewAction: .updateRoomName("A"))
        context.roomTopic = "B"
        context.isRoomPrivate = true
        context.isKnockingOnly = true
        context.send(viewAction: .createRoom)
        let expectation = expectation(description: "Wait for the room to be created")
        // Tchap: adapted test adding `isEncrypted`
//        clientProxy.createRoomNameTopicIsRoomPrivateIsKnockingOnlyUserIDsAvatarURLAliasLocalPartClosure = { _, _, isPrivate, isKnockingOnly, _, _, _ in
        clientProxy.createRoomNameTopicIsRoomPrivateIsRoomEncryptedIsKnockingOnlyUserIDsAvatarURLAliasLocalPartClosure = { _, _, isPrivate, _, isKnockingOnly, _, _, _ in
            XCTAssertFalse(isKnockingOnly)
            XCTAssertTrue(isPrivate)
            expectation.fulfill()
            return .success("")
        }
        await fulfillment(of: [expectation])
=======
        XCTAssertFalse(clientProxy.createRoomNameTopicAccessTypeIsSpaceUserIDsAvatarURLAliasLocalPartCalled)
>>>>>>> release/26.01.0
    }
    
    func testNameAndAddressSync() async {
        context.selectedAccessType = .private
        await Task.yield()
        context.send(viewAction: .updateRoomName("abc"))
        XCTAssertEqual(context.viewState.aliasLocalPart, "abc")
        XCTAssertEqual(context.viewState.roomName, "abc")
        context.send(viewAction: .updateRoomName("DEF"))
        XCTAssertEqual(context.viewState.roomName, "DEF")
        XCTAssertEqual(context.viewState.aliasLocalPart, "def")
        context.send(viewAction: .updateRoomName("a  b c"))
        XCTAssertEqual(context.viewState.aliasLocalPart, "a-b-c")
        XCTAssertEqual(context.viewState.roomName, "a  b c")
        context.send(viewAction: .updateAliasLocalPart("hello-world"))
        // This removes the sync
        XCTAssertEqual(context.viewState.aliasLocalPart, "hello-world")
        XCTAssertEqual(context.viewState.roomName, "a  b c")
        
        context.send(viewAction: .updateRoomName("Hello Matrix!"))
        XCTAssertEqual(context.viewState.aliasLocalPart, "hello-world")
        XCTAssertEqual(context.viewState.roomName, "Hello Matrix!")
        
        // Deleting the whole name will restore the sync
        context.send(viewAction: .updateRoomName(""))
        XCTAssertEqual(context.viewState.aliasLocalPart, "")
        XCTAssertEqual(context.viewState.roomName, "")
        
        context.send(viewAction: .updateRoomName("Hello# Matrix!"))
        XCTAssertEqual(context.viewState.aliasLocalPart, "hello-matrix!")
        XCTAssertEqual(context.viewState.roomName, "Hello# Matrix!")
    }
}
