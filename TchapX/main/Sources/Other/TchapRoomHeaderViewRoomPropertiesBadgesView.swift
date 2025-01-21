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
                Label(TchapL10n.roomHeaderBadgeEncrypted, systemSymbol: .lockFill)
                    .labelStyle(.titleAndIcon)
                    .tchapRoomLabelView(usage: .roomIsEncrypted)
            } else {
                Label(TchapL10n.roomHeaderBadgeNotEncrypted, systemSymbol: .lockSlashFill)
                    .labelStyle(.titleAndIcon)
                    .tchapRoomLabelView(usage: .roomIsNotEncrypted)
            }
            if let isPublic = isPublic,
               isPublic == true {
                Label(TchapL10n.roomHeaderBadgePublic, systemSymbol: .globe)
                    .labelStyle(.titleAndIcon)
                    .tchapRoomLabelView(usage: .roomIsPublic)
            } else if externalCount > 0 {
                Label(TchapL10n.roomHeaderBadgeAuthorizedToExternal, systemSymbol: .globe)
                    .labelStyle(.titleAndIcon)
                    .tchapRoomLabelView(usage: .roomIsAccessibleToExternals)
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
