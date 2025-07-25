//
// Copyright 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import SwiftUI

struct RoomInviterDetails: Equatable {
    let id: String
    let displayName: String?
    let avatarURL: URL?
    
    let attributedInviteText: AttributedString
    
    init(member: RoomMemberProxyProtocol) {
        id = member.userID
        displayName = member.displayName
        avatarURL = member.avatarURL
        
        let nameOrLocalPart = if let displayName = member.displayName {
            displayName
        } else {
            String(member.userID.dropFirst().prefix { $0 != ":" })
        }
        
        // Pre-compute the attributed string.
        let placeholder = "{displayname}"
        // Tchap: only display User ID of Inviter when in debug mode
        #if DEBUG
        var string = AttributedString(L10n.screenInvitesInvitedYou(placeholder, id))
        #else
        var string = AttributedString(L10n.screenInvitesInvitedYou(placeholder, ""))
        // Tchap: the template string contains mandatory " (%2$@)" placeholder. Suppress it.
        string.replace(" ()", with: "")
        #endif
        var displayNameString = AttributedString(nameOrLocalPart)
        displayNameString.bold()
        displayNameString.foregroundColor = .compound.textPrimary
        string.replace(placeholder, with: displayNameString)
        attributedInviteText = string
    }
}

struct RoomInviterLabel: View {
    let inviter: RoomInviterDetails
    var shouldHideAvatar = false
    
    let mediaProvider: MediaProviderProtocol?
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            LoadableAvatarImage(url: shouldHideAvatar ? nil : inviter.avatarURL,
                                name: inviter.displayName,
                                contentID: inviter.id,
                                avatarSize: .custom(16),
                                mediaProvider: mediaProvider)
                .alignmentGuide(.firstTextBaseline) { $0[.bottom] * 0.8 }
                .accessibilityHidden(true)
            
            Text(inviter.attributedInviteText)
        }
    }
}

// MARK: - Previews

struct RoomInviterLabel_Previews: PreviewProvider, TestablePreview {
    static var previews: some View {
        VStack(spacing: 10) {
            RoomInviterLabel(inviter: .init(member: RoomMemberProxyMock.mockAlice),
                             mediaProvider: MediaProviderMock(configuration: .init()))
            RoomInviterLabel(inviter: .init(member: RoomMemberProxyMock.mockDan),
                             mediaProvider: MediaProviderMock(configuration: .init()))
            RoomInviterLabel(inviter: .init(member: RoomMemberProxyMock.mockNoName),
                             mediaProvider: MediaProviderMock(configuration: .init()))
            RoomInviterLabel(inviter: .init(member: RoomMemberProxyMock.mockCharlie),
                             mediaProvider: MediaProviderMock(configuration: .init()))
                .foregroundStyle(.compound.textPrimary)
        }
        .font(.compound.bodyMD)
        .foregroundStyle(.compound.textSecondary)
    }
}
