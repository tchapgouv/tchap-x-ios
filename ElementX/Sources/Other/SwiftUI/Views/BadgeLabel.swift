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
    let tchapUsage: TchapBadgeLabelUsage? // Tchap: Tchap usage, nil if use ElementX default design.

    // Tchap: evaluate our own icon size
    var iconSize: CompoundIcon.Size {
        tchapUsage?.iconSize ?? .xSmall
    }

    // Tchap: convenience init for tchapUsage default value.
    init(title: String, icon: KeyPath<CompoundIcons, Image>, isHighlighted: Bool, tchapUsage: TchapBadgeLabelUsage? = nil) {
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
    let tchapUsage: TchapBadgeLabelUsage? // Tchap: add Tchap usage, nil if use ElementX default design.

    var titleColor: Color {
        // Tchap: evaluate our own color
//        isHighlighted ? .compound._badgeTextSuccess : .compound._badgeTextSubtle
        tchapUsage?.titleColor ?? (isHighlighted ? .compound.textBadgeAccent : .compound.textBadgeInfo)
    }
    
    var iconColor: Color {
        // Tchap: evaluate our own color
//        isHighlighted ? .compound.iconSuccessPrimary : .compound.iconSecondary
        tchapUsage?.iconColor ?? (isHighlighted ? .compound.iconSuccessPrimary : .compound.iconInfoPrimary)
    }

    var backgroundColor: Color {
        // Tchap: evaluate our own color
//        isHighlighted ? .compound._bgBadgeSuccess : .compound.bgSubtlePrimary
        tchapUsage?.backgroundColor ?? (isHighlighted ? .compound.bgBadgeAccent : .compound.bgBadgeInfo)
    }
    
    var font: Font {
        // Tchap: evaluate font on usage
//        .compound.bodySM
        tchapUsage?.font ?? .compound.bodySM
    }
    
    func makeBody(configuration: Configuration) -> some View {
        // Tchap: customize spacing between icon and label
        //        HStack(spacing: 4) {
        HStack(spacing: tchapUsage?.spaceBetweenIconAndLabel ?? 4.0) {
            configuration.icon
                .foregroundStyle(iconColor)
            configuration.title
                .foregroundStyle(titleColor)
        }
        .font(font)
        // Tchap: evaluate padding
//        .padding(.leading, 8)
//        .padding(.trailing, 12)
//        .padding(.vertical, 4)
        .padding(.leading, tchapUsage?.leadingPadding ?? 8)
        .padding(.trailing, tchapUsage?.trailingPadding ?? 12)
        .padding(.vertical, tchapUsage?.verticalPadding ?? 4)
        // Tchap: use RoundedRectangle rather than capsule. It is more DSFR friendly.
//        .background(Capsule().fill(backgroundColor))
        .background(RoundedRectangle(cornerSize: CGSize(width: 4.0, height: 4.0)).fill(backgroundColor))
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
