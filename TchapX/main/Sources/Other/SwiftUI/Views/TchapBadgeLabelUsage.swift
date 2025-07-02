//
// Copyright 2025 DINUM.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

// Tchap: custom display of badges in Tchap.
public enum TchapBadgeLabelUsage {
    case userIsExternal(inRoomHeaderView: Bool = false)
    case roomIsEncrypted(inRoomHeaderView: Bool = false)
    case roomIsNotEncrypted(inRoomHeaderView: Bool = false)
    case roomIsPublic(inRoomHeaderView: Bool = false)
    case roomIsAccessibleToExternals(inRoomHeaderView: Bool = false)
    
    var iconSize: CompoundIcon.Size {
        switch self {
        case .userIsExternal(let inRoomHeaderView): inRoomHeaderView ? .custom(9.0) : .xSmall
        case .roomIsEncrypted(let inRoomHeaderView): inRoomHeaderView ? .custom(9.0) : .xSmall
        case .roomIsNotEncrypted(let inRoomHeaderView): inRoomHeaderView ? .custom(9.0) : .xSmall
        case .roomIsPublic(let inRoomHeaderView): inRoomHeaderView ? .custom(9.0) : .xSmall
        case .roomIsAccessibleToExternals(let inRoomHeaderView): inRoomHeaderView ? .custom(8.0) : .xSmall
        }
    }
    
    var titleColor: Color {
        switch self {
        case .userIsExternal: CompoundCoreColorTokens.orange1200
        case .roomIsEncrypted: CompoundCoreColorTokens.green1200
        case .roomIsNotEncrypted: CompoundCoreColorTokens.gray1200
        case .roomIsPublic: CompoundCoreColorTokens.gray1200
        case .roomIsAccessibleToExternals: CompoundCoreColorTokens.orange1200
        }
    }
    
    var iconColor: Color {
        switch self {
        case .userIsExternal: CompoundCoreColorTokens.orange1200
        case .roomIsEncrypted: CompoundCoreColorTokens.green1200
        case .roomIsNotEncrypted: CompoundCoreColorTokens.gray1200
        case .roomIsPublic: CompoundCoreColorTokens.gray1200
        case .roomIsAccessibleToExternals: CompoundCoreColorTokens.orange1200
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .userIsExternal: CompoundCoreColorTokens.orange400
        case .roomIsEncrypted: CompoundCoreColorTokens.green400
        case .roomIsNotEncrypted: CompoundCoreColorTokens.gray400
        case .roomIsPublic: CompoundCoreColorTokens.gray400
        case .roomIsAccessibleToExternals: CompoundCoreColorTokens.orange400
        }
    }
    
    var font: Font {
        switch self {
        case .userIsExternal(let inRoomHeaderView):
            if inRoomHeaderView == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        case .roomIsEncrypted(let inRoomHeaderView):
            if inRoomHeaderView == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        case .roomIsNotEncrypted(let inRoomHeaderView):
            if inRoomHeaderView == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        case .roomIsPublic(let inRoomHeaderView):
            if inRoomHeaderView == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        case .roomIsAccessibleToExternals(let inRoomHeaderView):
            if inRoomHeaderView == true { .system(size: 9.0).bold() } else { .system(size: 12.0).bold() }
        }
    }
    
    var leadingPadding: CGFloat {
        switch self {
        case .userIsExternal(let inRoomHeaderView),
             .roomIsEncrypted(let inRoomHeaderView),
             .roomIsNotEncrypted(let inRoomHeaderView),
             .roomIsPublic(let inRoomHeaderView),
             .roomIsAccessibleToExternals(let inRoomHeaderView):
            if inRoomHeaderView == true { 4.0 } else { 8.0 }
        }
    }
    
    var trailingPadding: CGFloat {
        switch self {
        case .userIsExternal(let inRoomHeaderView),
             .roomIsEncrypted(let inRoomHeaderView),
             .roomIsNotEncrypted(let inRoomHeaderView),
             .roomIsPublic(let inRoomHeaderView),
             .roomIsAccessibleToExternals(let inRoomHeaderView):
            if inRoomHeaderView == true { 5.0 } else { 12.0 }
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .userIsExternal(let inRoomHeaderView),
             .roomIsEncrypted(let inRoomHeaderView),
             .roomIsNotEncrypted(let inRoomHeaderView),
             .roomIsPublic(let inRoomHeaderView),
             .roomIsAccessibleToExternals(let inRoomHeaderView):
            if inRoomHeaderView == true { 2.0 } else { 4.0 }
        }
    }
    
    var spaceBetweenIconAndLabel: CGFloat {
        6.0
    }
}
