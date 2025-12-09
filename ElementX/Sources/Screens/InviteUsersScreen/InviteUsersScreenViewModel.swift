//
// Copyright 2025 Element Creations Ltd.
// Copyright 2022-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Combine
import MatrixRustSDK
import SwiftUI

typealias InviteUsersScreenViewModelType = StateStoreViewModel<InviteUsersScreenViewState, InviteUsersScreenViewAction>

class InviteUsersScreenViewModel: InviteUsersScreenViewModelType, InviteUsersScreenViewModelProtocol {
    private let roomProxy: JoinedRoomProxyProtocol
    private let userDiscoveryService: UserDiscoveryServiceProtocol
    private let userIndicatorController: UserIndicatorControllerProtocol
    private let appSettings: AppSettings
    
    private var suggestedUsers = [UserProfileProxy]()
    
    private let actionsSubject: PassthroughSubject<InviteUsersScreenViewModelAction, Never> = .init()
    var actions: AnyPublisher<InviteUsersScreenViewModelAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }
    
    init(userSession: UserSessionProtocol,
         roomProxy: JoinedRoomProxyProtocol,
         isSkippable: Bool,
         userDiscoveryService: UserDiscoveryServiceProtocol,
         userIndicatorController: UserIndicatorControllerProtocol,
         appSettings: AppSettings) {
        self.roomProxy = roomProxy
        self.userDiscoveryService = userDiscoveryService
        self.userIndicatorController = userIndicatorController
        self.appSettings = appSettings
        
        super.init(initialViewState: InviteUsersScreenViewState(selectedUsers: [],
                                                                isSkippable: isSkippable),
                   mediaProvider: userSession.mediaProvider)
                
        setupSubscriptions()
        fetchMembersIfNeeded()
        
        Task {
            suggestedUsers = await userSession.clientProxy.recentConversationCounterparts()
            
            if state.usersSection.type == .suggestions {
                state.usersSection = .init(type: .suggestions, users: suggestedUsers)
            }
        }
    }
    
    // MARK: - Public
    
    override func process(viewAction: InviteUsersScreenViewAction) {
        switch viewAction {
        case .cancel:
            actionsSubject.send(.dismiss)
        case .proceed:
            // Tchap: check if room access rule need to be updated before inviting users.
//            inviteUsers(state.selectedUsers.map(\.userID), roomProxy: roomProxy)
            Task {
                // Tchap: if room access rule is `restricted` and any invited user is external, update room access_rule to `unrestricted`.
                let usersToInvite = state.selectedUsers.map(\.userID)
                guard await !self.roomProxy.accessRuleNeedToBeUpdated(for: usersToInvite) else {
                    self.displayAlertAboutOpeningRoomToExternalUsers(users: usersToInvite, in: self.roomProxy)
                    return
                }
                self.inviteUsers(usersToInvite, roomProxy: roomProxy)
            }
        case .toggleUser(let user):
            toggleUser(user)
        }
    }

    // MARK: - Private
    
    private func toggleUser(_ user: UserProfileProxy) {
        if state.selectedUsers.contains(user) {
            state.scrollToLastID = nil
            state.selectedUsers.removeAll { $0.userID == user.userID }
        } else {
            state.scrollToLastID = user.userID
            state.selectedUsers.append(user)
        }
    }
    
    private func inviteUsers(_ users: [String], roomProxy: JoinedRoomProxyProtocol) {
        if appSettings.enableKeyShareOnInvite {
            showLoadingIndicator(title: L10n.screenRoomDetailsInvitePeoplePreparing, message: L10n.screenRoomDetailsInvitePeopleDontClose)
        } else {
            showLoadingIndicator()
        }
        
        Task {
            defer {
                hideLoadingIndicator()
                actionsSubject.send(.dismiss)
            }
            
            let result: Result<Void, RoomProxyError> = await withTaskGroup(of: Result<Void, RoomProxyError>.self) { group in
                for user in users {
                    group.addTask {
                        await roomProxy.invite(userID: user)
                    }
                }
                
                return await group.first { inviteResult in
                    inviteResult.isFailure
                } ?? .success(())
            }
            
            guard case .failure = result else {
                return
            }
            
            userIndicatorController.alertInfo = .init(id: .init(),
                                                      title: L10n.commonUnableToInviteTitle,
                                                      message: L10n.commonUnableToInviteMessage)
        }
    }
    
    // Tchap: display dialog box to inform user that the room needs to be configured to accept external users
    // before inviting the first external user.
    // The user can decline or confirm the operation.
    private func displayAlertAboutOpeningRoomToExternalUsers(users: [String], in room: JoinedRoomProxyProtocol) {
        let continueButton = AlertInfo<UUID>.AlertButton(title: L10n.actionContinue) {
            Task { [weak self] in
                self?.showLoadingIndicator()
                defer {
                    self?.hideLoadingIndicator()
                }
                switch await room.applyAccessRulesChanges(.unrestricted) {
                case .success:
                    // We can safely invite external users now that the room's access rule is `.unrestricted`.
                    self?.inviteUsers(users, roomProxy: room)
                case .failure:
                    self?.userIndicatorController.alertInfo = .init(id: .init(),
                                                                    title: TchapL10n.screenInviteExternalUserErrorModifyingAccessRuleTitle,
                                                                    message: TchapL10n.screenInviteExternalUserErrorModifyingAccessRuleMessage)
                }
            }
        }
        let cancelButton = AlertInfo<UUID>.AlertButton(title: L10n.actionCancel, action: nil)
        userIndicatorController.alertInfo = .init(id: .init(),
                                                  title: TchapL10n.screenInviteExternalUserDialogTitle,
                                                  message: TchapL10n.screenInviteExternalUserDialogMessage,
                                                  primaryButton: continueButton,
                                                  secondaryButton: cancelButton)
    }
    
    private func buildMembershipStateIfNeeded(members: [RoomMemberProxyProtocol]) {
        showLoadingIndicator()
        
        Task.detached { [members] in
            // accessing RoomMember's properties is very slow. We need to do it in a background thread.
            let membershipState = members
                .reduce(into: [String: MembershipState]()) { partialResult, member in
                    partialResult[member.userID] = member.membership
                }
            
            Task { @MainActor in
                self.state.membershipState = membershipState
                self.hideLoadingIndicator()
            }
        }
    }
    
    // periphery:ignore - automatically cancelled when set to nil
    @CancellableTask
    private var fetchUsersTask: Task<Void, Never>?
    
    private func setupSubscriptions() {
        context.$viewState
            .map(\.bindings.searchQuery)
            .debounceTextQueriesAndRemoveDuplicates()
            .sink { [weak self] _ in
                self?.fetchUsers()
            }
            .store(in: &cancellables)
    }
    
    private func fetchMembersIfNeeded() {
        Task {
            showLoadingIndicator()
            await roomProxy.updateMembers()
            hideLoadingIndicator()
        }
        
        roomProxy.membersPublisher
            .filter { !$0.isEmpty }
            .first()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] members in
                self?.buildMembershipStateIfNeeded(members: members)
            }
            .store(in: &cancellables)
    }
    
    private func fetchUsers() {
        guard searchQuery.count >= 3 else {
            state.usersSection = .init(type: .suggestions, users: suggestedUsers)
            return
        }
        
        state.isSearching = true
        
        fetchUsersTask = Task {
            let result = await userDiscoveryService.searchProfiles(with: searchQuery)
            
            guard !Task.isCancelled else { return }
            
            state.isSearching = false
            
            switch result {
            case .success(let users):
                state.usersSection = .init(type: .searchResult, users: users)
            case .failure:
                break
            }
        }
    }
        
    private var searchQuery: String {
        context.searchQuery
    }
    
    private let userIndicatorID = UUID().uuidString
    
    private func showLoadingIndicator(title: String = L10n.commonLoading,
                                      message: String? = nil) {
        userIndicatorController.submitIndicator(UserIndicator(id: userIndicatorID,
                                                              type: .modal,
                                                              title: title,
                                                              message: message,
                                                              persistent: true),
                                                delay: .milliseconds(200))
    }
    
    private func hideLoadingIndicator() {
        userIndicatorController.retractIndicatorWithId(userIndicatorID)
    }
}
