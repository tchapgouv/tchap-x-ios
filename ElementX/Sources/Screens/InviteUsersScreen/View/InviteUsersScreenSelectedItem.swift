//
// Copyright 2025 Element Creations Ltd.
// Copyright 2023-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

struct InviteUsersScreenSelectedItem: View {
    let user: UserProfileProxy
    let mediaProvider: MediaProviderProtocol?
    let dismissAction: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            avatar
                .accessibilityHidden(true)
            
            // Tchap: calculate displayname from userId if necessary and displays it in badge if user is external.
            //            Text(user.displayName ?? user.userID)
            if MatrixIdFromString(user.userID).isExternalTchapUser {
                Text((user.displayName ?? MatrixIdFromString(user.userID).userDisplayName?.displayName) ?? user.userID)
                    .lineLimit(1)
                    .tchapExternalLabelView()
            } else {
                Text((user.displayName ?? MatrixIdFromString(user.userID).userDisplayName?.displayName) ?? user.userID)
                    .font(.compound.bodyMD)
                    .foregroundColor(.compound.textPrimary)
                    .lineLimit(1)
            }
        }
        .frame(maxWidth: 100.0)
        .accessibilityElement(children: .combine)
        .accessibilityAction(named: L10n.actionRemove, dismissAction)
    }
    
    // MARK: - Private
    
    var avatar: some View {
        LoadableAvatarImage(url: user.avatarURL,
                            name: user.displayName,
                            contentID: user.userID,
                            avatarSize: .user(on: .inviteUsers),
                            mediaProvider: mediaProvider)
            .overlayRemoveItemButton(action: dismissAction)
    }
    
    var closeButtonLabel: some View {
        CompoundIcon(\.close, size: .custom(12), relativeTo: .compound.bodySM)
            .foregroundStyle(.compound.iconOnSolidPrimary)
            .padding(2)
            .background(.compound.iconPrimary, in: Circle())
    }
}

struct InviteUsersScreenSelectedItem_Previews: PreviewProvider, TestablePreview {
    static let people: [UserProfileProxy] = [.mockAlice, .mockVerbose]
    
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(people, id: \.userID) { user in
                    InviteUsersScreenSelectedItem(user: user, mediaProvider: MediaProviderMock(configuration: .init())) { }
                        .frame(width: 80)
                }
            }
        }
    }
}
