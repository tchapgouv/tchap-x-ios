//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Combine
import Compound
import SwiftUI

struct RoomHeaderView: View {
    let roomName: String
    let roomAvatar: RoomAvatar
    var dmRecipientVerificationState: UserIdentityVerificationState?
    // Tchap:
    let roomPropertiesBadgesView: TchapRoomHeaderViewRoomPropertiesBadgesView
    
    let mediaProvider: MediaProviderProtocol?
    
    var body: some View {
        if #available(iOS 19, *) {
            // https://github.com/element-hq/element-x-ios/issues/4180
            // Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'NSLayoutConstraint constant is not finite!
            content
        } else {
            content
                // Take up as much space as possible, with a leading alignment for use in the principal toolbar position
                .frame(idealWidth: .greatestFiniteMagnitude, maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var content: some View {
        HStack(spacing: 8) {
            avatarImage
                .accessibilityHidden(true)
            // Tchap: embedd in a VStack to add badges.
            VStack(alignment: .leading, spacing: 4.0) {
                HStack(spacing: 4) {
                    Text(roomName)
                        .lineLimit(1)
                        .font(.compound.bodyLGSemibold)
                        .accessibilityIdentifier(A11yIdentifiers.roomScreen.name)
                    
                    if let dmRecipientVerificationState {
                        VerificationBadge(verificationState: dmRecipientVerificationState)
                    }
                }
                // Tchap: additional room info
                roomPropertiesBadgesView
                    .zIndex(-1)
                Spacer(minLength: 2.0)
            }
            // Take up as much space as possible, with a leading alignment for use in the principal toolbar position.
            // Tchap: allowing `idealWidth` to grow to `infinity` crash the rendering in some conditions (redraw triggered by bindings in roomPropertiesBadgesView).
            //            .frame(idealWidth: .greatestFiniteMagnitude, maxWidth: .infinity, alignment: .leading)
            .frame(idealWidth: 65535.0, maxWidth: .infinity, alignment: .leading)
        }
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
        VStack(spacing: 8) {
            makeHeader(avatarURL: nil, verificationState: .notVerified)
            makeHeader(avatarURL: .mockMXCAvatar, verificationState: .notVerified)
            makeHeader(avatarURL: .mockMXCAvatar, verificationState: .verified)
            makeHeader(avatarURL: .mockMXCAvatar, verificationState: .verificationViolation)
        }
        .previewLayout(.sizeThatFits)
    }
    
    static func makeHeader(avatarURL: URL?,
                           verificationState: UserIdentityVerificationState) -> some View {
        RoomHeaderView(roomName: "Some Room name",
                       roomAvatar: .room(id: "1",
                                         name: "Some Room Name",
                                         avatarURL: avatarURL),
                       dmRecipientVerificationState: verificationState,
                       roomPropertiesBadgesView: .sample, // Tchap addition
                       mediaProvider: MediaProviderMock(configuration: .init()))
            .padding()
    }
}
