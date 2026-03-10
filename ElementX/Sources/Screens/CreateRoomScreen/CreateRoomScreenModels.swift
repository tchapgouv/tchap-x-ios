//
// Copyright 2025 Element Creations Ltd.
// Copyright 2022-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import SwiftUI

enum CreateRoomScreenErrorType: Error {
    case failedCreatingRoom
    case failedProcessingMedia
    case failedUploadingMedia
    case fileTooLarge
    case mediaFileError
    case unknown
}

enum CreateRoomScreenViewModelAction {
    case createdRoom(JoinedRoomProxyProtocol, SpaceRoomListProxyProtocol?)
    case displayMediaPicker
    case displayCameraPicker
    case dismiss
}

struct CreateRoomScreenViewState: BindableState {
    let isSpace: Bool
    let shouldShowCancelButton: Bool
    var roomName: String
    let serverName: String
    let isKnockingFeatureEnabled: Bool
    let canSelectSpace: Bool
    var aliasLocalPart: String
    var editableSpaces: [SpaceServiceRoom] = []
    var bindings: CreateRoomScreenViewStateBindings
    var avatarMediaInfo: MediaInfo? {
        didSet {
            switch avatarMediaInfo {
            case .image(_, let thumbnailURL, _):
                avatarImage = UIImage(contentsOfFile: thumbnailURL.path(percentEncoded: false))
            default:
                avatarImage = nil
            }
        }
    }
    
    var avatarImage: UIImage?
    
    var canCreateRoom: Bool {
        !roomName.isEmpty && aliasErrors.isEmpty
    }

    var aliasErrors: Set<CreateRoomScreenAliasErrorState> = []
    var aliasErrorDescription: String? {
        if aliasErrors.contains(.alreadyExists) {
            L10n.errorRoomAddressAlreadyExists
        } else if aliasErrors.contains(.invalidSymbols) {
            L10n.errorRoomAddressInvalidSymbols
        } else {
            nil
        }
    }
        
    var availableAccessTypes: [CreateRoomScreenAccessType] {
        var availableAccessTypes: [CreateRoomScreenAccessType] = []
        if isSpace {
            // Tchap: enumerate `public` cases wit hfederated associated value.
//            availableAccessTypes = [.public]
            availableAccessTypes = [.public(federated: true), .public(federated: false)]
        } else if let selectedSpace = bindings.selectedSpace, selectedSpace.joinRule != .public {
            availableAccessTypes = [.spaceMembers]
            if isKnockingFeatureEnabled {
                availableAccessTypes.append(.askToJoinWithSpaceMembers)
            }
        } else {
            // Tchap: enumerate `public` cases wit hfederated associated value.
//            availableAccessTypes = [.public]
            availableAccessTypes = [.public(federated: true), .public(federated: false)]
            if isKnockingFeatureEnabled {
                availableAccessTypes.append(.askToJoin)
            }
            // Tchap: add privateUnencrypted case to room access types.
            availableAccessTypes.append(.privateUnencrypted)
        }
        availableAccessTypes.append(.private)
        return availableAccessTypes
    }
    
    var roomAccessType: CreateRoomAccessType {
        switch bindings.selectedAccessType {
        // Tchap: handle public case with associated value `federated`.
//        case .public:
//            return .public
        case .public(let federated):
            return .public(federated: federated)
        case .spaceMembers:
            return .spaceMembers(spaceID: bindings.selectedSpace?.id ?? "")
        case .askToJoinWithSpaceMembers:
            return .askToJoinWithSpaceMembers(spaceID: bindings.selectedSpace?.id ?? "")
        case .askToJoin:
            return .askToJoin
        case .private:
            return .private
        // Tchap: handle privateUnencrypted case.
        case .privateUnencrypted:
            return .privateUnencrypted
        }
    }
}

struct CreateRoomScreenViewStateBindings {
    var roomTopic: String
    var selectedAccessType: CreateRoomScreenAccessType
    var selectedSpace: SpaceServiceRoom?
    // Tchap: add possibility to not federate public room. True for private room.
    // This computed property is only used to set the correct `selectedAccessType` when .public is selected.
    var isRoomFederated: Bool {
        get {
            switch selectedAccessType {
            case .public(let federated):
                federated
            case .askToJoin:
                true
            case .private:
                true
            case .privateUnencrypted:
                true
            case .spaceMembers, .askToJoinWithSpaceMembers:
                // Tchap: return false (Space members not federatd) for the moment.
                // TOOD: check the meaning of federation for Space membership.
                false
            }
        }
        
        set {
            if case .public = selectedAccessType {
                selectedAccessType = .public(federated: newValue)
            }
        }
    }
    
    var showAttachmentConfirmationDialog = false
    var showSpaceSelectionSheet = false
    
    /// Information describing the currently displayed alert.
    var alertInfo: AlertInfo<CreateRoomScreenErrorType>?
}

enum CreateRoomScreenViewAction {
    case dismiss
    case createRoom
    case displayCameraPicker
    case displayMediaPicker
    case removeImage
    case updateRoomName(String)
    case updateAliasLocalPart(String)
}

enum CreateRoomScreenAliasErrorState {
    case alreadyExists
    case invalidSymbols
}

extension Set<CreateRoomScreenAliasErrorState> {
    var errorDescription: String? {
        if contains(.alreadyExists) {
            return L10n.errorRoomAddressAlreadyExists
        } else if contains(.invalidSymbols) {
            return L10n.errorRoomAddressInvalidSymbols
        }
        return nil
    }
}

// Tchap: Declare CreateRoomScreenAccessType Hashable  (and therefore Equatable) for use in CreateRoomScreen
enum CreateRoomScreenAccessType: Hashable {
    // enum CreateRoomScreenAccessType {
    // Tchap: handle `isFederated` associated value for `public` room. CaseIterable is not automatically implement then.
    // case `public`
    case `public`(federated: Bool)
    case spaceMembers
    case askToJoinWithSpaceMembers
    case askToJoin
    case `private`
    // Tchap: add private unencrypted room type
    case privateUnencrypted
}

enum CreateRoomScreenSpaceSelectionMode {
    case editableSpacesList(preSelectedSpace: SpaceServiceRoom?)
    case none
}
