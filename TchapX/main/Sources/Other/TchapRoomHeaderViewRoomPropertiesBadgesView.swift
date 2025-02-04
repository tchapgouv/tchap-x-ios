//
//  TchapRoomHeaderViewRoomPropertiesBadgesView.swift
//  TchapX
//
//  Created by Nicolas Buquet on 16/01/2025.
//  Copyright © 2025 Tchap. All rights reserved.
//

import MatrixRustSDK
import SwiftUI

struct TchapRoomHeaderViewRoomPropertiesBadgesView: View {
    @Binding var isEncrypted: Bool?
    @Binding var isPublic: Bool?
    @Binding var externalCount: Int

    var body: some View {
        HStack(spacing: 6) {
            if let isEncrypted = isEncrypted,
               isEncrypted == true {
                BadgeLabel(title: TchapL10n.roomHeaderBadgeEncrypted, icon: \.lockSolid, isHighlighted: false, tchapUsage: .roomIsEncrypted)
            } else {
                BadgeLabel(title: TchapL10n.roomHeaderBadgeNotEncrypted, icon: \.lockOff, isHighlighted: false, tchapUsage: .roomIsNotEncrypted)
            }
            if let isPublic = isPublic,
               isPublic == true {
                BadgeLabel(title: TchapL10n.roomHeaderBadgePublic, icon: \.public, isHighlighted: false, tchapUsage: .roomIsPublic)
            } else if externalCount > 0 {
                BadgeLabel(title: TchapL10n.roomHeaderBadgeAuthorizedToExternal, icon: \.public, isHighlighted: false, tchapUsage: .roomIsAccessibleToExternals)
            }
        }
    }
}

extension TchapRoomHeaderViewRoomPropertiesBadgesView {
    static var sample: TchapRoomHeaderViewRoomPropertiesBadgesView {
        TchapRoomHeaderViewRoomPropertiesBadgesView(isEncrypted: .constant(true), isPublic: .constant(false), externalCount: .constant(3))
    }
}

struct TchapRoomHeaderViewRoomPropertiesBadgesView_Previews: PreviewProvider, TestablePreview {
    static var previews: some View {
        TchapRoomHeaderViewRoomPropertiesBadgesView(isEncrypted: .constant(true), isPublic: .constant(true), externalCount: .constant(3))
            .previewDisplayName("Some externals")
        TchapRoomHeaderViewRoomPropertiesBadgesView(isEncrypted: .constant(true), isPublic: .constant(false), externalCount: .constant(1))
            .previewDisplayName("1 external")
        TchapRoomHeaderViewRoomPropertiesBadgesView(isEncrypted: .constant(false), isPublic: .constant(true), externalCount: .constant(0))
            .previewDisplayName("No external")
    }
}
