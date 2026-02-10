//
// Copyright 2025 Element Creations Ltd.
// Copyright 2022-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Foundation

// Tchap: Add Matrix SDK dependency for RoomVisibility type.
import MatrixRustSDK

enum ThreadTimelineScreenViewModelAction {
    case displayMessageForwarding(MessageForwardingItem)
}

struct ThreadTimelineScreenViewState: BindableState {
    var roomTitle: String
    var roomAvatar: RoomAvatar
    var canSendMessage = true
    var dmRecipientVerificationState: UserIdentityVerificationState?
    
    var bindings = ThreadTimelineScreenViewStateBindings()
}

struct ThreadTimelineScreenViewStateBindings {
    /// The view model used to present a QuickLook media preview.
    var mediaPreviewViewModel: TimelineMediaPreviewViewModel?
    
    // Tchap: display room properties badges. As they are queried async, make them Bindable.
    var isEncrypted: Bool?
    var isPublic: Bool?
    var accessRule: AccessRule?
    var visibilityInRoomDirectory: RoomVisibility!
    var canDisplayPublicBadge: Bool!
    var roomAvatar: RoomAvatar?
    // Tchap: end
}

enum ThreadTimelineScreenViewAction { }
