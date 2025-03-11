//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import SwiftUI

struct MentionSuggestionItemView: View {
    let mediaProvider: MediaProviderProtocol?
    let item: SuggestionItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            switch item.suggestionType {
            case .user(let user):
                LoadableAvatarImage(url: user.avatarURL, name: user.displayName, contentID: user.id, avatarSize: .user(on: .completionSuggestions), mediaProvider: mediaProvider)
            case .allUsers(let avatar):
                RoomAvatarImage(avatar: avatar, avatarSize: .room(on: .completionSuggestions), mediaProvider: mediaProvider)
            case .room(let room):
                RoomAvatarImage(avatar: room.avatar, avatarSize: .room(on: .completionSuggestions), mediaProvider: mediaProvider)
            }
            VStack(alignment: .leading, spacing: 0) {
                Text(item.displayName)
                    .font(.compound.bodyLG)
                    .foregroundColor(.compound.textPrimary)
                    .lineLimit(1)
<<<<<<< HEAD
                // Tchap: only display User ID in Mention list when in debug mode.
                #if DEBUG
                if item.displayName != nil {
                    Text(item.id)
=======
                if let subtitle = item.subtitle {
                    Text(subtitle)
>>>>>>> 25.03.2
                        .font(.compound.bodySM)
                        .foregroundColor(.compound.textSecondary)
                        .lineLimit(1)
                }
                #endif
            }
        }
    }
}

struct MentionSuggestionItemView_Previews: PreviewProvider, TestablePreview {
    static let mockMediaProvider = MediaProviderMock(configuration: .init())
    
    static var previews: some View {
        MentionSuggestionItemView(mediaProvider: mockMediaProvider, item: .init(suggestionType: .user(.init(id: "test", displayName: "Test", avatarURL: .mockMXCUserAvatar)), range: .init(), rawSuggestionText: ""))
            .previewDisplayName("User")
        MentionSuggestionItemView(mediaProvider: mockMediaProvider, item: .init(suggestionType: .user(.init(id: "test2", displayName: nil, avatarURL: nil)), range: .init(), rawSuggestionText: ""))
            .previewDisplayName("User no display name")
        MentionSuggestionItemView(mediaProvider: mockMediaProvider, item: .init(suggestionType: .allUsers(.room(id: "room", name: "Room", avatarURL: .mockMXCAvatar)), range: .init(), rawSuggestionText: ""))
            .previewDisplayName("All users")
        MentionSuggestionItemView(mediaProvider: mockMediaProvider,
                                  item: .init(suggestionType: .room(.init(id: "room",
                                                                          canonicalAlias: "#room:matrix.org",
                                                                          name: "Room",
                                                                          avatar: .room(id: "room",
                                                                                        name: "Room", avatarURL: .mockMXCAvatar))),
                                              range: .init(),
                                              rawSuggestionText: ""))
            .previewDisplayName("Room")
    }
}
