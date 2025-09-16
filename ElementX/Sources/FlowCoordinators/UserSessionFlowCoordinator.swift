//
// Copyright 2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import AVKit
import Combine
import Compound
import MatrixRustSDK
import SwiftState
import SwiftUI

enum UserSessionFlowCoordinatorAction {
    case logout
    case clearCache
    /// Logout and disable App Lock without any confirmation. The user forgot their PIN.
    case forceLogout
}

class UserSessionFlowCoordinator: FlowCoordinatorProtocol {
    enum HomeTab: Hashable { case chats, spaces }
    
    private let navigationRootCoordinator: NavigationRootCoordinator
    private let navigationTabCoordinator: NavigationTabCoordinator<HomeTab>
    private let appLockService: AppLockServiceProtocol
    private let flowParameters: CommonFlowParameters
    
    private var userSession: UserSessionProtocol { flowParameters.userSession }
    
    private let onboardingFlowCoordinator: OnboardingFlowCoordinator
    private let onboardingStackCoordinator: NavigationStackCoordinator
    private let chatsFlowCoordinator: ChatsFlowCoordinator
    private let chatsTabDetails: NavigationTabCoordinator<HomeTab>.TabDetails
    private let spaceExplorerFlowCoordinator: SpaceExplorerFlowCoordinator
    private let spacesTabDetails: NavigationTabCoordinator<HomeTab>.TabDetails
    
    // periphery:ignore - retaining purpose
    private var settingsFlowCoordinator: SettingsFlowCoordinator?
    
    enum State: StateType {
        /// The state machine hasn't started.
        case initial
        /// The root screen for this flow.
        case tabBar
        /// Showing the settings screen.
        case settingsScreen
    }
    
    enum Event: EventType {
        /// The flow is being started.
        case start
        
        /// Request presentation of the settings screen.
        case showSettingsScreen
        /// The settings screen has been dismissed.
        case dismissedSettingsScreen
    }
    
    private let stateMachine: StateMachine<State, Event>
    private var cancellables: Set<AnyCancellable> = []
    
    private let actionsSubject: PassthroughSubject<UserSessionFlowCoordinatorAction, Never> = .init()
    var actionsPublisher: AnyPublisher<UserSessionFlowCoordinatorAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }
    
    init(isNewLogin: Bool,
         navigationRootCoordinator: NavigationRootCoordinator,
         appLockService: AppLockServiceProtocol,
         flowParameters: CommonFlowParameters) {
        self.navigationRootCoordinator = navigationRootCoordinator
        self.appLockService = appLockService
        self.flowParameters = flowParameters
        
        navigationTabCoordinator = NavigationTabCoordinator()
        navigationRootCoordinator.setRootCoordinator(navigationTabCoordinator)
        
        let chatsSplitCoordinator = NavigationSplitCoordinator(placeholderCoordinator: PlaceholderScreenCoordinator())
        chatsFlowCoordinator = ChatsFlowCoordinator(isNewLogin: isNewLogin,
                                                    navigationSplitCoordinator: chatsSplitCoordinator,
                                                    flowParameters: flowParameters)
        chatsTabDetails = .init(tag: HomeTab.chats, title: L10n.screenHomeTabChats, icon: \.chat, selectedIcon: \.chatSolid)
        chatsTabDetails.navigationSplitCoordinator = chatsSplitCoordinator
        
        if !flowParameters.appSettings.spacesEnabled {
            chatsTabDetails.barVisibilityOverride = .hidden
        }
        
        let spacesSplitCoordinator = NavigationSplitCoordinator(placeholderCoordinator: PlaceholderScreenCoordinator())
        spaceExplorerFlowCoordinator = SpaceExplorerFlowCoordinator(navigationSplitCoordinator: spacesSplitCoordinator,
                                                                    flowParameters: flowParameters)
        spacesTabDetails = .init(tag: HomeTab.spaces, title: L10n.screenHomeTabSpaces, icon: \.space, selectedIcon: \.spaceSolid)
        spacesTabDetails.navigationSplitCoordinator = spacesSplitCoordinator
        
        onboardingStackCoordinator = NavigationStackCoordinator()
        onboardingFlowCoordinator = OnboardingFlowCoordinator(isNewLogin: isNewLogin,
                                                              appLockService: appLockService,
                                                              navigationStackCoordinator: onboardingStackCoordinator,
                                                              flowParameters: flowParameters)
        
        navigationTabCoordinator.setTabs([
            .init(coordinator: chatsSplitCoordinator, details: chatsTabDetails),
            .init(coordinator: spacesSplitCoordinator, details: spacesTabDetails)
        ])
        
        stateMachine = flowParameters.stateMachineFactory.makeUserSessionFlowStateMachine(state: .initial)
        configureStateMachine()
        
        setupObservers()
    }
    
    func start() {
        stateMachine.tryEvent(.start)
    }
    
    func stop() {
        chatsFlowCoordinator.stop()
    }
    
    func handleAppRoute(_ appRoute: AppRoute, animated: Bool) {
        switch appRoute {
        case .accountProvisioningLink:
            break // We always ignore this flow when logged in.
        case .settings, .chatBackupSettings:
            if stateMachine.state != .settingsScreen {
                stateMachine.tryEvent(.showSettingsScreen)
            }
            settingsFlowCoordinator?.handleAppRoute(appRoute, animated: animated)
        case .call(let roomID):
            Task { await presentCallScreen(roomID: roomID) }
        case .genericCallLink(let url):
            presentCallScreen(genericCallLink: url)
        case .roomList, .room, .roomAlias, .childRoom, .childRoomAlias,
             .roomDetails, .roomMemberDetails, .userProfile,
             .event, .eventOnRoomAlias, .childEvent, .childEventOnRoomAlias,
             .share, .transferOwnership:
            clearPresentedSheets(animated: animated) // Make sure the presented route is visible.
            chatsFlowCoordinator.handleAppRoute(appRoute, animated: animated)
            if navigationTabCoordinator.selectedTab != .chats {
                navigationTabCoordinator.selectedTab = .chats
            }
        }
    }
    
    func clearRoute(animated: Bool) {
        clearPresentedSheets(animated: animated)
        chatsFlowCoordinator.clearRoute(animated: animated)
    }
    
    // Clearing routes is more complicated than it first seems. When passing routes
    // to the chats flow we can't clear all routes as e.g. childRoom/childEvent etc
    // expect to push into the existing stack. But we do need to hide any sheets that
    // might cover up the presented route. BUT! We probably shouldn't dismiss onboarding
    // or verification flows until they're complete… This needs more thought before we
    // codify it all into the state machine.
    private func clearPresentedSheets(animated: Bool) {
        switch stateMachine.state {
        case .initial, .tabBar:
            break
        case .settingsScreen:
            navigationTabCoordinator.setSheetCoordinator(nil, animated: animated)
        }
    }
    
    func isDisplayingRoomScreen(withRoomID roomID: String) -> Bool {
        guard navigationTabCoordinator.selectedTab == .chats else { return false }
        return chatsFlowCoordinator.isDisplayingRoomScreen(withRoomID: roomID)
    }
    
    // MARK: - Private
    
<<<<<<< HEAD
    func asyncHandleAppRoute(_ appRoute: AppRoute, animated: Bool) async {
        showLoadingIndicator(delay: .seconds(0.5))
        defer { hideLoadingIndicator() }
        
        await clearPresentedSheets(animated: animated)
        
        switch appRoute {
        case .room(let roomID, let via):
            stateMachine.processEvent(.selectRoom(roomID: roomID, via: via, entryPoint: .room), userInfo: .init(animated: animated))
        case .roomAlias(let alias):
            switch await userSession.clientProxy.resolveRoomAlias(alias) {
            case .success(let resolved): await asyncHandleAppRoute(.room(roomID: resolved.roomId, via: resolved.servers), animated: animated)
            case .failure: showFailureIndicator()
            }
        case .childRoom(let roomID, let via):
            if let roomFlowCoordinator {
                roomFlowCoordinator.handleAppRoute(appRoute, animated: animated)
            } else {
                stateMachine.processEvent(.selectRoom(roomID: roomID, via: via, entryPoint: .room), userInfo: .init(animated: animated))
            }
        case .childRoomAlias(let alias):
            switch await userSession.clientProxy.resolveRoomAlias(alias) {
            case .success(let resolved): await asyncHandleAppRoute(.childRoom(roomID: resolved.roomId, via: resolved.servers), animated: animated)
            case .failure: showFailureIndicator()
            }
        case .roomDetails(let roomID):
            if stateMachine.state.roomListSelectedRoomID == roomID {
                roomFlowCoordinator?.handleAppRoute(appRoute, animated: animated)
            } else {
                stateMachine.processEvent(.selectRoom(roomID: roomID, via: [], entryPoint: .roomDetails), userInfo: .init(animated: animated))
            }
        case .roomList:
            roomFlowCoordinator?.clearRoute(animated: animated)
        case .roomMemberDetails:
            roomFlowCoordinator?.handleAppRoute(appRoute, animated: animated)
        case .event(let eventID, let roomID, let via):
            stateMachine.processEvent(.selectRoom(roomID: roomID, via: via, entryPoint: .eventID(eventID)), userInfo: .init(animated: animated))
        case .eventOnRoomAlias(let eventID, let alias):
            switch await userSession.clientProxy.resolveRoomAlias(alias) {
            case .success(let resolved): await asyncHandleAppRoute(.event(eventID: eventID, roomID: resolved.roomId, via: resolved.servers), animated: animated)
            case .failure: showFailureIndicator()
            }
        case .childEvent:
            roomFlowCoordinator?.handleAppRoute(appRoute, animated: animated)
        case .childEventOnRoomAlias(let eventID, let alias):
            switch await userSession.clientProxy.resolveRoomAlias(alias) {
            case .success(let resolved): await asyncHandleAppRoute(.childEvent(eventID: eventID, roomID: resolved.roomId, via: resolved.servers), animated: animated)
            case .failure: showFailureIndicator()
            }
        case .userProfile(let userID):
            stateMachine.processEvent(.showUserProfileScreen(userID: userID), userInfo: .init(animated: animated))
        case .call(let roomID):
            Task { await presentCallScreen(roomID: roomID, notifyOtherParticipants: false) }
        case .genericCallLink(let url):
            presentCallScreen(genericCallLink: url)
        case .settings, .chatBackupSettings:
            settingsFlowCoordinator.handleAppRoute(appRoute, animated: animated)
        case .share(let payload):
            if let roomID = payload.roomID {
                stateMachine.processEvent(.selectRoom(roomID: roomID,
                                                      via: [],
                                                      entryPoint: .share(payload)),
                                          userInfo: .init(animated: animated))
            } else {
                stateMachine.processEvent(.showShareExtensionRoomList(sharePayload: payload), userInfo: .init(animated: animated))
            }
        case .accountProvisioningLink:
            break // We always ignore this flow when logged in.
        }
    }
    
    func attemptStartingOnboarding() {
        MXLog.info("Attempting to start onboarding")
        
        if onboardingFlowCoordinator.shouldStart {
            clearRoute(animated: false)
            onboardingFlowCoordinator.start()
        }
    }
    
    private func clearPresentedSheets(animated: Bool) async {
        if navigationSplitCoordinator.sheetCoordinator == nil {
            return
        }
        
        navigationSplitCoordinator.setSheetCoordinator(nil, animated: animated)
        
        // Prevents system crashes when presenting a sheet if another one was already shown
        try? await Task.sleep(for: .seconds(0.25))
    }
    
    private func setupStateMachine() {
        stateMachine.addTransitionHandler { [weak self] context in
            guard let self else { return }
            let animated = (context.userInfo as? UserSessionFlowCoordinatorStateMachine.EventUserInfo)?.animated ?? true
            switch (context.fromState, context.event, context.toState) {
            case (.initial, .start, .roomList):
                presentHomeScreen()
                attemptStartingOnboarding()
            case(.roomList(let roomListSelectedRoomID), .selectRoom(let roomID, let via, let entryPoint), .roomList):
                if roomListSelectedRoomID == roomID,
                   !entryPoint.isEventID, // Don't reuse the existing room so the live timeline is hidden while the detached timeline is loading.
                   let roomFlowCoordinator {
                    let route: AppRoute = switch entryPoint {
                    case .room: .room(roomID: roomID, via: via)
                    case .roomDetails: .roomDetails(roomID: roomID)
                    case .eventID(let eventID): .event(eventID: eventID, roomID: roomID, via: via) // ignored.
                    case .share(let payload): .share(payload)
                    }
                    roomFlowCoordinator.handleAppRoute(route, animated: animated)
                } else {
                    Task { await self.startRoomFlow(roomID: roomID, via: via, entryPoint: entryPoint, animated: animated) }
                }
                hideCallScreenOverlay() // Turn any active call into a PiP so that navigation from a notification is visible to the user.
            case(.roomList, .deselectRoom, .roomList):
                dismissRoomFlow(animated: animated)
            case (.roomList, .showSettingsScreen, .settingsScreen):
                break
            case (.settingsScreen, .dismissedSettingsScreen, .roomList):
                break
            case (.roomList, .feedbackScreen, .feedbackScreen):
                bugReportFlowCoordinator = BugReportFlowCoordinator(parameters: .init(presentationMode: .sheet(sidebarNavigationStackCoordinator),
                                                                                      userIndicatorController: ServiceLocator.shared.userIndicatorController,
                                                                                      bugReportService: bugReportService,
                                                                                      userSession: userSession))
                bugReportFlowCoordinator?.start()
            case (.feedbackScreen, .dismissedFeedbackScreen, .roomList):
                break
            case (.roomList, .showRecoveryKeyScreen, .recoveryKeyScreen):
                presentRecoveryKeyScreen(animated: animated)
            case (.recoveryKeyScreen, .dismissedRecoveryKeyScreen, .roomList):
                break
            case (.roomList, .startEncryptionResetFlow, .encryptionResetFlow):
                startEncryptionResetFlow(animated: animated)
            case (.encryptionResetFlow, .finishedEncryptionResetFlow, .roomList):
                break
            case (.roomList, .showStartChatScreen, .startChatScreen):
                presentStartChat(animated: animated)
            case (.startChatScreen, .dismissedStartChatScreen, .roomList):
                break
            case (.roomList, .showLogoutConfirmationScreen, .logoutConfirmationScreen):
                presentSecureBackupLogoutConfirmationScreen()
            case (.logoutConfirmationScreen, .dismissedLogoutConfirmationScreen, .roomList):
                break
            case (.roomList, .showRoomDirectorySearchScreen, .roomDirectorySearchScreen):
                presentRoomDirectorySearch()
            // Tchap: handle dismissing mode for dismissedRoomDirectorySearchScreen
//            case (.roomDirectorySearchScreen, .dismissedRoomDirectorySearchScreen, .roomList):
//                dismissRoomDirectorySearch()
            case (.roomDirectorySearchScreen, .dismissedRoomDirectorySearchScreen(let isPresentedInFullScreenMode), .roomList),
                 (.roomList, .dismissedRoomDirectorySearchScreen(let isPresentedInFullScreenMode), .roomList):
                dismissRoomDirectorySearch(isPresentedInFullScreenMode: isPresentedInFullScreenMode)
            case (_, .showUserProfileScreen(let userID), .userProfileScreen):
                presentUserProfileScreen(userID: userID, animated: animated)
            case (.userProfileScreen, .dismissedUserProfileScreen, .roomList):
                break
            case (.roomList, .presentReportRoomScreen(let roomID), .reportRoomScreen):
                Task { await self.presentReportRoom(for: roomID) }
            case (.reportRoomScreen, .dismissedReportRoomScreen, .roomList):
                break
            case (.roomList, .presentDeclineAndBlockScreen(let userID, let roomID), .declineAndBlockUserScreen):
                presentDeclineAndBlockScreen(userID: userID, roomID: roomID)
            case (.declineAndBlockUserScreen, .dismissedDeclineAndBlockScreen, .roomList):
                break
            case (.roomList(let roomListSelectedRoomID), .showShareExtensionRoomList, .shareExtensionRoomList(let sharePayload)):
                Task {
                    if roomListSelectedRoomID != nil {
                        self.clearRoute(animated: animated)
                        try? await Task.sleep(for: .seconds(1.5))
                    }
                    
                    self.presentRoomSelectionScreen(sharePayload: sharePayload, animated: animated)
                }
            case (.shareExtensionRoomList, .dismissedShareExtensionRoomList, .roomList):
                dismissRoomSelectionScreen()
            default:
                fatalError("Unknown transition: \(context)")
            }
=======
    private func configureStateMachine() {
        stateMachine.addRoutes(event: .start, transitions: [.initial => .tabBar]) { [weak self] _ in
            guard let self else { return }
            
            chatsFlowCoordinator.start()
            spaceExplorerFlowCoordinator.start()
            attemptStartingOnboarding()
>>>>>>> release/25.09.4
        }
        
        stateMachine.addRoutes(event: .showSettingsScreen, transitions: [.tabBar => .settingsScreen]) { [weak self] _ in
            self?.startSettingsFlow()
        }
        stateMachine.addRoutes(event: .dismissedSettingsScreen, transitions: [.settingsScreen => .tabBar]) { [weak self] _ in
            self?.settingsFlowCoordinator = nil
        }
        
        stateMachine.addErrorHandler { context in
            fatalError("Unexpected transition: \(context)")
        }
    }
    
    private func setupObservers() {
        chatsFlowCoordinator.actionsPublisher
            .sink { [weak self] action in
                guard let self else { return }
                switch action {
                case .showSettings:
                    handleAppRoute(.settings, animated: true)
                case .showChatBackupSettings:
                    handleAppRoute(.chatBackupSettings, animated: true)
                case .sessionVerification(let flow):
                    presentSessionVerificationScreen(flow: flow)
                case .showCallScreen(let roomProxy):
                    presentCallScreen(roomProxy: roomProxy)
                case .hideCallScreenOverlay:
                    hideCallScreenOverlay()
                case .logout:
                    Task { await self.runLogoutFlow() }
                }
            }
            .store(in: &cancellables)
        
        spaceExplorerFlowCoordinator.actionsPublisher
            .sink { [weak self] action in
                guard let self else { return }
                switch action {
                case .presentCallScreen(let roomProxy):
                    presentCallScreen(roomProxy: roomProxy)
                case .verifyUser(let userID):
                    presentSessionVerificationScreen(flow: .userInitiator(userID: userID))
                case .showSettings:
                    stateMachine.tryEvent(.showSettingsScreen)
                }
            }
            .store(in: &cancellables)
        
        userSession.sessionSecurityStatePublisher
            .map(\.verificationState)
            .filter { $0 != .unknown }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                
                attemptStartingOnboarding()
                setupSessionVerificationRequestsObserver()
            }
            .store(in: &cancellables)
        
        let reachabilityNotificationID = "io.element.elementx.reachability.notification"
        userSession.clientProxy.homeserverReachabilityPublisher.removeDuplicates()
            .combineLatest(flowParameters.appMediator.networkMonitor.reachabilityPublisher.removeDuplicates())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] homeserverReachability, networkReachability in
                MXLog.info("Homeserver reachability: \(homeserverReachability)")
                
                guard let self else { return }
                switch (homeserverReachability, networkReachability) {
                case (.reachable, _):
                    flowParameters.userIndicatorController.retractIndicatorWithId(reachabilityNotificationID)
                case (.unreachable, .unreachable):
                    flowParameters.userIndicatorController.submitIndicator(.init(id: reachabilityNotificationID,
                                                                                 title: L10n.commonOffline,
                                                                                 persistent: true))
                case (.unreachable, .reachable):
                    flowParameters.userIndicatorController.submitIndicator(.init(id: reachabilityNotificationID,
                                                                                 title: L10n.commonServerUnreachable,
                                                                                 persistent: true))
                }
            }
            .store(in: &cancellables)
        
        onboardingFlowCoordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .requestPresentation(let animated):
                    navigationTabCoordinator.setFullScreenCoverCoordinator(onboardingStackCoordinator, animated: animated)
                case .dismiss:
                    navigationTabCoordinator.setFullScreenCoverCoordinator(nil)
                case .logout:
                    logout()
                }
            }
            .store(in: &cancellables)
        
        flowParameters.elementCallService.actions
            .receive(on: DispatchQueue.main)
            .sink { [weak self] action in
                switch action {
                case .endCall:
                    self?.dismissCallScreenIfNeeded()
                default:
                    break
                }
            }
            .store(in: &cancellables)
        
        flowParameters.appSettings.$spacesEnabled
            .combineLatest(userSession.clientProxy.spaceService.joinedSpacesPublisher)
            .map { $0 && !$1.isEmpty ? nil : .hidden }
            .weakAssign(to: \.chatsTabDetails.barVisibilityOverride, on: self)
            .store(in: &cancellables)
    }
    
    // MARK: - Onboarding
    
    private func attemptStartingOnboarding() {
        MXLog.info("Attempting to start onboarding")
        
        if onboardingFlowCoordinator.shouldStart {
            clearRoute(animated: false)
            onboardingFlowCoordinator.start()
        }
    }
    
    // MARK: - Settings
    
    private func startSettingsFlow() {
        let navigationStackCoordinator = NavigationStackCoordinator()
        let coordinator = SettingsFlowCoordinator(appLockService: appLockService,
                                                  navigationStackCoordinator: navigationStackCoordinator,
                                                  flowParameters: flowParameters)
        
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .dismiss:
                navigationTabCoordinator.setSheetCoordinator(nil)
            case .clearCache:
                actionsSubject.send(.clearCache)
            case .runLogoutFlow:
                Task {
                    self.navigationTabCoordinator.setSheetCoordinator(nil)
                    
                    // The sheet needs to be dismissed before the alert can be shown
                    try await Task.sleep(for: .milliseconds(100))
                    await self.runLogoutFlow()
                }
            case .forceLogout:
                actionsSubject.send(.forceLogout)
            }
        }
        .store(in: &cancellables)
        
        settingsFlowCoordinator = coordinator
        coordinator.handleAppRoute(.settings, animated: false)
        
        navigationTabCoordinator.setSheetCoordinator(navigationStackCoordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissedSettingsScreen)
        }
    }
    
    // MARK: - Session Verification
    
    private func setupSessionVerificationRequestsObserver() {
        userSession.clientProxy.sessionVerificationController?.actions
            .receive(on: DispatchQueue.main)
            .sink { [weak self] action in
                guard let self, case .receivedVerificationRequest(let details) = action else {
                    return
                }
                
                MXLog.info("Received session verification request")
                
                if details.senderProfile.userID == userSession.clientProxy.userID {
                    presentSessionVerificationScreen(flow: .deviceResponder(requestDetails: details))
                } else {
                    presentSessionVerificationScreen(flow: .userResponder(requestDetails: details))
                }
            }
            .store(in: &cancellables)
    }
    
    private func presentSessionVerificationScreen(flow: SessionVerificationScreenFlow) {
        guard let sessionVerificationController = userSession.clientProxy.sessionVerificationController else {
            fatalError("The sessionVerificationController should aways be valid at this point")
        }
        
        let navigationStackCoordinator = NavigationStackCoordinator()
        
        let parameters = SessionVerificationScreenCoordinatorParameters(sessionVerificationControllerProxy: sessionVerificationController,
                                                                        flow: flow,
                                                                        appSettings: flowParameters.appSettings,
                                                                        mediaProvider: userSession.mediaProvider)
        
        let coordinator = SessionVerificationScreenCoordinator(parameters: parameters)
        
        coordinator.actions
            .sink { [weak self] action in
                switch action {
                case .done:
                    self?.navigationTabCoordinator.setSheetCoordinator(nil)
                }
            }
            .store(in: &cancellables)
        
        navigationStackCoordinator.setRootCoordinator(coordinator)
        
        navigationTabCoordinator.setSheetCoordinator(navigationStackCoordinator)
    }
    
<<<<<<< HEAD
    private func presentHomeScreen() {
        let parameters = HomeScreenCoordinatorParameters(userSession: userSession,
                                                         bugReportService: bugReportService,
                                                         selectedRoomPublisher: selectedRoomSubject.asCurrentValuePublisher(),
                                                         appSettings: appSettings,
                                                         analyticsService: analytics,
                                                         notificationManager: notificationManager,
                                                         userIndicatorController: ServiceLocator.shared.userIndicatorController)
        let coordinator = HomeScreenCoordinator(parameters: parameters)
        
        coordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .presentRoom(let roomID):
                    handleAppRoute(.room(roomID: roomID, via: []), animated: true)
                case .presentRoomDetails(let roomID):
                    handleAppRoute(.roomDetails(roomID: roomID), animated: true)
                case .presentReportRoom(let roomID):
                    stateMachine.processEvent(.presentReportRoomScreen(roomID: roomID))
                case .roomLeft(let roomID):
                    if case .roomList(roomListSelectedRoomID: let roomListSelectedRoomID) = stateMachine.state,
                       roomListSelectedRoomID == roomID {
                        clearRoute(animated: true)
                    }
                case .presentSettingsScreen:
                    settingsFlowCoordinator.handleAppRoute(.settings, animated: true)
                case .presentFeedbackScreen:
                    stateMachine.processEvent(.feedbackScreen)
                case .presentSecureBackupSettings:
                    settingsFlowCoordinator.handleAppRoute(.chatBackupSettings, animated: true)
                case .presentRecoveryKeyScreen:
                    stateMachine.processEvent(.showRecoveryKeyScreen)
                case .presentEncryptionResetScreen:
                    stateMachine.processEvent(.startEncryptionResetFlow)
                case .presentStartChatScreen:
                    stateMachine.processEvent(.showStartChatScreen)
                case .presentGlobalSearch:
                    presentGlobalSearch()
                case .logoutWithoutConfirmation:
                    self.actionsSubject.send(.logout)
                case .logout:
                    Task { await self.runLogoutFlow() }
                case .presentDeclineAndBlock(let userID, let roomID):
                    stateMachine.processEvent(.presentDeclineAndBlockScreen(userID: userID, roomID: roomID))
                }
            }
            .store(in: &cancellables)
        
        sidebarNavigationStackCoordinator.setRootCoordinator(coordinator)
        
        navigationRootCoordinator.setRootCoordinator(navigationSplitCoordinator)
    }
    
    private func presentReportRoom(for roomID: String) async {
        guard let roomProxyType = await userSession.clientProxy.roomForIdentifier(roomID),
              case let .joined(roomProxy) = roomProxyType else {
            MXLog.error("Failed to get room proxy for room: \(roomID)")
            return
        }
        
        let navigationStackCoordinator = NavigationStackCoordinator()
        let coordinator = ReportRoomScreenCoordinator(parameters: .init(roomProxy: roomProxy,
                                                                        userIndicatorController: ServiceLocator.shared.userIndicatorController))
        coordinator.actionsPublisher.sink { [weak self] action in
            guard let self else { return }
            switch action {
            case .dismiss(let shouldLeaveRoom):
                if shouldLeaveRoom,
                   case .roomList(let roomListSelectedRoomID) = stateMachine.state,
                   roomListSelectedRoomID == roomID {
                    clearRoute(animated: true)
                }
                navigationSplitCoordinator.setSheetCoordinator(nil)
            }
        }
        .store(in: &cancellables)
        navigationStackCoordinator.setRootCoordinator(coordinator)
        navigationSplitCoordinator.setSheetCoordinator(navigationStackCoordinator) { [weak self] in
            self?.stateMachine.processEvent(.dismissedReportRoomScreen)
        }
    }
    
    private func presentDeclineAndBlockScreen(userID: String, roomID: String) {
        let stackCoordinator = NavigationStackCoordinator()
        let coordinator = DeclineAndBlockScreenCoordinator(parameters: .init(userID: userID,
                                                                             roomID: roomID,
                                                                             clientProxy: userSession.clientProxy,
                                                                             userIndicatorController: ServiceLocator.shared.userIndicatorController))
        coordinator.actionsPublisher.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .dismiss:
                navigationSplitCoordinator.setSheetCoordinator(nil)
            }
        }
        .store(in: &cancellables)
        
        stackCoordinator.setRootCoordinator(coordinator)
        navigationSplitCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            self?.stateMachine.processEvent(.dismissedDeclineAndBlockScreen)
        }
    }
    
    private func runLogoutFlow() async {
        let secureBackupController = userSession.clientProxy.secureBackupController
        
        guard case let .success(isLastDevice) = await userSession.clientProxy.isOnlyDeviceLeft() else {
            ServiceLocator.shared.userIndicatorController.alertInfo = .init(id: .init())
            return
        }
        
        guard isLastDevice else {
            logout()
            return
        }
        
        guard secureBackupController.recoveryState.value == .enabled else {
            ServiceLocator.shared.userIndicatorController.alertInfo = .init(id: .init(),
                                                                            title: L10n.screenSignoutRecoveryDisabledTitle,
                                                                            message: L10n.screenSignoutRecoveryDisabledSubtitle,
                                                                            primaryButton: .init(title: L10n.screenSignoutConfirmationDialogSubmit, role: .destructive) { [weak self] in
                                                                                self?.actionsSubject.send(.logout)
                                                                            }, secondaryButton: .init(title: L10n.commonSettings, role: .cancel) { [weak self] in
                                                                                self?.settingsFlowCoordinator.handleAppRoute(.chatBackupSettings, animated: true)
                                                                            })
            return
        }
        
        guard secureBackupController.keyBackupState.value == .enabled else {
            ServiceLocator.shared.userIndicatorController.alertInfo = .init(id: .init(),
                                                                            title: L10n.screenSignoutKeyBackupDisabledTitle,
                                                                            message: L10n.screenSignoutKeyBackupDisabledSubtitle,
                                                                            primaryButton: .init(title: L10n.screenSignoutConfirmationDialogSubmit, role: .destructive) { [weak self] in
                                                                                self?.actionsSubject.send(.logout)
                                                                            }, secondaryButton: .init(title: L10n.commonSettings, role: .cancel) { [weak self] in
                                                                                self?.settingsFlowCoordinator.handleAppRoute(.chatBackupSettings, animated: true)
                                                                            })
            return
        }
        
        presentSecureBackupLogoutConfirmationScreen()
    }
    
    private func logout() {
        ServiceLocator.shared.userIndicatorController.alertInfo = .init(id: .init(),
                                                                        title: L10n.screenSignoutConfirmationDialogTitle,
                                                                        message: L10n.screenSignoutConfirmationDialogContent,
                                                                        primaryButton: .init(title: L10n.screenSignoutConfirmationDialogSubmit, role: .destructive) { [weak self] in
                                                                            self?.actionsSubject.send(.logout)
                                                                        })
    }
    
    // MARK: Room Flow
    
    private func startRoomFlow(roomID: String,
                               via: [String],
                               entryPoint: RoomFlowCoordinatorEntryPoint,
                               animated: Bool) async {
        let coordinator = await RoomFlowCoordinator(roomID: roomID,
                                                    userSession: userSession,
                                                    isChildFlow: false,
                                                    timelineControllerFactory: timelineControllerFactory,
                                                    navigationStackCoordinator: detailNavigationStackCoordinator,
                                                    emojiProvider: EmojiProvider(appSettings: appSettings),
                                                    ongoingCallRoomIDPublisher: elementCallService.ongoingCallRoomIDPublisher,
                                                    appMediator: appMediator,
                                                    appSettings: appSettings,
                                                    appHooks: appHooks,
                                                    analytics: analytics,
                                                    userIndicatorController: ServiceLocator.shared.userIndicatorController)
        
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .presentCallScreen(let roomProxy):
                // Here we assume that the app is running and the call state is already up to date
                presentCallScreen(roomProxy: roomProxy, notifyOtherParticipants: !roomProxy.infoPublisher.value.hasRoomCall)
            case .verifyUser(let userID):
                presentSessionVerificationScreen(flow: .userIntiator(userID: userID))
            case .finished:
                stateMachine.processEvent(.deselectRoom)
            }
        }
        .store(in: &cancellables)
        
        roomFlowCoordinator = coordinator
        
        if navigationSplitCoordinator.detailCoordinator !== detailNavigationStackCoordinator {
            navigationSplitCoordinator.setDetailCoordinator(detailNavigationStackCoordinator, animated: animated)
        }
        
        switch entryPoint {
        case .room:
            coordinator.handleAppRoute(.room(roomID: roomID, via: via), animated: animated)
        case .eventID(let eventID):
            coordinator.handleAppRoute(.event(eventID: eventID, roomID: roomID, via: via), animated: animated)
        case .roomDetails:
            coordinator.handleAppRoute(.roomDetails(roomID: roomID), animated: animated)
        case .share(let payload):
            coordinator.handleAppRoute(.share(payload), animated: animated)
        }
                
        Task {
            let _ = await userSession.clientProxy.trackRecentlyVisitedRoom(roomID)
            
            await notificationManager.removeDeliveredMessageNotifications(for: roomID)
        }
    }
    
    private func dismissRoomFlow(animated: Bool) {
        // THIS MUST BE CALLED *AFTER* THE FLOW HAS TIDIED UP THE STACK OR IT CAN CAUSE A CRASH.
        navigationSplitCoordinator.setDetailCoordinator(nil, animated: animated)
        roomFlowCoordinator = nil
    }
    
    // MARK: Start Chat
    
    private func presentStartChat(animated: Bool) {
        let startChatNavigationStackCoordinator = NavigationStackCoordinator()

        let userDiscoveryService = UserDiscoveryService(clientProxy: userSession.clientProxy)
        let parameters = StartChatScreenCoordinatorParameters(orientationManager: appMediator.windowManager,
                                                              userSession: userSession,
                                                              userIndicatorController: ServiceLocator.shared.userIndicatorController,
                                                              navigationStackCoordinator: startChatNavigationStackCoordinator,
                                                              userDiscoveryService: userDiscoveryService,
                                                              mediaUploadingPreprocessor: MediaUploadingPreprocessor(appSettings: appSettings))
        
        let coordinator = StartChatScreenCoordinator(parameters: parameters)
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            switch action {
            case .close:
                navigationSplitCoordinator.setSheetCoordinator(nil)
            case .openRoom(let roomID):
                navigationSplitCoordinator.setSheetCoordinator(nil)
                stateMachine.processEvent(.selectRoom(roomID: roomID, via: [], entryPoint: .room))
            case .openRoomDirectorySearch:
                navigationSplitCoordinator.setSheetCoordinator(nil)
                stateMachine.processEvent(.showRoomDirectorySearchScreen)
            case .joinForum: // Tchap: handle `joinForum` action
                presentRoomDirectorySearch(inFullScreenMode: false)
            }
        }
        .store(in: &cancellables)

        startChatNavigationStackCoordinator.setRootCoordinator(coordinator)

        navigationSplitCoordinator.setSheetCoordinator(startChatNavigationStackCoordinator, animated: animated) { [weak self] in
            self?.stateMachine.processEvent(.dismissedStartChatScreen)
        }
    }
        
    // MARK: Calls
=======
    // MARK: - Calls
>>>>>>> release/25.09.4
    
    private func presentCallScreen(genericCallLink url: URL) {
        presentCallScreen(configuration: .init(genericCallLink: url))
    }
    
    private func presentCallScreen(roomID: String) async {
        guard case let .joined(roomProxy) = await userSession.clientProxy.roomForIdentifier(roomID) else {
            return
        }
        
        presentCallScreen(roomProxy: roomProxy)
    }
    
    private func presentCallScreen(roomProxy: JoinedRoomProxyProtocol) {
        let colorScheme: ColorScheme = flowParameters.windowManager.mainWindow.traitCollection.userInterfaceStyle == .light ? .light : .dark
        presentCallScreen(configuration: .init(roomProxy: roomProxy,
                                               clientProxy: userSession.clientProxy,
                                               clientID: InfoPlistReader.main.bundleIdentifier,
                                               elementCallBaseURL: flowParameters.appSettings.elementCallBaseURL,
                                               elementCallBaseURLOverride: flowParameters.appSettings.elementCallBaseURLOverride,
                                               colorScheme: colorScheme))
    }
    
    private var callScreenPictureInPictureController: AVPictureInPictureController?
    private func presentCallScreen(configuration: ElementCallConfiguration) {
        guard flowParameters.ongoingCallRoomIDPublisher.value != configuration.callRoomID else {
            MXLog.info("Returning to existing call.")
            callScreenPictureInPictureController?.stopPictureInPicture()
            return
        }
        
        let callScreenCoordinator = CallScreenCoordinator(parameters: .init(elementCallService: flowParameters.elementCallService,
                                                                            configuration: configuration,
                                                                            allowPictureInPicture: true,
                                                                            appSettings: flowParameters.appSettings,
                                                                            appHooks: flowParameters.appHooks,
                                                                            analytics: flowParameters.analytics))
        
        callScreenCoordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                switch action {
                case .pictureInPictureIsAvailable(let controller):
                    callScreenPictureInPictureController = controller
                case .pictureInPictureStarted:
                    MXLog.info("Hiding call for PiP presentation.")
                    navigationTabCoordinator.setOverlayPresentationMode(.minimized)
                case .pictureInPictureStopped:
                    MXLog.info("Restoring call after PiP presentation.")
                    navigationTabCoordinator.setOverlayPresentationMode(.fullScreen)
                case .dismiss:
                    callScreenPictureInPictureController = nil
                    navigationTabCoordinator.setOverlayCoordinator(nil)
                }
            }
            .store(in: &cancellables)
        
        navigationTabCoordinator.setOverlayCoordinator(callScreenCoordinator, animated: true)
        
        flowParameters.analytics.track(screen: .RoomCall)
    }
    
    private func hideCallScreenOverlay() {
        guard let callScreenPictureInPictureController else {
            MXLog.warning("Picture in picture isn't available, dismissing the call screen.")
            dismissCallScreenIfNeeded()
            return
        }
        
        MXLog.info("Starting picture in picture to hide the call screen overlay.")
        callScreenPictureInPictureController.startPictureInPicture()
        navigationTabCoordinator.setOverlayPresentationMode(.minimized)
    }
    
    private func dismissCallScreenIfNeeded() {
        guard navigationTabCoordinator.overlayCoordinator is CallScreenCoordinator else {
            return
        }
        
        navigationTabCoordinator.setOverlayCoordinator(nil)
    }

    // MARK: - Logout
    
    private func runLogoutFlow() async {
        let secureBackupController = userSession.clientProxy.secureBackupController
        
        guard case let .success(isLastDevice) = await userSession.clientProxy.isOnlyDeviceLeft() else {
            flowParameters.userIndicatorController.alertInfo = .init(id: .init())
            return
        }
        
        guard isLastDevice else {
            logout()
            return
        }
        
        guard secureBackupController.recoveryState.value == .enabled else {
            flowParameters.userIndicatorController.alertInfo = .init(id: .init(),
                                                                     title: L10n.screenSignoutRecoveryDisabledTitle,
                                                                     message: L10n.screenSignoutRecoveryDisabledSubtitle,
                                                                     primaryButton: .init(title: L10n.screenSignoutConfirmationDialogSubmit, role: .destructive) { [weak self] in
                                                                         self?.actionsSubject.send(.logout)
                                                                     }, secondaryButton: .init(title: L10n.commonSettings, role: .cancel) { [weak self] in
                                                                         self?.chatsFlowCoordinator.handleAppRoute(.chatBackupSettings, animated: true)
                                                                     })
            return
        }
        
        guard secureBackupController.keyBackupState.value == .enabled else {
            flowParameters.userIndicatorController.alertInfo = .init(id: .init(),
                                                                     title: L10n.screenSignoutKeyBackupDisabledTitle,
                                                                     message: L10n.screenSignoutKeyBackupDisabledSubtitle,
                                                                     primaryButton: .init(title: L10n.screenSignoutConfirmationDialogSubmit, role: .destructive) { [weak self] in
                                                                         self?.actionsSubject.send(.logout)
                                                                     }, secondaryButton: .init(title: L10n.commonSettings, role: .cancel) { [weak self] in
                                                                         self?.chatsFlowCoordinator.handleAppRoute(.chatBackupSettings, animated: true)
                                                                     })
            return
        }
        
        presentSecureBackupLogoutConfirmationScreen()
    }
    
    private func logout() {
        flowParameters.userIndicatorController.alertInfo = .init(id: .init(),
                                                                 title: L10n.screenSignoutConfirmationDialogTitle,
                                                                 message: L10n.screenSignoutConfirmationDialogContent,
                                                                 primaryButton: .init(title: L10n.screenSignoutConfirmationDialogSubmit, role: .destructive) { [weak self] in
                                                                     self?.actionsSubject.send(.logout)
                                                                 })
    }
    
    private func presentSecureBackupLogoutConfirmationScreen() {
        let coordinator = SecureBackupLogoutConfirmationScreenCoordinator(parameters: .init(secureBackupController: userSession.clientProxy.secureBackupController,
                                                                                            homeserverReachabilityPublisher: userSession.clientProxy.homeserverReachabilityPublisher))
        
        coordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .cancel:
                    navigationTabCoordinator.setSheetCoordinator(nil)
                case .settings:
                    chatsFlowCoordinator.handleAppRoute(.chatBackupSettings, animated: true)
                    navigationTabCoordinator.setSheetCoordinator(nil)
                case .logout:
                    actionsSubject.send(.logout)
                }
            }
            .store(in: &cancellables)
        
<<<<<<< HEAD
        navigationSplitCoordinator.setSheetCoordinator(coordinator, animated: true)
    }
    
    // MARK: Global search
    
    private func presentGlobalSearch() {
        let roomSummaryProvider = userSession.clientProxy.alternateRoomSummaryProvider
        
        let coordinator = GlobalSearchScreenCoordinator(parameters: .init(roomSummaryProvider: roomSummaryProvider,
                                                                          mediaProvider: userSession.mediaProvider))
        
        globalSearchScreenCoordinator = coordinator
        
        coordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .dismiss:
                    dismissGlobalSearch()
                case .select(let roomID):
                    dismissGlobalSearch()
                    handleAppRoute(.room(roomID: roomID, via: []), animated: true)
                }
            }
            .store(in: &cancellables)
        
        let hostingController = UIHostingController(rootView: coordinator.toPresentable())
        hostingController.view.backgroundColor = .clear
        appMediator.windowManager.globalSearchWindow.rootViewController = hostingController

        appMediator.windowManager.showGlobalSearch()
    }
    
    private func dismissGlobalSearch() {
        appMediator.windowManager.globalSearchWindow.rootViewController = nil
        appMediator.windowManager.hideGlobalSearch()
        
        globalSearchScreenCoordinator = nil
    }
    
    // MARK: Room Directory Search
    
    // Tchap: add a flag to present the view fullscreen or in sheet.
    // Because in Tchap, it is called from am already fullScreenCover view.
    // And the system can't stack 2 fullScreenCover views.
    // Sp, present it in a sheet for Tchap "Start Chat" view.
//    private func presentRoomDirectorySearch() {
    private func presentRoomDirectorySearch(inFullScreenMode: Bool = true) {
        let coordinator = RoomDirectorySearchScreenCoordinator(parameters: .init(clientProxy: userSession.clientProxy,
                                                                                 mediaProvider: userSession.mediaProvider,
                                                                                 userIndicatorController: ServiceLocator.shared.userIndicatorController))
        
        coordinator.actionsPublisher.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .selectAlias(let alias):
                // Tchap: handle presentation mode to dismiss the view in the correct way.
//                stateMachine.processEvent(.dismissedRoomDirectorySearchScreen)
                stateMachine.processEvent(.dismissedRoomDirectorySearchScreen(isPresentedInFullScreenMode: inFullScreenMode))
                handleAppRoute(.roomAlias(alias), animated: true)
            case .selectRoomID(let roomID):
                // Tchap: handle presentation mode to dismiss the view in the correct way.
//                stateMachine.processEvent(.dismissedRoomDirectorySearchScreen)
                stateMachine.processEvent(.dismissedRoomDirectorySearchScreen(isPresentedInFullScreenMode: inFullScreenMode))
                handleAppRoute(.room(roomID: roomID, via: []), animated: true)
            case .dismiss:
                // Tchap: handle presentation mode to dismiss the view in the correct way.
//                stateMachine.processEvent(.dismissedRoomDirectorySearchScreen)
                stateMachine.processEvent(.dismissedRoomDirectorySearchScreen(isPresentedInFullScreenMode: inFullScreenMode))
            }
        }
        .store(in: &cancellables)
        
        // Tchap: handle presentation mode.
//        navigationSplitCoordinator.setFullScreenCoverCoordinator(coordinator)
        if inFullScreenMode {
            navigationSplitCoordinator.setFullScreenCoverCoordinator(coordinator)
        } else {
            navigationSplitCoordinator.setSheetCoordinator(coordinator)
        }
    }
    
    // Tchap: add a flag to dismiss the view in correct presentation mode: fullscreen or in sheet.
//    private func dismissRoomDirectorySearch() {
//        navigationSplitCoordinator.setFullScreenCoverCoordinator(nil)
//    }
//
    private func dismissRoomDirectorySearch(isPresentedInFullScreenMode: Bool = true) {
        if isPresentedInFullScreenMode {
            navigationSplitCoordinator.setFullScreenCoverCoordinator(nil)
        } else {
            navigationSplitCoordinator.setSheetCoordinator(nil)
        }
    }

    // MARK: User Profile
    
    private func presentUserProfileScreen(userID: String, animated: Bool) {
        clearRoute(animated: animated)
        
        let navigationStackCoordinator = NavigationStackCoordinator()
        let parameters = UserProfileScreenCoordinatorParameters(userID: userID,
                                                                isPresentedModally: true,
                                                                clientProxy: userSession.clientProxy,
                                                                mediaProvider: userSession.mediaProvider,
                                                                userIndicatorController: ServiceLocator.shared.userIndicatorController,
                                                                analytics: analytics)
        let coordinator = UserProfileScreenCoordinator(parameters: parameters)
        coordinator.actionsPublisher.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .openDirectChat(let roomID):
                navigationSplitCoordinator.setSheetCoordinator(nil)
                stateMachine.processEvent(.selectRoom(roomID: roomID, via: [], entryPoint: .room))
            case .startCall(let roomID):
                Task { await self.presentCallScreen(roomID: roomID, notifyOtherParticipants: false) }
            case .dismiss:
                navigationSplitCoordinator.setSheetCoordinator(nil)
            }
        }
        .store(in: &cancellables)
        
        navigationStackCoordinator.setRootCoordinator(coordinator, animated: false)
        navigationSplitCoordinator.setSheetCoordinator(navigationStackCoordinator, animated: animated) { [weak self] in
            self?.stateMachine.processEvent(.dismissedUserProfileScreen)
        }
    }
    
    // MARK: Sharing
    
    private func presentRoomSelectionScreen(sharePayload: ShareExtensionPayload, animated: Bool) {
        let roomSummaryProvider = userSession.clientProxy.alternateRoomSummaryProvider
        
        let stackCoordinator = NavigationStackCoordinator()
        
        let coordinator = RoomSelectionScreenCoordinator(parameters: .init(clientProxy: userSession.clientProxy,
                                                                           roomSummaryProvider: roomSummaryProvider,
                                                                           mediaProvider: userSession.mediaProvider))
        
        coordinator.actionsPublisher.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .dismiss:
                navigationSplitCoordinator.setSheetCoordinator(nil)
            case .confirm(let roomID):
                let sharePayload = switch sharePayload {
                case .mediaFile(_, let mediaFile):
                    ShareExtensionPayload.mediaFile(roomID: roomID, mediaFile: mediaFile)
                case .text(_, let text):
                    ShareExtensionPayload.text(roomID: roomID, text: text)
                }
                
                navigationSplitCoordinator.setSheetCoordinator(nil)
                
                stateMachine.processEvent(.selectRoom(roomID: roomID,
                                                      via: [],
                                                      entryPoint: .share(sharePayload)),
                                          userInfo: .init(animated: animated))
            }
        }
        .store(in: &cancellables)
        
        stackCoordinator.setRootCoordinator(coordinator)
        
        navigationSplitCoordinator.setSheetCoordinator(stackCoordinator, animated: animated) { [weak self] in
            self?.stateMachine.processEvent(.dismissedShareExtensionRoomList)
        }
    }
    
    private func dismissRoomSelectionScreen() {
        navigationSplitCoordinator.setSheetCoordinator(nil)
    }
    
    // MARK: Toasts and loading indicators
    
    private static let loadingIndicatorIdentifier = "\(UserSessionFlowCoordinator.self)-Loading"
    private static let failureIndicatorIdentifier = "\(UserSessionFlowCoordinator.self)-Failure"
    
    private func showLoadingIndicator(delay: Duration? = nil) {
        ServiceLocator.shared.userIndicatorController.submitIndicator(UserIndicator(id: Self.loadingIndicatorIdentifier,
                                                                                    type: .modal,
                                                                                    title: L10n.commonLoading,
                                                                                    persistent: true),
                                                                      delay: delay)
    }
    
    private func hideLoadingIndicator() {
        ServiceLocator.shared.userIndicatorController.retractIndicatorWithId(Self.loadingIndicatorIdentifier)
    }
    
    private func showFailureIndicator() {
        ServiceLocator.shared.userIndicatorController.submitIndicator(UserIndicator(id: Self.failureIndicatorIdentifier,
                                                                                    type: .toast,
                                                                                    title: L10n.errorUnknown,
                                                                                    iconName: "xmark"))
=======
        navigationTabCoordinator.setSheetCoordinator(coordinator, animated: true)
>>>>>>> release/25.09.4
    }
}
