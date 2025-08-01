//
// Copyright 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Combine
import Foundation

struct ClientProxyMockConfiguration {
    var homeserver = ""
    var userIDServerName: String?
    var userID: String = RoomMemberProxyMock.mockMe.userID
    var deviceID: String?
    var roomSummaryProvider: RoomSummaryProviderProtocol = RoomSummaryProviderMock(.init())
    var roomDirectorySearchProxy: RoomDirectorySearchProxyProtocol?
    
    var recoveryState: SecureBackupRecoveryState = .enabled
    
    var timelineMediaVisibility = TimelineMediaVisibility.always
    var hideInviteAvatars = false
}

enum ClientProxyMockError: Error {
    case generic
}

extension ClientProxyMock {
    convenience init(_ configuration: ClientProxyMockConfiguration) {
        self.init()
        
        userID = configuration.userID
        deviceID = configuration.deviceID
        
        homeserver = configuration.homeserver
        userIDServerName = configuration.userIDServerName
        
        roomSummaryProvider = configuration.roomSummaryProvider
        alternateRoomSummaryProvider = RoomSummaryProviderMock(.init())
        staticRoomSummaryProvider = RoomSummaryProviderMock(.init())
        
        roomDirectorySearchProxyReturnValue = configuration.roomDirectorySearchProxy
        
        actionsPublisher = PassthroughSubject<ClientProxyAction, Never>().eraseToAnyPublisher()
        loadingStatePublisher = CurrentValuePublisher<ClientProxyLoadingState, Never>(.notLoading)
        verificationStatePublisher = CurrentValuePublisher<SessionVerificationState, Never>(.unknown)
        
        userAvatarURLPublisher = CurrentValueSubject<URL?, Never>(nil).asCurrentValuePublisher()
        
        userDisplayNamePublisher = CurrentValueSubject<String?, Never>("User display name").asCurrentValuePublisher()
        
        ignoredUsersPublisher = CurrentValueSubject<[String]?, Never>([RoomMemberProxyMock].allMembers.map(\.userID)).asCurrentValuePublisher()
        
        notificationSettings = NotificationSettingsProxyMock(with: .init())
        
        isOnlyDeviceLeftReturnValue = .success(false)
        accountURLActionReturnValue = "https://matrix.org/account"
        canDeactivateAccount = false
        directRoomForUserIDReturnValue = .failure(.sdkError(ClientProxyMockError.generic))
        createDirectRoomWithExpectedRoomNameReturnValue = .failure(.sdkError(ClientProxyMockError.generic))
        createRoomNameTopicIsRoomPrivateIsRoomEncryptedIsKnockingOnlyUserIDsAvatarURLAliasLocalPartReturnValue = .failure(.sdkError(ClientProxyMockError.generic)) // Tchap: handle additional `isEncrypted` property
        uploadMediaReturnValue = .failure(.sdkError(ClientProxyMockError.generic))
        loadUserDisplayNameReturnValue = .failure(.sdkError(ClientProxyMockError.generic))
        setUserDisplayNameReturnValue = .failure(.sdkError(ClientProxyMockError.generic))
        loadUserAvatarURLReturnValue = .failure(.sdkError(ClientProxyMockError.generic))
        setUserAvatarMediaReturnValue = .failure(.sdkError(ClientProxyMockError.generic))
        removeUserAvatarReturnValue = .failure(.sdkError(ClientProxyMockError.generic))
        isAliasAvailableReturnValue = .success(true)
        searchUsersSearchTermLimitReturnValue = .success(.init(results: [], limited: false))
        profileForReturnValue = .success(.init(userID: "@a:b.com", displayName: "Some user"))
        ignoreUserReturnValue = .success(())
        unignoreUserReturnValue = .success(())
        
        needsSlidingSyncMigration = false
        slidingSyncVersion = .native
        
        trackRecentlyVisitedRoomReturnValue = .success(())
        recentlyVisitedRoomsReturnValue = .success([])
        recentConversationCounterpartsReturnValue = []
        
        loadMediaContentForSourceThrowableError = ClientProxyError.sdkError(ClientProxyMockError.generic)
        loadMediaThumbnailForSourceWidthHeightThrowableError = ClientProxyError.sdkError(ClientProxyMockError.generic)
        loadMediaFileForSourceFilenameThrowableError = ClientProxyError.sdkError(ClientProxyMockError.generic)
        
        secureBackupController = SecureBackupControllerMock(.init(recoveryState: configuration.recoveryState))
        resetIdentityReturnValue = .success(IdentityResetHandleSDKMock(.init()))
        
        roomForIdentifierClosure = { [weak self] identifier in
            guard let room = self?.roomSummaryProvider.roomListPublisher.value.first(where: { $0.id == identifier }) else {
                return nil
            }
            
            return await .joined(JoinedRoomProxyMock(.init(id: room.id, name: room.name)))
        }
        
        userIdentityForReturnValue = .success(UserIdentityProxyMock(configuration: .init()))
        
        underlyingIsReportRoomSupported = true
        underlyingIsLiveKitRTCSupported = true
        
        underlyingTimelineMediaVisibilityPublisher = CurrentValueSubject<TimelineMediaVisibility, Never>(configuration.timelineMediaVisibility).asCurrentValuePublisher()
        underlyingHideInviteAvatarsPublisher = CurrentValueSubject<Bool, Never>(configuration.hideInviteAvatars).asCurrentValuePublisher()
    }
}
