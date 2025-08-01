/*
 * MIT License
 *
 * Copyright (c) 2024. DINUM
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
 * OR OTHER DEALINGS IN THE SOFTWARE.
 */

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
        HStack(spacing: 3) {
            if let isEncrypted = isEncrypted,
               isEncrypted == true {
                BadgeLabel(title: TchapL10n.roomHeaderBadgeEncrypted, icon: \.lockSolid, style: .info, tchapUsage: .roomIsEncrypted(inRoomHeaderView: true))
            } else {
                BadgeLabel(title: TchapL10n.roomHeaderBadgeNotEncrypted, icon: \.lockOff, style: .info, tchapUsage: .roomIsNotEncrypted(inRoomHeaderView: true))
            }
            if let isPublic = isPublic,
               isPublic == true {
                BadgeLabel(title: TchapL10n.roomHeaderBadgePublic, icon: \.public, style: .info, tchapUsage: .roomIsPublic(inRoomHeaderView: true))
            } else if externalCount > 0 {
                BadgeLabel(title: TchapL10n.roomHeaderBadgeAuthorizedToExternal, icon: \.public, style: .info, tchapUsage: .roomIsAccessibleToExternals(inRoomHeaderView: true))
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
