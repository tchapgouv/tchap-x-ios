//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

struct CreateRoomScreen: View {
    @ObservedObject var context: CreateRoomViewModel.Context
    @FocusState private var focus: Focus?

    private enum Focus {
        case name
        case topic
        case alias
    }
    
    private var aliasBinding: Binding<String> {
        .init(get: {
            context.viewState.aliasLocalPart
        }, set: {
            context.send(viewAction: .updateAliasLocalPart($0))
        })
    }
    
    private var roomNameBinding: Binding<String> {
        .init(get: {
            context.viewState.roomName
        }, set: {
            context.send(viewAction: .updateRoomName($0))
        })
    }
    
    var body: some View {
        Form {
            roomSection
            topicSection
            // Tchap: set selected users list as a section
            if !context.viewState.selectedUsers.isEmpty {
                selectedUsersSection
            }
            securitySection
            // Tchap: allow to disable federated state on Public room.
            if !context.isRoomPrivate {
                tchapNonFederatedPublicRoomSection
            }
            if context.viewState.isKnockingFeatureEnabled,
               !context.isRoomPrivate {
                roomAccessSection
                roomAliasSection
            }
        }
        .compoundList()
        .track(screen: .CreateRoom)
        .scrollDismissesKeyboard(.immediately)
        .navigationTitle(L10n.screenCreateRoomTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { toolbar }
        .readFrame($frame)
        .alert(item: $context.alertInfo)
        .shouldScrollOnKeyboardDidShow(focus == .alias, to: Focus.alias)
        // Tchap: check external guets and room type compatibility.
        .task {
            forceRoomSelectionIfExternalsArePresent()
        }
    }
    
    private var roomSection: some View {
        Section {
            HStack(alignment: .center, spacing: 16) {
                roomAvatarButton
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(L10n.screenCreateRoomRoomNameLabel.uppercased())
                        .padding(.leading, ListRowPadding.horizontal)
                        .compoundListSectionHeader()
                    
                    TextField(L10n.screenCreateRoomRoomNameLabel,
                              text: roomNameBinding,
                              prompt: Text(L10n.commonRoomNamePlaceholder).foregroundColor(.compound.textSecondary),
                              axis: .horizontal)
                        .font(.compound.bodyLG)
                        .foregroundStyle(.compound.textPrimary)
                        .tint(.compound.iconAccentTertiary)
                        .focused($focus, equals: .name)
                        .accessibilityIdentifier(A11yIdentifiers.createRoomScreen.roomName)
                        .padding(.horizontal, ListRowPadding.horizontal)
                        .padding(.vertical, ListRowPadding.vertical)
                        .background(.compound.bgCanvasDefaultLevel1, in: RoundedRectangle(cornerRadius: 12))
                }
            }
            .listRowInsets(.init())
            .listRowBackground(Color.clear)
        }
    }
    
    private var roomAvatarButton: some View {
        Button {
            focus = nil
            context.showAttachmentConfirmationDialog = true
        } label: {
            if let url = context.viewState.avatarURL {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .scaledFrame(size: 70)
                .clipShape(Circle())
            } else {
                CompoundIcon(\.takePhoto, size: .custom(36), relativeTo: .title)
                    .foregroundColor(.compound.iconSecondary)
                    .scaledFrame(size: 70, relativeTo: .title)
                    .background(.compound.bgSubtlePrimary, in: Circle())
            }
        }
        .buttonStyle(.plain)
        .confirmationDialog("", isPresented: $context.showAttachmentConfirmationDialog) {
            Button(L10n.actionTakePhoto) {
                context.send(viewAction: .displayCameraPicker)
            }
            Button(L10n.actionChoosePhoto) {
                context.send(viewAction: .displayMediaPicker)
            }
            if context.viewState.avatarURL != nil {
                Button(L10n.actionRemove, role: .destructive) {
                    context.send(viewAction: .removeImage)
                }
            }
        }
    }
    
    private var topicSection: some View {
        Section {
            ListRow(label: .plain(title: L10n.commonTopicPlaceholder),
                    kind: .textField(text: $context.roomTopic, axis: .vertical))
                .lineLimit(3, reservesSpace: false)
                .focused($focus, equals: .topic)
                .accessibilityIdentifier(A11yIdentifiers.createRoomScreen.roomTopic)
        } header: {
            Text(L10n.screenCreateRoomTopicLabel)
                .compoundListSectionHeader()
        }
        // Tchap: set selected users list in its own section
        //        footer: {
        //            if !context.viewState.selectedUsers.isEmpty {
        //                selectedUsersSection
        //            }
        //        }
    }
    
    @State private var frame: CGRect = .zero
    @ScaledMetric private var invitedUserCellWidth: CGFloat = 72
    
    // Tchap: boolean representing the presence of external members in invited users
    private var externalsArePresents: Bool {
        context.viewState.selectedUsers.first { MatrixIdFromString($0.userID).isExternalTchapUser } != nil
    }
    
    // Tchap: "external are present" warning
    private var externalsWarning: AttributedString {
        var externWarning = AttributedString(TchapL10n.screenCreateRoomExternalsArePresentsWarning)
        externWarning.font = .footnote
        var externMoreLink = AttributedString(TchapL10n.screenCreateRoomExternalsArePresentsLink)
        externMoreLink.font = .footnote
        externMoreLink.underlineStyle = .single
        externMoreLink.foregroundColor = .primary
        externMoreLink.link = context.viewState.tchapExternalMembersFaqLink
        return externWarning + externMoreLink
    }
    
    // Tchap: verifiy at view init that selected room type is not Public Room if external users are present.
    // This can happen when we select Public Room (because no externals are present) and go back to previous screen
    // to select external and continue to this screen (which remember then the previous selection).
    private func forceRoomSelectionIfExternalsArePresent() {
        if externalsArePresents,
           !context.isRoomPrivate {
            // Force revert to default configuration: private and encrypted room
            context.isRoomPrivate = true
            context.isRoomEncrypted = true
        }
    }
    
    private var selectedUsersSection: some View {
        Section { // Tchap: put selected users list in section
            VStack(spacing: 0.0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) { // Tchap: reduce space between items.
                        ForEach(context.viewState.selectedUsers, id: \.userID) { user in
                            InviteUsersScreenSelectedItem(user: user, mediaProvider: context.mediaProvider) {
                                context.send(viewAction: .deselectUser(user))
                            }
//                            .frame(width: invitedUserCellWidth) // Tchap: let the view takes its intrinsic size to be well-spaced.
                        }
                    }
//                    .padding(.horizontal, ListRowPadding.horizontal) // Tchap: remove horizontal padding to display more member in available space.
                    .padding(.vertical, 22)
                }
                // Tchap: add warning if some users are externals.
                if externalsArePresents {
                    HStack(spacing: 4.0) {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(CompoundCoreColorTokens.orange700)
                        Text(externalsWarning)
                        Spacer()
                    }
                }
            }
            // Tchap: reduce horizontal margins on members section.
            .listRowInsets(EdgeInsets(top: 4.0, leading: 8.0, bottom: 4.0, trailing: 8.0))
//            .frame(width: frame.width) // Tchap: remove because in a Section now.
        } header: { // Tchap: set selected users list section title
            Text(TchapL10n.screenCreateRoomSelectedUsersLabel)
                .compoundListSectionHeader()
        }
    }
    
    // Tchap: colored line warning about public rooms not open to externals.
    private var warningPublicRoomIsNotOpenToExterns: AttributedString {
        let description = AttributedString(TchapL10n.screenCreateRoomPublicOptionDescription1)
        var warning = AttributedString(TchapL10n.screenCreateRoomPublicOptionDescription2)
        warning.foregroundColor = CompoundCoreColorTokens.orange700
        return description + warning
    }
    
    private var securitySection: some View {
        Section {
            // Tchap: use Tchap own room types list
//            ListRow(label: .default(title: L10n.screenCreateRoomPrivateOptionTitle,
//                                    description: L10n.screenCreateRoomPrivateOptionDescription,
//                                    icon: \.lock,
//                                    iconAlignment: .top),
//                    kind: .selection(isSelected: context.isRoomPrivate) { context.isRoomPrivate = true })
//            ListRow(label: .default(title: L10n.screenCreateRoomPublicOptionTitle,
//                                    description: L10n.screenCreateRoomPublicOptionDescription,
//                                    icon: \.public,
//                                    iconAlignment: .top),
//                    kind: .selection(isSelected: !context.isRoomPrivate) { context.isRoomPrivate = false })

            ListRow(label: .default(title: TchapL10n.screenCreateRoomPrivateEncryptedOptionTitle,
                                    description: TchapL10n.screenCreateRoomPrivateEncryptedOptionDescription,
                                    icon: \.lockSolid,
                                    role: .coloredIcon(CompoundCoreColorTokens.green800),
                                    iconAlignment: .top),
                    kind: .selection(isSelected: context.isRoomPrivate && context.isRoomEncrypted) { context.isRoomPrivate = true; context.isRoomEncrypted = true })
            // Tchap: hide uncyphered room option for 1st external beta
//            ListRow(label: .default(title: TchapL10n.screenCreateRoomPrivateOptionTitle,
//                                    description: TchapL10n.screenCreateRoomPrivateOptionDescription,
//                                    icon: \.lockOff,
//                                    iconAlignment: .top),
//                    kind: .selection(isSelected: context.isRoomPrivate && !context.isRoomEncrypted) { context.isRoomPrivate = true; context.isRoomEncrypted = false })
            ListRow(label: .default(title: TchapL10n.screenCreateRoomPublicOptionTitle,
                                    attributedDescriptionWhenDisabled: warningPublicRoomIsNotOpenToExterns,
                                    icon: \.public,
                                    iconAlignment: .top),
                    kind: .selection(isSelected: !context.isRoomPrivate) { context.isRoomPrivate = false })
                // Tchap: disabled Public forum if externals are present.
                .disabled(externalsArePresents)
        } header: {
            Text(TchapL10n.screenCreateRoomRoomVisibilitySectionTitle)
                .compoundListSectionHeader()
        }
    }
    
    private var roomAccessSection: some View {
        Section {
            ListRow(label: .plain(title: L10n.screenCreateRoomRoomAccessSectionAnyoneOptionTitle,
                                  description: L10n.screenCreateRoomRoomAccessSectionAnyoneOptionDescription),
                    kind: .selection(isSelected: !context.isKnockingOnly) { context.isKnockingOnly = false })
            ListRow(label: .plain(title: L10n.screenCreateRoomRoomAccessSectionKnockingOptionTitle,
                                  description: L10n.screenCreateRoomRoomAccessSectionKnockingOptionDescription),
                    kind: .selection(isSelected: context.isKnockingOnly) { context.isKnockingOnly = true })
        } header: {
            Text(L10n.screenCreateRoomRoomAccessSectionHeader)
                .compoundListSectionHeader()
        }
    }
    
    // Tchap: Allow Public room to be non-federated
    private var tchapNonFederatedPublicRoomSection: some View {
        Section {
            ListRow(label: .plain(title: TchapL10n.screenCreateRoomPublicOptionUnfederatedTitle,
                                  description: TchapL10n.screenCreateRoomPublicOptionUnfederatedDescription(HomeServerName(context.viewState.serverName).displayName)),
                    kind: .toggle($context.isRoomFederated.not))
        }
    }
    
    private var roomAliasSection: some View {
        Section {
            EditRoomAddressListRow(aliasLocalPart: aliasBinding,
                                   serverName: context.viewState.serverName,
                                   shouldDisplayError: context.viewState.aliasErrors.errorDescription != nil)
                .focused($focus, equals: .alias)
                .id(Focus.alias)
        } header: {
            Text(L10n.screenCreateRoomRoomAddressSectionTitle)
                .compoundListSectionHeader()
        } footer: {
            VStack(alignment: .leading, spacing: 12) {
                if let errorDescription = context.viewState.aliasErrors.errorDescription {
                    Label(errorDescription, icon: \.errorSolid, iconSize: .xSmall, relativeTo: .compound.bodySM)
                        .foregroundStyle(.compound.textCriticalPrimary)
                        .font(.compound.bodySM)
                }
                Text(L10n.screenCreateRoomRoomAddressSectionFooter)
                    .compoundListSectionFooter()
                    .font(.compound.bodySM)
            }
        }
    }
    
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            Button(L10n.actionCreate) {
                focus = nil
                context.send(viewAction: .createRoom)
            }
            .disabled(!context.viewState.canCreateRoom)
        }
    }
}

// MARK: - Previews

struct CreateRoom_Previews: PreviewProvider, TestablePreview {
    static let viewModel = {
        let userSession = UserSessionMock(.init(clientProxy: ClientProxyMock(.init(userID: "@userid:example.com"))))
        let parameters = CreateRoomFlowParameters()
        let selectedUsers: [UserProfileProxy] = [.mockAlice, .mockBob, .mockCharlie]
        
        return CreateRoomViewModel(userSession: userSession,
                                   createRoomParameters: .init(parameters),
                                   selectedUsers: .init(selectedUsers),
                                   analytics: ServiceLocator.shared.analytics,
                                   userIndicatorController: UserIndicatorControllerMock(),
                                   appSettings: ServiceLocator.shared.settings)
    }()
    
    static let emtpyViewModel = {
        let userSession = UserSessionMock(.init(clientProxy: ClientProxyMock(.init(userID: "@userid:example.com"))))
        let parameters = CreateRoomFlowParameters()
        return CreateRoomViewModel(userSession: userSession,
                                   createRoomParameters: .init(parameters),
                                   selectedUsers: .init([]),
                                   analytics: ServiceLocator.shared.analytics,
                                   userIndicatorController: UserIndicatorControllerMock(),
                                   appSettings: ServiceLocator.shared.settings)
    }()
    
    static let publicRoomViewModel = {
        let userSession = UserSessionMock(.init(clientProxy: ClientProxyMock(.init(userIDServerName: "example.org", userID: "@userid:example.com"))))
        let parameters = CreateRoomFlowParameters(isRoomPrivate: false, isRoomEncrypted: false) // Tchap: add `isRoomEncrypted` parameter
        let selectedUsers: [UserProfileProxy] = [.mockAlice, .mockBob, .mockCharlie]
        ServiceLocator.shared.settings.knockingEnabled = true
        return CreateRoomViewModel(userSession: userSession,
                                   createRoomParameters: .init(parameters),
                                   selectedUsers: .init([]),
                                   analytics: ServiceLocator.shared.analytics,
                                   userIndicatorController: UserIndicatorControllerMock(),
                                   appSettings: ServiceLocator.shared.settings)
    }()
    
    static let publicRoomInvalidAliasViewModel = {
        let userSession = UserSessionMock(.init(clientProxy: ClientProxyMock(.init(userIDServerName: "example.org", userID: "@userid:example.com"))))
        let parameters = CreateRoomFlowParameters(isRoomPrivate: false, isRoomEncrypted: false, aliasLocalPart: "#:") // Tchap: add `isRoomEncrypted` parameter
        ServiceLocator.shared.settings.knockingEnabled = true
        return CreateRoomViewModel(userSession: userSession,
                                   createRoomParameters: .init(parameters),
                                   selectedUsers: .init([]),
                                   analytics: ServiceLocator.shared.analytics,
                                   userIndicatorController: UserIndicatorControllerMock(),
                                   appSettings: ServiceLocator.shared.settings)
    }()
    
    static let publicRoomExistingAliasViewModel = {
        let clientProxy = ClientProxyMock(.init(userIDServerName: "example.org", userID: "@userid:example.com"))
        clientProxy.isAliasAvailableReturnValue = .success(false)
        let userSession = UserSessionMock(.init(clientProxy: clientProxy))
        let parameters = CreateRoomFlowParameters(isRoomPrivate: false, isRoomEncrypted: false, aliasLocalPart: "existing") // Tchap: add `isRoomEncrypted` parameter
        ServiceLocator.shared.settings.knockingEnabled = true
        return CreateRoomViewModel(userSession: userSession,
                                   createRoomParameters: .init(parameters),
                                   selectedUsers: .init([]),
                                   analytics: ServiceLocator.shared.analytics,
                                   userIndicatorController: UserIndicatorControllerMock(),
                                   appSettings: ServiceLocator.shared.settings)
    }()

    static var previews: some View {
        NavigationStack {
            CreateRoomScreen(context: viewModel.context)
        }
        .previewDisplayName("Create Room")
        NavigationStack {
            CreateRoomScreen(context: emtpyViewModel.context)
        }
        .previewDisplayName("Create Room without users")
        NavigationStack {
            CreateRoomScreen(context: publicRoomViewModel.context)
        }
        .previewDisplayName("Create Public Room")
        NavigationStack {
            CreateRoomScreen(context: publicRoomInvalidAliasViewModel.context)
        }
        .snapshotPreferences(expect: publicRoomExistingAliasViewModel.context.$viewState.map { state in
            !state.aliasErrors.isEmpty
        })
        .previewDisplayName("Create Public Room, invalid alias")
        NavigationStack {
            CreateRoomScreen(context: publicRoomExistingAliasViewModel.context)
        }
        .snapshotPreferences(expect: publicRoomExistingAliasViewModel.context.$viewState.map { state in
            !state.aliasErrors.isEmpty
        })
        .previewDisplayName("Create Public Room, existing alias")
    }
}
