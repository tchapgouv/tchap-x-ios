//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Compound
import MatrixRustSDK
import SwiftUI

struct UserProfileListRow: View {
    let user: UserProfileProxy
    let membership: MembershipState?
    let mediaProvider: MediaProviderProtocol?
    
    let kind: ListRow<LoadableAvatarImage, EmptyView, EmptyView, Bool>.Kind<EmptyView, Bool>
    
    var isUnknownProfile: Bool { !user.isVerified && membership == nil }
    
    private var subtitle: String? {
        guard !isUnknownProfile else { return L10n.commonInviteUnknownProfile }
        
        if let membershipText = membership?.localizedDescription {
            return membershipText
        } else if user.displayName != nil {
            // Tchap: only display matrixID in debug mode.
            #if DEBUG
            return user.userID
            #else
            return nil
            #endif
        } else {
            return nil
        }
    }
    
    var body: some View {
        // Tchap: add external badge if necessary
//        ListRow(label: .avatar(title: user.displayName ?? user.userID,
//                               description: subtitle,
//                               icon: avatar,
//                               role: isUnknownProfile ? .error : nil),
//                kind: kind)
        VStack(alignment: .leading, spacing: 0.0) {
            ListRow(label: .avatar(title: user.displayName ?? user.userID,
                                   description: subtitle,
                                   icon: avatar,
                                   role: isUnknownProfile ? .error : nil),
                    kind: kind)
            if MatrixIdFromString(user.userID).isExternalTchapUser {
//                Text(TchapL10n.commonUserIsExternal)
//                    .tchapExternalLabelView()
                BadgeLabel(title: TchapL10n.commonUserIsExternal, icon: \.public, isHighlighted: false, tchapUsage: .userIsExternal)
                    .offset(x: 60.0, y: -16.0) // 60 is 40 (avatar image width) + 16 (avatar leading offset) + 8 (avatar-text spacing)
            }
        }
    }
    
    var avatar: LoadableAvatarImage {
        LoadableAvatarImage(url: user.avatarURL,
                            name: user.displayName,
                            contentID: user.userID,
                            avatarSize: .user(on: .startChat),
                            mediaProvider: mediaProvider)
    }
}

private extension MembershipState {
    var localizedDescription: String? {
        switch self {
        case .join:
            return L10n.screenRoomDetailsAlreadyAMember
        case .invite:
            return L10n.screenRoomDetailsAlreadyInvited
        default:
            return nil
        }
    }
}

struct UserProfileCell_Previews: PreviewProvider, TestablePreview {
    static let action: () -> Void = { }
    
    static var previews: some View {
        Form {
            UserProfileListRow(user: .mockAlice, membership: nil, mediaProvider: MediaProviderMock(configuration: .init()),
                               kind: .multiSelection(isSelected: true, action: action))
            
            UserProfileListRow(user: .mockBob, membership: nil, mediaProvider: MediaProviderMock(configuration: .init()),
                               kind: .multiSelection(isSelected: false, action: action))
            
            UserProfileListRow(user: .mockCharlie, membership: .join, mediaProvider: MediaProviderMock(configuration: .init()),
                               kind: .multiSelection(isSelected: true, action: action))
                .disabled(true)
            
            UserProfileListRow(user: .init(userID: "@someone:matrix.org"), membership: .join, mediaProvider: MediaProviderMock(configuration: .init()),
                               kind: .multiSelection(isSelected: false, action: action))
                .disabled(true)
            
            UserProfileListRow(user: .init(userID: "@someone:matrix.org"), membership: nil, mediaProvider: MediaProviderMock(configuration: .init()),
                               kind: .multiSelection(isSelected: false, action: action))
        }
        .compoundList()
    }
}
