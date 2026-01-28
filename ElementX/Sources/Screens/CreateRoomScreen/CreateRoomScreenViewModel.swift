//
// Copyright 2025 Element Creations Ltd.
// Copyright 2022-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Combine
import MatrixRustSDK
import SwiftUI

typealias CreateRoomScreenViewModelType = StateStoreViewModel<CreateRoomScreenViewState, CreateRoomScreenViewAction>

class CreateRoomScreenViewModel: CreateRoomScreenViewModelType, CreateRoomScreenViewModelProtocol {
<<<<<<< HEAD
    struct Parameters {
        var name = ""
        var topic = ""
        var isRoomPrivate = true
        var isRoomEncrypted = true // Tchap: add encrypted option to private
        var isRoomFederated = true // Tchap: add option to not federate public room. Always True for private room. Always starts at true for any type of room.
        var isKnockingOnly = false
        var avatarImageMedia: MediaInfo?
        var aliasLocalPart: String?
    }
    
=======
>>>>>>> release/26.01.0
    private let userSession: UserSessionProtocol
    private let mediaUploadingPreprocessor: MediaUploadingPreprocessor
    private let analytics: AnalyticsService
    private let userIndicatorController: UserIndicatorControllerProtocol
    private var syncNameAndAlias = true
    @CancellableTask private var checkAliasAvailabilityTask: Task<Void, Never>?
    
    private var actionsSubject: PassthroughSubject<CreateRoomScreenViewModelAction, Never> = .init()
    
    var actions: AnyPublisher<CreateRoomScreenViewModelAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }
    
    init(isSpace: Bool,
         userSession: UserSessionProtocol,
         analytics: AnalyticsService,
         userIndicatorController: UserIndicatorControllerProtocol,
         appSettings: AppSettings) {
        self.userSession = userSession
        mediaUploadingPreprocessor = MediaUploadingPreprocessor(appSettings: appSettings)
        self.analytics = analytics
        self.userIndicatorController = userIndicatorController
        
<<<<<<< HEAD
        let bindings = CreateRoomScreenViewStateBindings(roomTopic: parameters.topic,
                                                         isRoomPrivate: parameters.isRoomPrivate,
                                                         isRoomEncrypted: parameters.isRoomEncrypted, // Tchap: additional property
                                                         isRoomFederated: parameters.isRoomFederated, // Tchap: additional property
                                                         isKnockingOnly: appSettings.knockingEnabled ? parameters.isKnockingOnly : false)
=======
        let bindings = CreateRoomScreenViewStateBindings(roomTopic: "",
                                                         selectedAccessType: .private)
>>>>>>> release/26.01.0

        super.init(initialViewState: CreateRoomScreenViewState(isSpace: isSpace,
                                                               roomName: "",
                                                               serverName: userSession.clientProxy.userIDServerName ?? "",
                                                               isKnockingFeatureEnabled: appSettings.knockingEnabled,
                                                               aliasLocalPart: roomAliasNameFromRoomDisplayName(roomName: ""),
                                                               bindings: bindings),
                   mediaProvider: userSession.mediaProvider)
        
        setupBindings()
    }
    
    // MARK: - Public
    
    override func process(viewAction: CreateRoomScreenViewAction) {
        switch viewAction {
        case .createRoom:
            Task { await createRoom() }
        case .displayCameraPicker:
            actionsSubject.send(.displayCameraPicker)
        case .displayMediaPicker:
            actionsSubject.send(.displayMediaPicker)
        case .removeImage:
            state.avatarMediaInfo = nil
        case .updateAliasLocalPart(let aliasLocalPart):
            state.aliasLocalPart = aliasLocalPart.lowercased()
            // If this has been called this means that the user wants a custom address not necessarily reflecting the name
            // So we disable the two from syncing.
            syncNameAndAlias = false
        case .updateRoomName(let name):
            // Reset the syncing if the name is fully cancelled
            if name.isEmpty {
                syncNameAndAlias = true
            }
            state.roomName = name
            if syncNameAndAlias {
                state.aliasLocalPart = roomAliasNameFromRoomDisplayName(roomName: name)
            }
        }
    }
    
    func updateAvatar(fileURL: URL) {
        showLoadingIndicator()
        Task { [weak self] in
            guard let self else { return }
            do {
                guard case let .success(maxUploadSize) = await userSession.clientProxy.maxMediaUploadSize else {
                    MXLog.error("Failed to get max upload size")
                    userIndicatorController.alertInfo = AlertInfo(id: .init())
                    return
                }
                let mediaInfo = try await mediaUploadingPreprocessor.processMedia(at: fileURL, maxUploadSize: maxUploadSize).get()
                
                switch mediaInfo {
                case .image:
                    state.avatarMediaInfo = mediaInfo
                default:
                    break
                }
            } catch {
                userIndicatorController.alertInfo = AlertInfo(id: .init())
            }
            hideLoadingIndicator()
        }
    }
    
    // MARK: - Private

    private func setupBindings() {
        // Reset the state related to public rooms if the user choses the room to be empty
        context.$viewState
            .dropFirst()
            .map(\.bindings.selectedAccessType)
            .removeDuplicates()
            .filter(\.isPrivate)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                state.aliasErrors = []
                state.aliasLocalPart = roomAliasNameFromRoomDisplayName(roomName: state.roomName)
                syncNameAndAlias = true
            }
            .store(in: &cancellables)
        
        context.$viewState
<<<<<<< HEAD
            .throttle(for: 0.5, scheduler: DispatchQueue.main, latest: true)
            .removeDuplicates { old, new in
                old.roomName == new.roomName &&
                    old.bindings.roomTopic == new.bindings.roomTopic &&
                    old.bindings.isRoomPrivate == new.bindings.isRoomPrivate &&
                    old.bindings.isRoomEncrypted == new.bindings.isRoomEncrypted && // Tchap: additional property
                    old.bindings.isRoomFederated == new.bindings.isRoomFederated && // Tchap: additional property
                    old.bindings.isKnockingOnly == new.bindings.isKnockingOnly &&
                    old.aliasLocalPart == new.aliasLocalPart
            }
            .sink { [weak self] state in
                guard let self else { return }
                updateParameters(state: state)
            }
            .store(in: &cancellables)
        
        context.$viewState
=======
>>>>>>> release/26.01.0
            .map(\.aliasLocalPart)
            .removeDuplicates()
            .debounce(for: 1, scheduler: DispatchQueue.main)
            .sink { [weak self] aliasLocalPart in
                guard let self else {
                    return
                }
                
                guard !state.bindings.selectedAccessType.isPrivate,
                      let canonicalAlias = String.makeCanonicalAlias(aliasLocalPart: aliasLocalPart,
                                                                     serverName: state.serverName) else {
                    // While is empty or private room we don't change or display the error
                    return
                }
                
                if !isRoomAliasFormatValid(alias: canonicalAlias) {
                    state.aliasErrors.insert(.invalidSymbols)
                    // If the alias is invalid we don't need to check for availability
                    state.aliasErrors.remove(.alreadyExists)
                    checkAliasAvailabilityTask = nil
                    return
                }
                
                state.aliasErrors.remove(.invalidSymbols)
                
                checkAliasAvailabilityTask = Task { [weak self] in
                    guard let self else {
                        return
                    }
                    
                    if case .success(false) = await self.userSession.clientProxy.isAliasAvailable(canonicalAlias) {
                        guard !Task.isCancelled else { return }
                        state.aliasErrors.insert(.alreadyExists)
                    } else {
                        guard !Task.isCancelled else { return }
                        state.aliasErrors.remove(.alreadyExists)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
<<<<<<< HEAD
    private func updateParameters(state: CreateRoomScreenViewState) {
        parameters.name = state.roomName
        parameters.topic = state.bindings.roomTopic
        parameters.isRoomPrivate = state.bindings.isRoomPrivate
        parameters.isRoomEncrypted = state.bindings.isRoomEncrypted // Tchap: additional property
        parameters.isRoomFederated = state.bindings.isRoomFederated // Tchap: additional property
        parameters.isKnockingOnly = state.bindings.isKnockingOnly
        if state.isKnockingFeatureEnabled, !state.aliasLocalPart.isEmpty {
            parameters.aliasLocalPart = state.aliasLocalPart
        } else {
            parameters.aliasLocalPart = nil
        }
    }
    
=======
>>>>>>> release/26.01.0
    private func createRoom() async {
        defer {
            hideLoadingIndicator()
        }
        showLoadingIndicator()
        
        // Better to double check the errors also when trying to create the room
        if !state.bindings.selectedAccessType.isPrivate {
            guard let canonicalAlias = String.makeCanonicalAlias(aliasLocalPart: state.aliasLocalPart,
                                                                 serverName: state.serverName),
                isRoomAliasFormatValid(alias: canonicalAlias) else {
                state.aliasErrors = [.invalidSymbols]
                return
            }
            
            switch await userSession.clientProxy.isAliasAvailable(canonicalAlias) {
            case .success(true):
                break
            case .success(false):
                state.aliasErrors = [.alreadyExists]
                return
            case .failure:
                state.bindings.alertInfo = AlertInfo(id: .unknown)
                return
            }
        }
        
        let avatarURL: URL?
        if let media = state.avatarMediaInfo {
            switch await userSession.clientProxy.uploadMedia(media) {
            case .success(let url):
                avatarURL = URL(string: url)
            case .failure(let error):
                switch error {
                case .failedUploadingMedia(let errorKind):
                    switch errorKind {
                    case .tooLarge:
                        state.bindings.alertInfo = AlertInfo(id: .fileTooLarge)
                    default:
                        state.bindings.alertInfo = AlertInfo(id: .failedUploadingMedia)
                    }
                case .invalidMedia:
                    state.bindings.alertInfo = AlertInfo(id: .mediaFileError)
                default:
                    state.bindings.alertInfo = AlertInfo(id: .unknown)
                }
                
                return
            }
        } else {
            avatarURL = nil
        }
        
<<<<<<< HEAD
        switch await userSession.clientProxy.createRoom(name: parameters.name,
                                                        topic: parameters.topic.isBlank ? nil : parameters.topic,
                                                        isRoomPrivate: parameters.isRoomPrivate,
                                                        isRoomEncrypted: parameters.isRoomEncrypted, // Tchap: additional property
                                                        // TODO: add parameter       isRoomFederated: createRoomParameters.isRoomPrivate || createRoomParameters. , // Tchap: additional property `isRoomFederated`. And Private room is always federated. Only Public room can be non-federated.
                                                        // As of right now we don't want to make private rooms with the knock rule
                                                        isKnockingOnly: parameters.isRoomPrivate ? false : parameters.isKnockingOnly,
=======
        switch await userSession.clientProxy.createRoom(name: state.roomName,
                                                        topic: state.bindings.roomTopic.isBlank ? nil : state.bindings.roomTopic,
                                                        accessType: state.bindings.selectedAccessType,
                                                        isSpace: state.isSpace,
>>>>>>> release/26.01.0
                                                        userIDs: [], // The invite users screen is shown next so we don't need to invite anyone right now.
                                                        avatarURL: avatarURL,
                                                        aliasLocalPart: state.bindings.selectedAccessType.isPrivate ? nil : state.aliasLocalPart) {
        case .success(let roomID):
            guard case let .joined(roomProxy) = await userSession.clientProxy.roomForIdentifier(roomID) else {
                state.bindings.alertInfo = AlertInfo(id: .failedCreatingRoom,
                                                     title: L10n.commonError,
                                                     message: L10n.screenStartChatErrorStartingChat)
                return
            }
            analytics.trackCreatedRoom(isDM: false)
            actionsSubject.send(.createdRoom(roomProxy))
        case .failure:
            state.bindings.alertInfo = AlertInfo(id: .failedCreatingRoom,
                                                 title: L10n.commonError,
                                                 message: L10n.screenStartChatErrorStartingChat)
        }
    }
    
    // MARK: Loading indicator
    
    private static let loadingIndicatorIdentifier = "\(CreateRoomScreenViewModel.self)-Loading"
    
    private func showLoadingIndicator() {
        userIndicatorController.submitIndicator(UserIndicator(id: Self.loadingIndicatorIdentifier,
                                                              type: .modal(progress: .indeterminate, interactiveDismissDisabled: true, allowsInteraction: false),
                                                              title: L10n.commonLoading,
                                                              persistent: true))
    }
    
    private func hideLoadingIndicator() {
        userIndicatorController.retractIndicatorWithId(Self.loadingIndicatorIdentifier)
    }
}
