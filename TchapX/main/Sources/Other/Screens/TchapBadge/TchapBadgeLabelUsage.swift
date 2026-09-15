//
// Copyright 2025 DINUM.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

// Tchap: usage of badges in Tchap.
@MainActor
public enum TchapBadgeLabelUsage {
    case userIsExternal(useSmallSize: Bool = false)
    case inviteByEmail(useSmallSize: Bool = false)
    case roomIsEncrypted(useSmallSize: Bool = false)
    case roomIsNotEncrypted(useSmallSize: Bool = false)
    case roomIsPublic(useSmallSize: Bool = false)
    case roomIsAccessibleToExternals(useSmallSize: Bool = false)
    case recommendedOption // Tchap: badge for recommended room creation option

    // Tchap: evaluate our own icon size
    var iconSize: CompoundIcon.Size {
        switch self {
        case .userIsExternal(let useSmallSize),
             .inviteByEmail(let useSmallSize),
             .roomIsEncrypted(let useSmallSize),
             .roomIsNotEncrypted(let useSmallSize),
             .roomIsPublic(let useSmallSize),
             .roomIsAccessibleToExternals(let useSmallSize):
            useSmallSize ? .custom(9.0) : .xSmall
        case .recommendedOption: .custom(9.0)
        }
    }

    var titleColor: Color {
        switch self {
        case .userIsExternal: .compound.textBadgeWarning
        case .inviteByEmail: .compound.textSecondary
        case .roomIsEncrypted: .compound.textBadgeSuccess
        case .roomIsNotEncrypted: .compound.textBadgeSecondary
        case .roomIsPublic: .compound.textBadgeWarning
        case .roomIsAccessibleToExternals: .compound.textBadgeWarning
        case .recommendedOption: .compound.textSecondary
        }
    }

    var iconColor: Color {
        switch self {
        case .userIsExternal: .compound.iconBadgeWarning
        case .inviteByEmail: .compound.iconCriticalPrimary
        case .roomIsEncrypted: .compound.iconBadgeSuccess
        case .roomIsNotEncrypted: .compound.iconBadgeSecondary
        case .roomIsPublic: .compound.iconBadgeWarning
        case .roomIsAccessibleToExternals: .compound.iconBadgeWarning
        case .recommendedOption: .compound.iconBadgeSecondary
        }
    }

    var backgroundColor: Color {
        switch self {
        case .userIsExternal: .compound.bgBadgeWarning
        case .inviteByEmail: .clear
        case .roomIsEncrypted: .compound.bgBadgeSuccess
        case .roomIsNotEncrypted: .compound.bgBadgeSecondary
        case .roomIsPublic: .compound.bgBadgeWarning
        case .roomIsAccessibleToExternals: .compound.bgBadgeWarning
        case .recommendedOption: .compound.bgBadgeSecondary
        }
    }

    var font: Font {
        switch self {
        case .userIsExternal(let useSmallSize),
             .inviteByEmail(let useSmallSize),
             .roomIsEncrypted(let useSmallSize),
             .roomIsNotEncrypted(let useSmallSize),
             .roomIsPublic(let useSmallSize),
             .roomIsAccessibleToExternals(let useSmallSize):
            if useSmallSize == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        case .recommendedOption:
            .system(size: 9.0).bold()
        }
    }
    
    var leadingPadding: CGFloat {
        switch self {
        case .userIsExternal(let useSmallSize),
             .roomIsEncrypted(let useSmallSize), .roomIsNotEncrypted(let useSmallSize),
             .roomIsPublic(let useSmallSize),
             .roomIsAccessibleToExternals(let useSmallSize):
            if useSmallSize == true { 4.0 } else { 8.0 }
        case .inviteByEmail: 0.0
        case .recommendedOption: 4.0
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
        case .inviteByEmail: 0.0
        case .recommendedOption: 5.0
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .userIsExternal(let useSmallSize),
             .inviteByEmail(let useSmallSize),
             .roomIsEncrypted(let useSmallSize),
             .roomIsNotEncrypted(let useSmallSize),
             .roomIsPublic(let useSmallSize),
             .roomIsAccessibleToExternals(let useSmallSize):
            if useSmallSize == true { 2.0 } else { 4.0 }
        case .recommendedOption: 2.0
        }
    }
}
