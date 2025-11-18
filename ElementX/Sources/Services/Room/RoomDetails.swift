//
// Copyright 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Foundation

// Tchap: Add Matrix SDK dependency for accessRule and visbility properties.
import MatrixRustSDK

struct RoomDetails {
    let id: String
    let name: String?
    let avatar: RoomAvatar
    let canonicalAlias: String?
    let isEncrypted: Bool
    let isPublic: Bool
    let isDirect: Bool
    // Tchap: add AccessRule and visibility values
    let accessRule: AccessRule?
    let visibility: RoomVisibility
    // Tchap: helper to write the condition once. Private Unencrypted rooms accessible by link are seen as `isPublic`, like Public Forums.
    // But their `visibility` is `.private` in order to not be listed in room directories.
    // The AccessRule.visibility value makes the difference between (Forums) which are `.public`, and (Private Unencrypted rooms accessible by link) which are `.private`.
    var canDisplayPublicBadge: Bool { visibility == .public }
}
