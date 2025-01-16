//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import Combine
import Compound
import SwiftUI

struct RoomHeaderView: View {
    let roomName: String
    let roomAvatar: RoomAvatar
    // Tchap:
    let roomPropertiesBadgesView: TchapRoomHeaderViewRoomPropertiesBadgesView
    
    let mediaProvider: MediaProviderProtocol?
    
    var body: some View {
        HStack(spacing: 12) {
            avatarImage
                .accessibilityHidden(true)
            // Tchap: embedd in a VStack to add badges.
            VStack(alignment: .leading, spacing: 2.0) {
                Text(roomName)
                    .lineLimit(1)
                    .font(.compound.bodyLGSemibold)
                    .accessibilityIdentifier(A11yIdentifiers.roomScreen.name)
                // Tchap: additional room info
                roomPropertiesBadgesView
            }
        }
        // Take up as much space as possible, with a leading alignment for use in the principal toolbar position.
        // Tchap: allowing `idealWidth` to grow to `infinity` crash the rendering in some conditions (redraw triggered by bindings in roomPropertiesBadgesView).
//            .frame(idealWidth: .greatestFiniteMagnitude, maxWidth: .infinity, alignment: .leading)
        .frame(idealWidth: 65535.0, maxWidth: .infinity, alignment: .leading)
    }
    
    private var avatarImage: some View {
        RoomAvatarImage(avatar: roomAvatar,
                        avatarSize: .room(on: .timeline),
                        mediaProvider: mediaProvider)
            .accessibilityIdentifier(A11yIdentifiers.roomScreen.avatar)
    }
}

struct RoomHeaderView_Previews: PreviewProvider, TestablePreview {
    static var previews: some View {
        RoomHeaderView(roomName: "Some Room name",
                       roomAvatar: .room(id: "1",
                                         name: "Some Room Name",
                                         avatarURL: .mockMXCAvatar),
                       roomPropertiesBadgesView: .sample, // Tchap addition
                       mediaProvider: MediaProviderMock(configuration: .init()))
            .previewLayout(.sizeThatFits)
            .padding()
        
        RoomHeaderView(roomName: "Some Room name",
                       roomAvatar: .room(id: "1",
                                         name: "Some Room Name",
                                         avatarURL: nil),
                       roomPropertiesBadgesView: .sample, // Tchap addition
                       mediaProvider: MediaProviderMock(configuration: .init()))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
