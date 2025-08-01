//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

struct StartChatScreen: View {
    @ObservedObject var context: StartChatScreenViewModel.Context
    
    var body: some View {
        Form {
            if !context.viewState.isSearching {
                mainContent
            } else {
                searchContent
            }
        }
        .compoundList()
        .track(screen: .StartChat)
        .scrollDismissesKeyboard(.immediately)
        .navigationTitle(L10n.actionStartChat)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { toolbar }
        .searchController(query: $context.searchQuery,
                          placeholder: L10n.commonSearchForSomeone,
                          showsCancelButton: false,
                          disablesInteractiveDismiss: true)
        .compoundSearchField()
        .alert(item: $context.alertInfo)
        .sheet(item: $context.selectedUserToInvite) { user in
            SendInviteConfirmationView(userToInvite: user, mediaProvider: context.mediaProvider) {
                context.send(viewAction: .createDM(user: user))
            }
        }
        .sheet(isPresented: $context.isJoinRoomByAddressSheetPresented) {
            context.roomAddress = ""
        } content: {
            JoinRoomByAddressView(context: context)
        }
    }

    // MARK: - Private

    /// The content shown in the form when the search query is empty.
    @ViewBuilder
    private var mainContent: some View {
        createRoomSection
        if context.viewState.isRoomDirectoryEnabled {
            roomDirectorySearch
        }
        joinForumSection // Tchap: Join a forum
        inviteFriendsSection
        joinRoomByAddressSection
        usersSection
    }
    
    private var joinRoomByAddressSection: some View {
        Section {
            ListRow(label: .default(title: L10n.screenStartChatJoinRoomByAddressAction,
                                    icon: \.room),
                    kind: .button {
                        context.isJoinRoomByAddressSheetPresented = true
                    })
        }
    }
    
    private var roomDirectorySearch: some View {
        Section {
            ListRow(label: .default(title: L10n.screenRoomDirectorySearchTitle,
                                    icon: \.listBulleted),
                    kind: .navigationLink {
                        context.send(viewAction: .openRoomDirectorySearch)
                    })
        }
    }
    
    /// The content shown in the form when a search query has been entered.
    @ViewBuilder
    private var searchContent: some View {
        if context.viewState.hasEmptySearchResults {
            noResultsContent
        } else {
            usersSection
        }
    }
    
    private var createRoomSection: some View {
        Section {
            ListRow(label: .default(title: L10n.screenCreateRoomActionCreateRoom,
                                    icon: \.plus),
                    kind: .navigationLink { context.send(viewAction: .createRoom) })
                .accessibilityIdentifier(A11yIdentifiers.startChatScreen.createRoom)
        }
    }
    
    private var inviteFriendsSection: some View {
        Section {
            ListRow(kind: .custom {
                MatrixUserShareLink(userID: context.viewState.userID) {
                    ListRowLabel.default(title: L10n.actionInvitePeopleToApp(InfoPlistReader.main.bundleDisplayName),
                                         icon: \.shareIos)
                }
            })
            .accessibilityIdentifier(A11yIdentifiers.startChatScreen.inviteFriends)
        }
    }
    
    // Tchap: Join a forum (add section without chevron)
    private var joinForumSection: some View {
        Section {
            ListRow(label: .default(title: TchapL10n.startChatActionJoinForum,
                                    icon: \.listBulleted),
                    kind: .button { context.send(viewAction: .joinForum) })
                .accessibilityIdentifier(TchapA11yIdentifiers.startChatScreen.joinForum)
        }
    }
    
    @ViewBuilder
    private var usersSection: some View {
        if !context.viewState.usersSection.users.isEmpty {
            Section {
                ForEach(context.viewState.usersSection.users, id: \.userID) { user in
                    UserProfileListRow(user: user,
                                       membership: nil,
                                       mediaProvider: context.mediaProvider,
                                       kind: .button {
                                           context.send(viewAction: .selectUser(user))
                                       })
                }
            } header: {
                if let title = context.viewState.usersSection.title {
                    Text(title)
                        .compoundListSectionHeader()
                }
            }
        } else {
            Section.empty
        }
    }
    
    private var noResultsContent: some View {
        Text(L10n.commonNoResults)
            .font(.compound.bodyLG)
            .foregroundColor(.compound.textSecondary)
            .frame(maxWidth: .infinity)
            .listRowBackground(Color.clear)
            .accessibilityIdentifier(A11yIdentifiers.startChatScreen.searchNoResults)
    }
    
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button(L10n.actionCancel) {
                context.send(viewAction: .close)
            }
            .accessibilityIdentifier(A11yIdentifiers.startChatScreen.closeStartChat)
        }
    }
}

// MARK: - Previews

struct StartChatScreen_Previews: PreviewProvider, TestablePreview {
    static let viewModel = {
        let appSettings = AppSettings()
        appSettings.publicSearchEnabled = true
        let userSession = UserSessionMock(.init(clientProxy: ClientProxyMock(.init(userID: "@userid:example.com"))))
        let userDiscoveryService = UserDiscoveryServiceMock()
        userDiscoveryService.searchProfilesWithReturnValue = .success([.mockAlice])
        let viewModel = StartChatScreenViewModel(userSession: userSession,
                                                 analytics: ServiceLocator.shared.analytics,
                                                 userIndicatorController: UserIndicatorControllerMock(),
                                                 userDiscoveryService: userDiscoveryService,
                                                 appSettings: appSettings)
        return viewModel
    }()
    
    static var previews: some View {
        NavigationStack {
            StartChatScreen(context: viewModel.context)
        }
    }
}
