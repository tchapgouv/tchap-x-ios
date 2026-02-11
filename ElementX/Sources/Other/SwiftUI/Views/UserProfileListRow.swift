//
// Copyright 2025 Element Creations Ltd.
// Copyright 2023-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
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
    
    // Tchap: compute BadgeLabel offsetX
    var tchapBadgesOffsetX: CGFloat {
        return switch kind {
        case .multiSelection: 104.0 // 100 is 40 (radio button width) + 40 (avatar image width) + 16 (avatar leading offset) + 8 (avatar-text spacing)
        default: 64.0 // 60 is 40 (avatar image width) + 16 (avatar leading offset) + 8 (avatar-text spacing)
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

            switch MatrixIdFromString(user.userID).userType {
            case .external(needInviteByEmail: false):
                BadgeLabel(title: TchapL10n.commonUserIsExternal, icon: \.public, style: .info, tchapUsage: .userIsExternal(useSmallSize: true))
                    .offset(x: tchapBadgesOffsetX, y: -8.0)
            case .external(needInviteByEmail: true):
                HStack(spacing: 4.0) {
                    BadgeLabel(title: TchapL10n.commonUserIsExternal, icon: \.public, style: .info, tchapUsage: .userIsExternal(useSmallSize: true))
                    BadgeLabel(title: TchapL10n.inviteByEmailMessage, icon: \.email, style: .info, tchapUsage: .inviteByEmail(useSmallSize: true))
                }
                .offset(x: tchapBadgesOffsetX, y: -8.0) // 60 is 40 (avatar image width) + 16 (avatar leading offset) + 8 (avatar-text spacing)
            case .agent:
                EmptyView()
            }
        }
        // Cancel list row insets added because of VStack inside List.
        .listRowInsets(EdgeInsets())
        // Use same filled background as ListRow to have full solid background.
        .listRowBackground(Color.compound.bgCanvasDefaultLevel1)
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
            return L10n.screenInviteUsersAlreadyAMember
        case .invite:
            return L10n.screenInviteUsersAlreadyInvited
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
