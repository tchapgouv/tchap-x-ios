//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Foundation

/// This parameters are only used in the create room flow for having persisted informations between screens
struct CreateRoomFlowParameters {
    var name = ""
    var topic = ""
    var isRoomPrivate = true
    var isRoomEncrypted = true // Tchap: add encrypted option to private
    var isRoomFederated = true // Tchap: add option to not federate public room. Always True for private room. Always starts at true for any type of room.
    var isKnockingOnly = false
    var avatarImageMedia: MediaInfo?
    var aliasLocalPart: String?
}
