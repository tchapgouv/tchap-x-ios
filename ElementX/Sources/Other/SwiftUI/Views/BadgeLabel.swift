//
// Copyright 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

struct BadgeLabel: View {
    let title: String
    let icon: KeyPath<CompoundIcons, Image>
    let isHighlighted: Bool
    let tchapUsage: TchapUsage // Tchap: Tchap usage
    
    // Tchap: usage of badges in Tchap, Must be defined in BadgeLabel rather then BadgeLabelStyle because BadgeLabelStyle is private.
    public enum TchapUsage {
        case none // By default, keep ElementX behavior.
        case userIsExternal(inRoomHeaderView: Bool = false)
        case roomIsEncrypted(inRoomHeaderView: Bool = false)
        case roomIsNotEncrypted(inRoomHeaderView: Bool = false)
        case roomIsPublic(inRoomHeaderView: Bool = false)
        case roomIsAccessibleToExternals(inRoomHeaderView: Bool = false)
    }

    // Tchap: evaluate our own icon size
    var iconSize: CompoundIcon.Size {
        switch tchapUsage {
        case .none: .xSmall
        case .userIsExternal(let inRoomHeaderView): inRoomHeaderView ? .custom(9.0) : .xSmall
        case .roomIsEncrypted(let inRoomHeaderView): inRoomHeaderView ? .custom(9.0) : .xSmall
        case .roomIsNotEncrypted(let inRoomHeaderView): inRoomHeaderView ? .custom(89.0) : .xSmall
        case .roomIsPublic(let inRoomHeaderView): inRoomHeaderView ? .custom(9.0) : .xSmall
        case .roomIsAccessibleToExternals(let inRoomHeaderView): inRoomHeaderView ? .custom(8.0) : .xSmall
        }
    }

    // Tchap: convenience init for tchapUsage default value.
    init(title: String, icon: KeyPath<CompoundIcons, Image>, isHighlighted: Bool, tchapUsage: TchapUsage = .none) {
        self.title = title
        self.icon = icon
        self.isHighlighted = isHighlighted
        self.tchapUsage = tchapUsage
    }
    
    var body: some View {
        Label(title,
              icon: icon,
              iconSize: iconSize, // Tchap: use our own icon size
              relativeTo: .compound.bodySM)
            .labelStyle(BadgeLabelStyle(isHighlighted: isHighlighted, tchapUsage: tchapUsage)) // Tchap: add tchapUsage property.
    }
}

private struct BadgeLabelStyle: LabelStyle {
    let isHighlighted: Bool
    let tchapUsage: BadgeLabel.TchapUsage // Tchap: add Tchap usage

    // Tchap: evaluate our own color
//    var titleColor: Color {
//        isHighlighted ? .compound._badgeTextSuccess : .compound._badgeTextSubtle
//    }
    var titleColor: Color {
        switch tchapUsage {
        case .none: isHighlighted ? .compound.textBadgeAccent : .compound.textBadgeInfo
        case .userIsExternal: CompoundCoreColorTokens.orange1200
        case .roomIsEncrypted: CompoundCoreColorTokens.green1200
        case .roomIsNotEncrypted: CompoundCoreColorTokens.gray1200
        case .roomIsPublic: CompoundCoreColorTokens.gray1200
        case .roomIsAccessibleToExternals: CompoundCoreColorTokens.orange1200
        }
    }
    
    // Tchap: evaluate our own color
//    var iconColor: Color {
//        isHighlighted ? .compound.iconSuccessPrimary : .compound.iconSecondary
//    }
    var iconColor: Color {
        switch tchapUsage {
        case .none: isHighlighted ? .compound.iconSuccessPrimary : .compound.iconInfoPrimary
        case .userIsExternal: CompoundCoreColorTokens.orange1200
        case .roomIsEncrypted: CompoundCoreColorTokens.green1200
        case .roomIsNotEncrypted: CompoundCoreColorTokens.gray1200
        case .roomIsPublic: CompoundCoreColorTokens.gray1200
        case .roomIsAccessibleToExternals: CompoundCoreColorTokens.orange1200
        }
    }

    // Tchap: evaluate our own color
//    var backgroundColor: Color {
//        isHighlighted ? .compound._bgBadgeSuccess : .compound.bgSubtlePrimary
//    }
    var backgroundColor: Color {
        switch tchapUsage {
        case .none: isHighlighted ? .compound.bgBadgeAccent : .compound.bgBadgeInfo
        case .userIsExternal: CompoundCoreColorTokens.orange400
        case .roomIsEncrypted: CompoundCoreColorTokens.green400
        case .roomIsNotEncrypted: CompoundCoreColorTokens.gray400
        case .roomIsPublic: CompoundCoreColorTokens.gray400
        case .roomIsAccessibleToExternals: CompoundCoreColorTokens.orange400
        }
    }
    
    // Tchap: evaluate font on usage
    var font: Font {
        switch tchapUsage {
        case .none:
            .compound.bodySM
        case .userIsExternal:
            .compound.bodySMSemibold
        case .roomIsEncrypted(let inRoomHeaderView):
            if inRoomHeaderView == true { .system(size: 7.0).bold() } else { .system(size: 9.0).bold() }
        case .roomIsNotEncrypted(let inRoomHeaderView):
            if inRoomHeaderView == true { .system(size: 7.0).bold() } else { .system(size: 9.0).bold() }
        case .roomIsPublic(let inRoomHeaderView):
            if inRoomHeaderView == true { .system(size: 7.0).bold() } else { .system(size: 9.0).bold() }
        case .roomIsAccessibleToExternals(let inRoomHeaderView):
            if inRoomHeaderView == true { .system(size: 7.0).bold() } else { .system(size: 9.0).bold() }
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 4) {
            configuration.icon
                .foregroundStyle(iconColor)
            configuration.title
                .foregroundStyle(titleColor)
        }
        .font(font)
        .padding(.leading, 8)
        .padding(.trailing, 12)
        .padding(.vertical, 4)
        .background(Capsule().fill(backgroundColor))
    }
}

struct BadgeLabel_Previews: PreviewProvider, TestablePreview {
    static var previews: some View {
        VStack(spacing: 10) {
            BadgeLabel(title: "Encrypted",
                       icon: \.lockSolid,
                       isHighlighted: true)
            BadgeLabel(title: "Not encrypted",
                       icon: \.lockSolid,
                       isHighlighted: false)
        }
    }
}
