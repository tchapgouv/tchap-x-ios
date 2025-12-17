//
// Copyright 2025 DINUM.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

// Tchap: usage of badges in Tchap.
public enum TchapBadgeLabelUsage {
    case userIsExternal(useSmallSize: Bool = false)
    case roomIsEncrypted(useSmallSize: Bool = false)
    case roomIsNotEncrypted(useSmallSize: Bool = false)
    case roomIsPublic(useSmallSize: Bool = false)
    case roomIsAccessibleToExternals(useSmallSize: Bool = false)

    // Tchap: evaluate our own icon size
    var iconSize: CompoundIcon.Size {
        switch self {
        case .userIsExternal(let useSmallSize): useSmallSize ? .custom(9.0) : .xSmall
        case .roomIsEncrypted(let useSmallSize): useSmallSize ? .custom(9.0) : .xSmall
        case .roomIsNotEncrypted(let useSmallSize): useSmallSize ? .custom(9.0) : .xSmall
        case .roomIsPublic(let useSmallSize): useSmallSize ? .custom(9.0) : .xSmall
        case .roomIsAccessibleToExternals(let useSmallSize): useSmallSize ? .custom(8.0) : .xSmall
        }
    }

    var titleColor: Color {
        switch self {
        case .userIsExternal: CompoundCoreColorTokens.orange1100
        case .roomIsEncrypted: .compound.textBadgeAccent
        case .roomIsNotEncrypted: .compound.textBadgeInfo
        case .roomIsPublic: .compound.textBadgeInfo
        case .roomIsAccessibleToExternals: CompoundCoreColorTokens.orange1100
        }
    }

    var iconColor: Color {
        switch self {
        case .userIsExternal: .compound.textDecorative6
        case .roomIsEncrypted: .compound.iconAccentPrimary
        case .roomIsNotEncrypted: .compound.iconInfoPrimary
        case .roomIsPublic: .compound.iconInfoPrimary
        case .roomIsAccessibleToExternals: .compound.textDecorative6
        }
    }

    var backgroundColor: Color {
        switch self {
        case .userIsExternal: CompoundCoreColorTokens.orange300
        case .roomIsEncrypted: .compound.bgBadgeAccent
        case .roomIsNotEncrypted: .compound.bgBadgeInfo
        case .roomIsPublic: .compound.bgBadgeDefault
        case .roomIsAccessibleToExternals: CompoundCoreColorTokens.orange300
        }
    }

    var font: Font {
        switch self {
        case .userIsExternal(let useSmallSize):
            if useSmallSize == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        case .roomIsEncrypted(let useSmallSize):
            if useSmallSize == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        case .roomIsNotEncrypted(let useSmallSize):
            if useSmallSize == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        case .roomIsPublic(let useSmallSize):
            if useSmallSize == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        case .roomIsAccessibleToExternals(let useSmallSize):
            if useSmallSize == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        }
    }
    
    var leadingPadding: CGFloat {
        switch self {
        case .userIsExternal(let useSmallSize),
             .roomIsEncrypted(let useSmallSize), .roomIsNotEncrypted(let useSmallSize),
             .roomIsPublic(let useSmallSize),
             .roomIsAccessibleToExternals(let useSmallSize):
            if useSmallSize == true { 4.0 } else { 8.0 }
        }
    }
    
    var trailingPadding: CGFloat {
        switch self {
        case .userIsExternal(let useSmallSize),
             .roomIsEncrypted(let useSmallSize),
             .roomIsNotEncrypted(let useSmallSize),
             .roomIsPublic(let useSmallSize),
             .roomIsAccessibleToExternals(let useSmallSize):
            if useSmallSize == true { 5.0 } else { 12.0 }
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .userIsExternal(let useSmallSize),
             .roomIsEncrypted(let useSmallSize),
             .roomIsNotEncrypted(let useSmallSize),
             .roomIsPublic(let useSmallSize),
             .roomIsAccessibleToExternals(let useSmallSize):
            if useSmallSize == true { 2.0 } else { 4.0 }
        }
    }
}
