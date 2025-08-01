// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable all
@preconcurrency import MatrixRustSDK

import Foundation

open class ClientSDKMock: MatrixRustSDK.Client, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - abortOidcAuth

    var abortOidcAuthAuthorizationDataUnderlyingCallsCount = 0
    open var abortOidcAuthAuthorizationDataCallsCount: Int {
        get {
            if Thread.isMainThread {
                return abortOidcAuthAuthorizationDataUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = abortOidcAuthAuthorizationDataUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                abortOidcAuthAuthorizationDataUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    abortOidcAuthAuthorizationDataUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var abortOidcAuthAuthorizationDataCalled: Bool {
        return abortOidcAuthAuthorizationDataCallsCount > 0
    }
    open var abortOidcAuthAuthorizationDataReceivedAuthorizationData: OAuthAuthorizationData?
    open var abortOidcAuthAuthorizationDataReceivedInvocations: [OAuthAuthorizationData] = []
    open var abortOidcAuthAuthorizationDataClosure: ((OAuthAuthorizationData) async -> Void)?

    open override func abortOidcAuth(authorizationData: OAuthAuthorizationData) async {
        abortOidcAuthAuthorizationDataCallsCount += 1
        abortOidcAuthAuthorizationDataReceivedAuthorizationData = authorizationData
        DispatchQueue.main.async {
            self.abortOidcAuthAuthorizationDataReceivedInvocations.append(authorizationData)
        }
        await abortOidcAuthAuthorizationDataClosure?(authorizationData)
    }

    //MARK: - accountData

    open var accountDataEventTypeThrowableError: Error?
    var accountDataEventTypeUnderlyingCallsCount = 0
    open var accountDataEventTypeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return accountDataEventTypeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = accountDataEventTypeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                accountDataEventTypeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    accountDataEventTypeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var accountDataEventTypeCalled: Bool {
        return accountDataEventTypeCallsCount > 0
    }
    open var accountDataEventTypeReceivedEventType: String?
    open var accountDataEventTypeReceivedInvocations: [String] = []

    var accountDataEventTypeUnderlyingReturnValue: String?
    open var accountDataEventTypeReturnValue: String? {
        get {
            if Thread.isMainThread {
                return accountDataEventTypeUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = accountDataEventTypeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                accountDataEventTypeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    accountDataEventTypeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var accountDataEventTypeClosure: ((String) async throws -> String?)?

    open override func accountData(eventType: String) async throws -> String? {
        if let error = accountDataEventTypeThrowableError {
            throw error
        }
        accountDataEventTypeCallsCount += 1
        accountDataEventTypeReceivedEventType = eventType
        DispatchQueue.main.async {
            self.accountDataEventTypeReceivedInvocations.append(eventType)
        }
        if let accountDataEventTypeClosure = accountDataEventTypeClosure {
            return try await accountDataEventTypeClosure(eventType)
        } else {
            return accountDataEventTypeReturnValue
        }
    }

    //MARK: - accountUrl

    open var accountUrlActionThrowableError: Error?
    var accountUrlActionUnderlyingCallsCount = 0
    open var accountUrlActionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return accountUrlActionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = accountUrlActionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                accountUrlActionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    accountUrlActionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var accountUrlActionCalled: Bool {
        return accountUrlActionCallsCount > 0
    }
    open var accountUrlActionReceivedAction: AccountManagementAction?
    open var accountUrlActionReceivedInvocations: [AccountManagementAction?] = []

    var accountUrlActionUnderlyingReturnValue: String?
    open var accountUrlActionReturnValue: String? {
        get {
            if Thread.isMainThread {
                return accountUrlActionUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = accountUrlActionUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                accountUrlActionUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    accountUrlActionUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var accountUrlActionClosure: ((AccountManagementAction?) async throws -> String?)?

    open override func accountUrl(action: AccountManagementAction?) async throws -> String? {
        if let error = accountUrlActionThrowableError {
            throw error
        }
        accountUrlActionCallsCount += 1
        accountUrlActionReceivedAction = action
        DispatchQueue.main.async {
            self.accountUrlActionReceivedInvocations.append(action)
        }
        if let accountUrlActionClosure = accountUrlActionClosure {
            return try await accountUrlActionClosure(action)
        } else {
            return accountUrlActionReturnValue
        }
    }

    //MARK: - availableSlidingSyncVersions

    var availableSlidingSyncVersionsUnderlyingCallsCount = 0
    open var availableSlidingSyncVersionsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return availableSlidingSyncVersionsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = availableSlidingSyncVersionsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                availableSlidingSyncVersionsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    availableSlidingSyncVersionsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var availableSlidingSyncVersionsCalled: Bool {
        return availableSlidingSyncVersionsCallsCount > 0
    }

    var availableSlidingSyncVersionsUnderlyingReturnValue: [SlidingSyncVersion]!
    open var availableSlidingSyncVersionsReturnValue: [SlidingSyncVersion]! {
        get {
            if Thread.isMainThread {
                return availableSlidingSyncVersionsUnderlyingReturnValue
            } else {
                var returnValue: [SlidingSyncVersion]? = nil
                DispatchQueue.main.sync {
                    returnValue = availableSlidingSyncVersionsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                availableSlidingSyncVersionsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    availableSlidingSyncVersionsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var availableSlidingSyncVersionsClosure: (() async -> [SlidingSyncVersion])?

    open override func availableSlidingSyncVersions() async -> [SlidingSyncVersion] {
        availableSlidingSyncVersionsCallsCount += 1
        if let availableSlidingSyncVersionsClosure = availableSlidingSyncVersionsClosure {
            return await availableSlidingSyncVersionsClosure()
        } else {
            return availableSlidingSyncVersionsReturnValue
        }
    }

    //MARK: - avatarUrl

    open var avatarUrlThrowableError: Error?
    var avatarUrlUnderlyingCallsCount = 0
    open var avatarUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return avatarUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = avatarUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                avatarUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    avatarUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var avatarUrlCalled: Bool {
        return avatarUrlCallsCount > 0
    }

    var avatarUrlUnderlyingReturnValue: String?
    open var avatarUrlReturnValue: String? {
        get {
            if Thread.isMainThread {
                return avatarUrlUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = avatarUrlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                avatarUrlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    avatarUrlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var avatarUrlClosure: (() async throws -> String?)?

    open override func avatarUrl() async throws -> String? {
        if let error = avatarUrlThrowableError {
            throw error
        }
        avatarUrlCallsCount += 1
        if let avatarUrlClosure = avatarUrlClosure {
            return try await avatarUrlClosure()
        } else {
            return avatarUrlReturnValue
        }
    }

    //MARK: - awaitRoomRemoteEcho

    open var awaitRoomRemoteEchoRoomIdThrowableError: Error?
    var awaitRoomRemoteEchoRoomIdUnderlyingCallsCount = 0
    open var awaitRoomRemoteEchoRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return awaitRoomRemoteEchoRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = awaitRoomRemoteEchoRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                awaitRoomRemoteEchoRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    awaitRoomRemoteEchoRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var awaitRoomRemoteEchoRoomIdCalled: Bool {
        return awaitRoomRemoteEchoRoomIdCallsCount > 0
    }
    open var awaitRoomRemoteEchoRoomIdReceivedRoomId: String?
    open var awaitRoomRemoteEchoRoomIdReceivedInvocations: [String] = []

    var awaitRoomRemoteEchoRoomIdUnderlyingReturnValue: Room!
    open var awaitRoomRemoteEchoRoomIdReturnValue: Room! {
        get {
            if Thread.isMainThread {
                return awaitRoomRemoteEchoRoomIdUnderlyingReturnValue
            } else {
                var returnValue: Room? = nil
                DispatchQueue.main.sync {
                    returnValue = awaitRoomRemoteEchoRoomIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                awaitRoomRemoteEchoRoomIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    awaitRoomRemoteEchoRoomIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var awaitRoomRemoteEchoRoomIdClosure: ((String) async throws -> Room)?

    open override func awaitRoomRemoteEcho(roomId: String) async throws -> Room {
        if let error = awaitRoomRemoteEchoRoomIdThrowableError {
            throw error
        }
        awaitRoomRemoteEchoRoomIdCallsCount += 1
        awaitRoomRemoteEchoRoomIdReceivedRoomId = roomId
        DispatchQueue.main.async {
            self.awaitRoomRemoteEchoRoomIdReceivedInvocations.append(roomId)
        }
        if let awaitRoomRemoteEchoRoomIdClosure = awaitRoomRemoteEchoRoomIdClosure {
            return try await awaitRoomRemoteEchoRoomIdClosure(roomId)
        } else {
            return awaitRoomRemoteEchoRoomIdReturnValue
        }
    }

    //MARK: - cachedAvatarUrl

    open var cachedAvatarUrlThrowableError: Error?
    var cachedAvatarUrlUnderlyingCallsCount = 0
    open var cachedAvatarUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cachedAvatarUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cachedAvatarUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cachedAvatarUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cachedAvatarUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var cachedAvatarUrlCalled: Bool {
        return cachedAvatarUrlCallsCount > 0
    }

    var cachedAvatarUrlUnderlyingReturnValue: String?
    open var cachedAvatarUrlReturnValue: String? {
        get {
            if Thread.isMainThread {
                return cachedAvatarUrlUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = cachedAvatarUrlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cachedAvatarUrlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    cachedAvatarUrlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var cachedAvatarUrlClosure: (() async throws -> String?)?

    open override func cachedAvatarUrl() async throws -> String? {
        if let error = cachedAvatarUrlThrowableError {
            throw error
        }
        cachedAvatarUrlCallsCount += 1
        if let cachedAvatarUrlClosure = cachedAvatarUrlClosure {
            return try await cachedAvatarUrlClosure()
        } else {
            return cachedAvatarUrlReturnValue
        }
    }

    //MARK: - canDeactivateAccount

    var canDeactivateAccountUnderlyingCallsCount = 0
    open var canDeactivateAccountCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canDeactivateAccountUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canDeactivateAccountUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canDeactivateAccountUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canDeactivateAccountUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canDeactivateAccountCalled: Bool {
        return canDeactivateAccountCallsCount > 0
    }

    var canDeactivateAccountUnderlyingReturnValue: Bool!
    open var canDeactivateAccountReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canDeactivateAccountUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canDeactivateAccountUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canDeactivateAccountUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canDeactivateAccountUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canDeactivateAccountClosure: (() -> Bool)?

    open override func canDeactivateAccount() -> Bool {
        canDeactivateAccountCallsCount += 1
        if let canDeactivateAccountClosure = canDeactivateAccountClosure {
            return canDeactivateAccountClosure()
        } else {
            return canDeactivateAccountReturnValue
        }
    }

    //MARK: - clearCaches

    open var clearCachesSyncServiceThrowableError: Error?
    var clearCachesSyncServiceUnderlyingCallsCount = 0
    open var clearCachesSyncServiceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return clearCachesSyncServiceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = clearCachesSyncServiceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                clearCachesSyncServiceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    clearCachesSyncServiceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var clearCachesSyncServiceCalled: Bool {
        return clearCachesSyncServiceCallsCount > 0
    }
    open var clearCachesSyncServiceReceivedSyncService: SyncService?
    open var clearCachesSyncServiceReceivedInvocations: [SyncService?] = []
    open var clearCachesSyncServiceClosure: ((SyncService?) async throws -> Void)?

    open override func clearCaches(syncService: SyncService?) async throws {
        if let error = clearCachesSyncServiceThrowableError {
            throw error
        }
        clearCachesSyncServiceCallsCount += 1
        clearCachesSyncServiceReceivedSyncService = syncService
        DispatchQueue.main.async {
            self.clearCachesSyncServiceReceivedInvocations.append(syncService)
        }
        try await clearCachesSyncServiceClosure?(syncService)
    }

    //MARK: - createRoom

    open var createRoomRequestThrowableError: Error?
    var createRoomRequestUnderlyingCallsCount = 0
    open var createRoomRequestCallsCount: Int {
        get {
            if Thread.isMainThread {
                return createRoomRequestUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = createRoomRequestUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createRoomRequestUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    createRoomRequestUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var createRoomRequestCalled: Bool {
        return createRoomRequestCallsCount > 0
    }
    open var createRoomRequestReceivedRequest: CreateRoomParameters?
    open var createRoomRequestReceivedInvocations: [CreateRoomParameters] = []

    var createRoomRequestUnderlyingReturnValue: String!
    open var createRoomRequestReturnValue: String! {
        get {
            if Thread.isMainThread {
                return createRoomRequestUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = createRoomRequestUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createRoomRequestUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    createRoomRequestUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var createRoomRequestClosure: ((CreateRoomParameters) async throws -> String)?

    open override func createRoom(request: CreateRoomParameters, isFederated: Bool) async throws -> String {
        if let error = createRoomRequestThrowableError {
            throw error
        }
        createRoomRequestCallsCount += 1
        createRoomRequestReceivedRequest = request
        DispatchQueue.main.async {
            self.createRoomRequestReceivedInvocations.append(request)
        }
        if let createRoomRequestClosure = createRoomRequestClosure {
            return try await createRoomRequestClosure(request)
        } else {
            return createRoomRequestReturnValue
        }
    }

    //MARK: - customLoginWithJwt

    open var customLoginWithJwtJwtInitialDeviceNameDeviceIdThrowableError: Error?
    var customLoginWithJwtJwtInitialDeviceNameDeviceIdUnderlyingCallsCount = 0
    open var customLoginWithJwtJwtInitialDeviceNameDeviceIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return customLoginWithJwtJwtInitialDeviceNameDeviceIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = customLoginWithJwtJwtInitialDeviceNameDeviceIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                customLoginWithJwtJwtInitialDeviceNameDeviceIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    customLoginWithJwtJwtInitialDeviceNameDeviceIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var customLoginWithJwtJwtInitialDeviceNameDeviceIdCalled: Bool {
        return customLoginWithJwtJwtInitialDeviceNameDeviceIdCallsCount > 0
    }
    open var customLoginWithJwtJwtInitialDeviceNameDeviceIdReceivedArguments: (jwt: String, initialDeviceName: String?, deviceId: String?)?
    open var customLoginWithJwtJwtInitialDeviceNameDeviceIdReceivedInvocations: [(jwt: String, initialDeviceName: String?, deviceId: String?)] = []
    open var customLoginWithJwtJwtInitialDeviceNameDeviceIdClosure: ((String, String?, String?) async throws -> Void)?

    open override func customLoginWithJwt(jwt: String, initialDeviceName: String?, deviceId: String?) async throws {
        if let error = customLoginWithJwtJwtInitialDeviceNameDeviceIdThrowableError {
            throw error
        }
        customLoginWithJwtJwtInitialDeviceNameDeviceIdCallsCount += 1
        customLoginWithJwtJwtInitialDeviceNameDeviceIdReceivedArguments = (jwt: jwt, initialDeviceName: initialDeviceName, deviceId: deviceId)
        DispatchQueue.main.async {
            self.customLoginWithJwtJwtInitialDeviceNameDeviceIdReceivedInvocations.append((jwt: jwt, initialDeviceName: initialDeviceName, deviceId: deviceId))
        }
        try await customLoginWithJwtJwtInitialDeviceNameDeviceIdClosure?(jwt, initialDeviceName, deviceId)
    }

    //MARK: - deactivateAccount

    open var deactivateAccountAuthDataEraseDataThrowableError: Error?
    var deactivateAccountAuthDataEraseDataUnderlyingCallsCount = 0
    open var deactivateAccountAuthDataEraseDataCallsCount: Int {
        get {
            if Thread.isMainThread {
                return deactivateAccountAuthDataEraseDataUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = deactivateAccountAuthDataEraseDataUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                deactivateAccountAuthDataEraseDataUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    deactivateAccountAuthDataEraseDataUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var deactivateAccountAuthDataEraseDataCalled: Bool {
        return deactivateAccountAuthDataEraseDataCallsCount > 0
    }
    open var deactivateAccountAuthDataEraseDataReceivedArguments: (authData: AuthData?, eraseData: Bool)?
    open var deactivateAccountAuthDataEraseDataReceivedInvocations: [(authData: AuthData?, eraseData: Bool)] = []
    open var deactivateAccountAuthDataEraseDataClosure: ((AuthData?, Bool) async throws -> Void)?

    open override func deactivateAccount(authData: AuthData?, eraseData: Bool) async throws {
        if let error = deactivateAccountAuthDataEraseDataThrowableError {
            throw error
        }
        deactivateAccountAuthDataEraseDataCallsCount += 1
        deactivateAccountAuthDataEraseDataReceivedArguments = (authData: authData, eraseData: eraseData)
        DispatchQueue.main.async {
            self.deactivateAccountAuthDataEraseDataReceivedInvocations.append((authData: authData, eraseData: eraseData))
        }
        try await deactivateAccountAuthDataEraseDataClosure?(authData, eraseData)
    }

    //MARK: - deletePusher

    open var deletePusherIdentifiersThrowableError: Error?
    var deletePusherIdentifiersUnderlyingCallsCount = 0
    open var deletePusherIdentifiersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return deletePusherIdentifiersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = deletePusherIdentifiersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                deletePusherIdentifiersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    deletePusherIdentifiersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var deletePusherIdentifiersCalled: Bool {
        return deletePusherIdentifiersCallsCount > 0
    }
    open var deletePusherIdentifiersReceivedIdentifiers: PusherIdentifiers?
    open var deletePusherIdentifiersReceivedInvocations: [PusherIdentifiers] = []
    open var deletePusherIdentifiersClosure: ((PusherIdentifiers) async throws -> Void)?

    open override func deletePusher(identifiers: PusherIdentifiers) async throws {
        if let error = deletePusherIdentifiersThrowableError {
            throw error
        }
        deletePusherIdentifiersCallsCount += 1
        deletePusherIdentifiersReceivedIdentifiers = identifiers
        DispatchQueue.main.async {
            self.deletePusherIdentifiersReceivedInvocations.append(identifiers)
        }
        try await deletePusherIdentifiersClosure?(identifiers)
    }

    //MARK: - deviceId

    open var deviceIdThrowableError: Error?
    var deviceIdUnderlyingCallsCount = 0
    open var deviceIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return deviceIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = deviceIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                deviceIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    deviceIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var deviceIdCalled: Bool {
        return deviceIdCallsCount > 0
    }

    var deviceIdUnderlyingReturnValue: String!
    open var deviceIdReturnValue: String! {
        get {
            if Thread.isMainThread {
                return deviceIdUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = deviceIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                deviceIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    deviceIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var deviceIdClosure: (() throws -> String)?

    open override func deviceId() throws -> String {
        if let error = deviceIdThrowableError {
            throw error
        }
        deviceIdCallsCount += 1
        if let deviceIdClosure = deviceIdClosure {
            return try deviceIdClosure()
        } else {
            return deviceIdReturnValue
        }
    }

    //MARK: - displayName

    open var displayNameThrowableError: Error?
    var displayNameUnderlyingCallsCount = 0
    open var displayNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return displayNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = displayNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                displayNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    displayNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var displayNameCalled: Bool {
        return displayNameCallsCount > 0
    }

    var displayNameUnderlyingReturnValue: String!
    open var displayNameReturnValue: String! {
        get {
            if Thread.isMainThread {
                return displayNameUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = displayNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                displayNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    displayNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var displayNameClosure: (() async throws -> String)?

    open override func displayName() async throws -> String {
        if let error = displayNameThrowableError {
            throw error
        }
        displayNameCallsCount += 1
        if let displayNameClosure = displayNameClosure {
            return try await displayNameClosure()
        } else {
            return displayNameReturnValue
        }
    }

    //MARK: - enableAllSendQueues

    var enableAllSendQueuesEnableUnderlyingCallsCount = 0
    open var enableAllSendQueuesEnableCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enableAllSendQueuesEnableUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enableAllSendQueuesEnableUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableAllSendQueuesEnableUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enableAllSendQueuesEnableUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var enableAllSendQueuesEnableCalled: Bool {
        return enableAllSendQueuesEnableCallsCount > 0
    }
    open var enableAllSendQueuesEnableReceivedEnable: Bool?
    open var enableAllSendQueuesEnableReceivedInvocations: [Bool] = []
    open var enableAllSendQueuesEnableClosure: ((Bool) async -> Void)?

    open override func enableAllSendQueues(enable: Bool) async {
        enableAllSendQueuesEnableCallsCount += 1
        enableAllSendQueuesEnableReceivedEnable = enable
        DispatchQueue.main.async {
            self.enableAllSendQueuesEnableReceivedInvocations.append(enable)
        }
        await enableAllSendQueuesEnableClosure?(enable)
    }

    //MARK: - encryption

    var encryptionUnderlyingCallsCount = 0
    open var encryptionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return encryptionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = encryptionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                encryptionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    encryptionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var encryptionCalled: Bool {
        return encryptionCallsCount > 0
    }

    var encryptionUnderlyingReturnValue: Encryption!
    open var encryptionReturnValue: Encryption! {
        get {
            if Thread.isMainThread {
                return encryptionUnderlyingReturnValue
            } else {
                var returnValue: Encryption? = nil
                DispatchQueue.main.sync {
                    returnValue = encryptionUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                encryptionUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    encryptionUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var encryptionClosure: (() -> Encryption)?

    open override func encryption() -> Encryption {
        encryptionCallsCount += 1
        if let encryptionClosure = encryptionClosure {
            return encryptionClosure()
        } else {
            return encryptionReturnValue
        }
    }

    //MARK: - fetchMediaPreviewConfig

    open var fetchMediaPreviewConfigThrowableError: Error?
    var fetchMediaPreviewConfigUnderlyingCallsCount = 0
    open var fetchMediaPreviewConfigCallsCount: Int {
        get {
            if Thread.isMainThread {
                return fetchMediaPreviewConfigUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = fetchMediaPreviewConfigUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                fetchMediaPreviewConfigUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    fetchMediaPreviewConfigUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var fetchMediaPreviewConfigCalled: Bool {
        return fetchMediaPreviewConfigCallsCount > 0
    }

    var fetchMediaPreviewConfigUnderlyingReturnValue: MediaPreviewConfig?
    open var fetchMediaPreviewConfigReturnValue: MediaPreviewConfig? {
        get {
            if Thread.isMainThread {
                return fetchMediaPreviewConfigUnderlyingReturnValue
            } else {
                var returnValue: MediaPreviewConfig?? = nil
                DispatchQueue.main.sync {
                    returnValue = fetchMediaPreviewConfigUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                fetchMediaPreviewConfigUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    fetchMediaPreviewConfigUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var fetchMediaPreviewConfigClosure: (() async throws -> MediaPreviewConfig?)?

    open override func fetchMediaPreviewConfig() async throws -> MediaPreviewConfig? {
        if let error = fetchMediaPreviewConfigThrowableError {
            throw error
        }
        fetchMediaPreviewConfigCallsCount += 1
        if let fetchMediaPreviewConfigClosure = fetchMediaPreviewConfigClosure {
            return try await fetchMediaPreviewConfigClosure()
        } else {
            return fetchMediaPreviewConfigReturnValue
        }
    }

    //MARK: - getDmRoom

    open var getDmRoomUserIdThrowableError: Error?
    var getDmRoomUserIdUnderlyingCallsCount = 0
    open var getDmRoomUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getDmRoomUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getDmRoomUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getDmRoomUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getDmRoomUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getDmRoomUserIdCalled: Bool {
        return getDmRoomUserIdCallsCount > 0
    }
    open var getDmRoomUserIdReceivedUserId: String?
    open var getDmRoomUserIdReceivedInvocations: [String] = []

    var getDmRoomUserIdUnderlyingReturnValue: Room?
    open var getDmRoomUserIdReturnValue: Room? {
        get {
            if Thread.isMainThread {
                return getDmRoomUserIdUnderlyingReturnValue
            } else {
                var returnValue: Room?? = nil
                DispatchQueue.main.sync {
                    returnValue = getDmRoomUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getDmRoomUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getDmRoomUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getDmRoomUserIdClosure: ((String) throws -> Room?)?

    open override func getDmRoom(userId: String) throws -> Room? {
        if let error = getDmRoomUserIdThrowableError {
            throw error
        }
        getDmRoomUserIdCallsCount += 1
        getDmRoomUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.getDmRoomUserIdReceivedInvocations.append(userId)
        }
        if let getDmRoomUserIdClosure = getDmRoomUserIdClosure {
            return try getDmRoomUserIdClosure(userId)
        } else {
            return getDmRoomUserIdReturnValue
        }
    }

    //MARK: - getInviteAvatarsDisplayPolicy

    open var getInviteAvatarsDisplayPolicyThrowableError: Error?
    var getInviteAvatarsDisplayPolicyUnderlyingCallsCount = 0
    open var getInviteAvatarsDisplayPolicyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getInviteAvatarsDisplayPolicyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getInviteAvatarsDisplayPolicyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getInviteAvatarsDisplayPolicyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getInviteAvatarsDisplayPolicyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getInviteAvatarsDisplayPolicyCalled: Bool {
        return getInviteAvatarsDisplayPolicyCallsCount > 0
    }

    var getInviteAvatarsDisplayPolicyUnderlyingReturnValue: InviteAvatars?
    open var getInviteAvatarsDisplayPolicyReturnValue: InviteAvatars? {
        get {
            if Thread.isMainThread {
                return getInviteAvatarsDisplayPolicyUnderlyingReturnValue
            } else {
                var returnValue: InviteAvatars?? = nil
                DispatchQueue.main.sync {
                    returnValue = getInviteAvatarsDisplayPolicyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getInviteAvatarsDisplayPolicyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getInviteAvatarsDisplayPolicyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getInviteAvatarsDisplayPolicyClosure: (() async throws -> InviteAvatars?)?

    open override func getInviteAvatarsDisplayPolicy() async throws -> InviteAvatars? {
        if let error = getInviteAvatarsDisplayPolicyThrowableError {
            throw error
        }
        getInviteAvatarsDisplayPolicyCallsCount += 1
        if let getInviteAvatarsDisplayPolicyClosure = getInviteAvatarsDisplayPolicyClosure {
            return try await getInviteAvatarsDisplayPolicyClosure()
        } else {
            return getInviteAvatarsDisplayPolicyReturnValue
        }
    }

    //MARK: - getMaxMediaUploadSize

    open var getMaxMediaUploadSizeThrowableError: Error?
    var getMaxMediaUploadSizeUnderlyingCallsCount = 0
    open var getMaxMediaUploadSizeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getMaxMediaUploadSizeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getMaxMediaUploadSizeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMaxMediaUploadSizeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getMaxMediaUploadSizeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getMaxMediaUploadSizeCalled: Bool {
        return getMaxMediaUploadSizeCallsCount > 0
    }

    var getMaxMediaUploadSizeUnderlyingReturnValue: UInt64!
    open var getMaxMediaUploadSizeReturnValue: UInt64! {
        get {
            if Thread.isMainThread {
                return getMaxMediaUploadSizeUnderlyingReturnValue
            } else {
                var returnValue: UInt64? = nil
                DispatchQueue.main.sync {
                    returnValue = getMaxMediaUploadSizeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMaxMediaUploadSizeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getMaxMediaUploadSizeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getMaxMediaUploadSizeClosure: (() async throws -> UInt64)?

    open override func getMaxMediaUploadSize() async throws -> UInt64 {
        if let error = getMaxMediaUploadSizeThrowableError {
            throw error
        }
        getMaxMediaUploadSizeCallsCount += 1
        if let getMaxMediaUploadSizeClosure = getMaxMediaUploadSizeClosure {
            return try await getMaxMediaUploadSizeClosure()
        } else {
            return getMaxMediaUploadSizeReturnValue
        }
    }

    //MARK: - getMediaContent

    open var getMediaContentMediaSourceThrowableError: Error?
    var getMediaContentMediaSourceUnderlyingCallsCount = 0
    open var getMediaContentMediaSourceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getMediaContentMediaSourceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getMediaContentMediaSourceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMediaContentMediaSourceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getMediaContentMediaSourceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getMediaContentMediaSourceCalled: Bool {
        return getMediaContentMediaSourceCallsCount > 0
    }
    open var getMediaContentMediaSourceReceivedMediaSource: MediaSource?
    open var getMediaContentMediaSourceReceivedInvocations: [MediaSource] = []

    var getMediaContentMediaSourceUnderlyingReturnValue: Data!
    open var getMediaContentMediaSourceReturnValue: Data! {
        get {
            if Thread.isMainThread {
                return getMediaContentMediaSourceUnderlyingReturnValue
            } else {
                var returnValue: Data? = nil
                DispatchQueue.main.sync {
                    returnValue = getMediaContentMediaSourceUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMediaContentMediaSourceUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getMediaContentMediaSourceUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getMediaContentMediaSourceClosure: ((MediaSource) async throws -> Data)?

    open override func getMediaContent(mediaSource: MediaSource) async throws -> Data {
        if let error = getMediaContentMediaSourceThrowableError {
            throw error
        }
        getMediaContentMediaSourceCallsCount += 1
        getMediaContentMediaSourceReceivedMediaSource = mediaSource
        DispatchQueue.main.async {
            self.getMediaContentMediaSourceReceivedInvocations.append(mediaSource)
        }
        if let getMediaContentMediaSourceClosure = getMediaContentMediaSourceClosure {
            return try await getMediaContentMediaSourceClosure(mediaSource)
        } else {
            return getMediaContentMediaSourceReturnValue
        }
    }

    //MARK: - getMediaFile

    open var getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirThrowableError: Error?
    var getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingCallsCount = 0
    open var getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirCalled: Bool {
        return getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirCallsCount > 0
    }
    open var getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirReceivedArguments: (mediaSource: MediaSource, filename: String?, mimeType: String, useCache: Bool, tempDir: String?)?
    open var getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirReceivedInvocations: [(mediaSource: MediaSource, filename: String?, mimeType: String, useCache: Bool, tempDir: String?)] = []

    var getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingReturnValue: MediaFileHandle!
    open var getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirReturnValue: MediaFileHandle! {
        get {
            if Thread.isMainThread {
                return getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingReturnValue
            } else {
                var returnValue: MediaFileHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirClosure: ((MediaSource, String?, String, Bool, String?) async throws -> MediaFileHandle)?

    open override func getMediaFile(mediaSource: MediaSource, filename: String?, mimeType: String, useCache: Bool, tempDir: String?) async throws -> MediaFileHandle {
        if let error = getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirThrowableError {
            throw error
        }
        getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirCallsCount += 1
        getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirReceivedArguments = (mediaSource: mediaSource, filename: filename, mimeType: mimeType, useCache: useCache, tempDir: tempDir)
        DispatchQueue.main.async {
            self.getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirReceivedInvocations.append((mediaSource: mediaSource, filename: filename, mimeType: mimeType, useCache: useCache, tempDir: tempDir))
        }
        if let getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirClosure = getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirClosure {
            return try await getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirClosure(mediaSource, filename, mimeType, useCache, tempDir)
        } else {
            return getMediaFileMediaSourceFilenameMimeTypeUseCacheTempDirReturnValue
        }
    }

    //MARK: - getMediaPreviewDisplayPolicy

    open var getMediaPreviewDisplayPolicyThrowableError: Error?
    var getMediaPreviewDisplayPolicyUnderlyingCallsCount = 0
    open var getMediaPreviewDisplayPolicyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getMediaPreviewDisplayPolicyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getMediaPreviewDisplayPolicyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMediaPreviewDisplayPolicyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getMediaPreviewDisplayPolicyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getMediaPreviewDisplayPolicyCalled: Bool {
        return getMediaPreviewDisplayPolicyCallsCount > 0
    }

    var getMediaPreviewDisplayPolicyUnderlyingReturnValue: MediaPreviews?
    open var getMediaPreviewDisplayPolicyReturnValue: MediaPreviews? {
        get {
            if Thread.isMainThread {
                return getMediaPreviewDisplayPolicyUnderlyingReturnValue
            } else {
                var returnValue: MediaPreviews?? = nil
                DispatchQueue.main.sync {
                    returnValue = getMediaPreviewDisplayPolicyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMediaPreviewDisplayPolicyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getMediaPreviewDisplayPolicyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getMediaPreviewDisplayPolicyClosure: (() async throws -> MediaPreviews?)?

    open override func getMediaPreviewDisplayPolicy() async throws -> MediaPreviews? {
        if let error = getMediaPreviewDisplayPolicyThrowableError {
            throw error
        }
        getMediaPreviewDisplayPolicyCallsCount += 1
        if let getMediaPreviewDisplayPolicyClosure = getMediaPreviewDisplayPolicyClosure {
            return try await getMediaPreviewDisplayPolicyClosure()
        } else {
            return getMediaPreviewDisplayPolicyReturnValue
        }
    }

    //MARK: - getMediaThumbnail

    open var getMediaThumbnailMediaSourceWidthHeightThrowableError: Error?
    var getMediaThumbnailMediaSourceWidthHeightUnderlyingCallsCount = 0
    open var getMediaThumbnailMediaSourceWidthHeightCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getMediaThumbnailMediaSourceWidthHeightUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getMediaThumbnailMediaSourceWidthHeightUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMediaThumbnailMediaSourceWidthHeightUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getMediaThumbnailMediaSourceWidthHeightUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getMediaThumbnailMediaSourceWidthHeightCalled: Bool {
        return getMediaThumbnailMediaSourceWidthHeightCallsCount > 0
    }
    open var getMediaThumbnailMediaSourceWidthHeightReceivedArguments: (mediaSource: MediaSource, width: UInt64, height: UInt64)?
    open var getMediaThumbnailMediaSourceWidthHeightReceivedInvocations: [(mediaSource: MediaSource, width: UInt64, height: UInt64)] = []

    var getMediaThumbnailMediaSourceWidthHeightUnderlyingReturnValue: Data!
    open var getMediaThumbnailMediaSourceWidthHeightReturnValue: Data! {
        get {
            if Thread.isMainThread {
                return getMediaThumbnailMediaSourceWidthHeightUnderlyingReturnValue
            } else {
                var returnValue: Data? = nil
                DispatchQueue.main.sync {
                    returnValue = getMediaThumbnailMediaSourceWidthHeightUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMediaThumbnailMediaSourceWidthHeightUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getMediaThumbnailMediaSourceWidthHeightUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getMediaThumbnailMediaSourceWidthHeightClosure: ((MediaSource, UInt64, UInt64) async throws -> Data)?

    open override func getMediaThumbnail(mediaSource: MediaSource, width: UInt64, height: UInt64) async throws -> Data {
        if let error = getMediaThumbnailMediaSourceWidthHeightThrowableError {
            throw error
        }
        getMediaThumbnailMediaSourceWidthHeightCallsCount += 1
        getMediaThumbnailMediaSourceWidthHeightReceivedArguments = (mediaSource: mediaSource, width: width, height: height)
        DispatchQueue.main.async {
            self.getMediaThumbnailMediaSourceWidthHeightReceivedInvocations.append((mediaSource: mediaSource, width: width, height: height))
        }
        if let getMediaThumbnailMediaSourceWidthHeightClosure = getMediaThumbnailMediaSourceWidthHeightClosure {
            return try await getMediaThumbnailMediaSourceWidthHeightClosure(mediaSource, width, height)
        } else {
            return getMediaThumbnailMediaSourceWidthHeightReturnValue
        }
    }

    //MARK: - getNotificationSettings

    var getNotificationSettingsUnderlyingCallsCount = 0
    open var getNotificationSettingsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getNotificationSettingsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getNotificationSettingsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getNotificationSettingsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getNotificationSettingsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getNotificationSettingsCalled: Bool {
        return getNotificationSettingsCallsCount > 0
    }

    var getNotificationSettingsUnderlyingReturnValue: NotificationSettings!
    open var getNotificationSettingsReturnValue: NotificationSettings! {
        get {
            if Thread.isMainThread {
                return getNotificationSettingsUnderlyingReturnValue
            } else {
                var returnValue: NotificationSettings? = nil
                DispatchQueue.main.sync {
                    returnValue = getNotificationSettingsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getNotificationSettingsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getNotificationSettingsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getNotificationSettingsClosure: (() async -> NotificationSettings)?

    open override func getNotificationSettings() async -> NotificationSettings {
        getNotificationSettingsCallsCount += 1
        if let getNotificationSettingsClosure = getNotificationSettingsClosure {
            return await getNotificationSettingsClosure()
        } else {
            return getNotificationSettingsReturnValue
        }
    }

    //MARK: - getProfile

    open var getProfileUserIdThrowableError: Error?
    var getProfileUserIdUnderlyingCallsCount = 0
    open var getProfileUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getProfileUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getProfileUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getProfileUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getProfileUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getProfileUserIdCalled: Bool {
        return getProfileUserIdCallsCount > 0
    }
    open var getProfileUserIdReceivedUserId: String?
    open var getProfileUserIdReceivedInvocations: [String] = []

    var getProfileUserIdUnderlyingReturnValue: UserProfile!
    open var getProfileUserIdReturnValue: UserProfile! {
        get {
            if Thread.isMainThread {
                return getProfileUserIdUnderlyingReturnValue
            } else {
                var returnValue: UserProfile? = nil
                DispatchQueue.main.sync {
                    returnValue = getProfileUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getProfileUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getProfileUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getProfileUserIdClosure: ((String) async throws -> UserProfile)?

    open override func getProfile(userId: String) async throws -> UserProfile {
        if let error = getProfileUserIdThrowableError {
            throw error
        }
        getProfileUserIdCallsCount += 1
        getProfileUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.getProfileUserIdReceivedInvocations.append(userId)
        }
        if let getProfileUserIdClosure = getProfileUserIdClosure {
            return try await getProfileUserIdClosure(userId)
        } else {
            return getProfileUserIdReturnValue
        }
    }

    //MARK: - getRecentlyVisitedRooms

    open var getRecentlyVisitedRoomsThrowableError: Error?
    var getRecentlyVisitedRoomsUnderlyingCallsCount = 0
    open var getRecentlyVisitedRoomsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getRecentlyVisitedRoomsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getRecentlyVisitedRoomsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRecentlyVisitedRoomsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getRecentlyVisitedRoomsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getRecentlyVisitedRoomsCalled: Bool {
        return getRecentlyVisitedRoomsCallsCount > 0
    }

    var getRecentlyVisitedRoomsUnderlyingReturnValue: [String]!
    open var getRecentlyVisitedRoomsReturnValue: [String]! {
        get {
            if Thread.isMainThread {
                return getRecentlyVisitedRoomsUnderlyingReturnValue
            } else {
                var returnValue: [String]? = nil
                DispatchQueue.main.sync {
                    returnValue = getRecentlyVisitedRoomsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRecentlyVisitedRoomsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getRecentlyVisitedRoomsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getRecentlyVisitedRoomsClosure: (() async throws -> [String])?

    open override func getRecentlyVisitedRooms() async throws -> [String] {
        if let error = getRecentlyVisitedRoomsThrowableError {
            throw error
        }
        getRecentlyVisitedRoomsCallsCount += 1
        if let getRecentlyVisitedRoomsClosure = getRecentlyVisitedRoomsClosure {
            return try await getRecentlyVisitedRoomsClosure()
        } else {
            return getRecentlyVisitedRoomsReturnValue
        }
    }

    //MARK: - getRoom

    open var getRoomRoomIdThrowableError: Error?
    var getRoomRoomIdUnderlyingCallsCount = 0
    open var getRoomRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getRoomRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getRoomRoomIdCalled: Bool {
        return getRoomRoomIdCallsCount > 0
    }
    open var getRoomRoomIdReceivedRoomId: String?
    open var getRoomRoomIdReceivedInvocations: [String] = []

    var getRoomRoomIdUnderlyingReturnValue: Room?
    open var getRoomRoomIdReturnValue: Room? {
        get {
            if Thread.isMainThread {
                return getRoomRoomIdUnderlyingReturnValue
            } else {
                var returnValue: Room?? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomRoomIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomRoomIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomRoomIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getRoomRoomIdClosure: ((String) throws -> Room?)?

    open override func getRoom(roomId: String) throws -> Room? {
        if let error = getRoomRoomIdThrowableError {
            throw error
        }
        getRoomRoomIdCallsCount += 1
        getRoomRoomIdReceivedRoomId = roomId
        DispatchQueue.main.async {
            self.getRoomRoomIdReceivedInvocations.append(roomId)
        }
        if let getRoomRoomIdClosure = getRoomRoomIdClosure {
            return try getRoomRoomIdClosure(roomId)
        } else {
            return getRoomRoomIdReturnValue
        }
    }

    //MARK: - getRoomPreviewFromRoomAlias

    open var getRoomPreviewFromRoomAliasRoomAliasThrowableError: Error?
    var getRoomPreviewFromRoomAliasRoomAliasUnderlyingCallsCount = 0
    open var getRoomPreviewFromRoomAliasRoomAliasCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getRoomPreviewFromRoomAliasRoomAliasUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomPreviewFromRoomAliasRoomAliasUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomPreviewFromRoomAliasRoomAliasUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomPreviewFromRoomAliasRoomAliasUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getRoomPreviewFromRoomAliasRoomAliasCalled: Bool {
        return getRoomPreviewFromRoomAliasRoomAliasCallsCount > 0
    }
    open var getRoomPreviewFromRoomAliasRoomAliasReceivedRoomAlias: String?
    open var getRoomPreviewFromRoomAliasRoomAliasReceivedInvocations: [String] = []

    var getRoomPreviewFromRoomAliasRoomAliasUnderlyingReturnValue: RoomPreview!
    open var getRoomPreviewFromRoomAliasRoomAliasReturnValue: RoomPreview! {
        get {
            if Thread.isMainThread {
                return getRoomPreviewFromRoomAliasRoomAliasUnderlyingReturnValue
            } else {
                var returnValue: RoomPreview? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomPreviewFromRoomAliasRoomAliasUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomPreviewFromRoomAliasRoomAliasUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomPreviewFromRoomAliasRoomAliasUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getRoomPreviewFromRoomAliasRoomAliasClosure: ((String) async throws -> RoomPreview)?

    open override func getRoomPreviewFromRoomAlias(roomAlias: String) async throws -> RoomPreview {
        if let error = getRoomPreviewFromRoomAliasRoomAliasThrowableError {
            throw error
        }
        getRoomPreviewFromRoomAliasRoomAliasCallsCount += 1
        getRoomPreviewFromRoomAliasRoomAliasReceivedRoomAlias = roomAlias
        DispatchQueue.main.async {
            self.getRoomPreviewFromRoomAliasRoomAliasReceivedInvocations.append(roomAlias)
        }
        if let getRoomPreviewFromRoomAliasRoomAliasClosure = getRoomPreviewFromRoomAliasRoomAliasClosure {
            return try await getRoomPreviewFromRoomAliasRoomAliasClosure(roomAlias)
        } else {
            return getRoomPreviewFromRoomAliasRoomAliasReturnValue
        }
    }

    //MARK: - getRoomPreviewFromRoomId

    open var getRoomPreviewFromRoomIdRoomIdViaServersThrowableError: Error?
    var getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingCallsCount = 0
    open var getRoomPreviewFromRoomIdRoomIdViaServersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getRoomPreviewFromRoomIdRoomIdViaServersCalled: Bool {
        return getRoomPreviewFromRoomIdRoomIdViaServersCallsCount > 0
    }
    open var getRoomPreviewFromRoomIdRoomIdViaServersReceivedArguments: (roomId: String, viaServers: [String])?
    open var getRoomPreviewFromRoomIdRoomIdViaServersReceivedInvocations: [(roomId: String, viaServers: [String])] = []

    var getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingReturnValue: RoomPreview!
    open var getRoomPreviewFromRoomIdRoomIdViaServersReturnValue: RoomPreview! {
        get {
            if Thread.isMainThread {
                return getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingReturnValue
            } else {
                var returnValue: RoomPreview? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomPreviewFromRoomIdRoomIdViaServersUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getRoomPreviewFromRoomIdRoomIdViaServersClosure: ((String, [String]) async throws -> RoomPreview)?

    open override func getRoomPreviewFromRoomId(roomId: String, viaServers: [String]) async throws -> RoomPreview {
        if let error = getRoomPreviewFromRoomIdRoomIdViaServersThrowableError {
            throw error
        }
        getRoomPreviewFromRoomIdRoomIdViaServersCallsCount += 1
        getRoomPreviewFromRoomIdRoomIdViaServersReceivedArguments = (roomId: roomId, viaServers: viaServers)
        DispatchQueue.main.async {
            self.getRoomPreviewFromRoomIdRoomIdViaServersReceivedInvocations.append((roomId: roomId, viaServers: viaServers))
        }
        if let getRoomPreviewFromRoomIdRoomIdViaServersClosure = getRoomPreviewFromRoomIdRoomIdViaServersClosure {
            return try await getRoomPreviewFromRoomIdRoomIdViaServersClosure(roomId, viaServers)
        } else {
            return getRoomPreviewFromRoomIdRoomIdViaServersReturnValue
        }
    }

    //MARK: - getSessionVerificationController

    open var getSessionVerificationControllerThrowableError: Error?
    var getSessionVerificationControllerUnderlyingCallsCount = 0
    open var getSessionVerificationControllerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getSessionVerificationControllerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getSessionVerificationControllerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getSessionVerificationControllerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getSessionVerificationControllerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getSessionVerificationControllerCalled: Bool {
        return getSessionVerificationControllerCallsCount > 0
    }

    var getSessionVerificationControllerUnderlyingReturnValue: SessionVerificationController!
    open var getSessionVerificationControllerReturnValue: SessionVerificationController! {
        get {
            if Thread.isMainThread {
                return getSessionVerificationControllerUnderlyingReturnValue
            } else {
                var returnValue: SessionVerificationController? = nil
                DispatchQueue.main.sync {
                    returnValue = getSessionVerificationControllerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getSessionVerificationControllerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getSessionVerificationControllerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getSessionVerificationControllerClosure: (() async throws -> SessionVerificationController)?

    open override func getSessionVerificationController() async throws -> SessionVerificationController {
        if let error = getSessionVerificationControllerThrowableError {
            throw error
        }
        getSessionVerificationControllerCallsCount += 1
        if let getSessionVerificationControllerClosure = getSessionVerificationControllerClosure {
            return try await getSessionVerificationControllerClosure()
        } else {
            return getSessionVerificationControllerReturnValue
        }
    }

    //MARK: - getUrl

    open var getUrlUrlThrowableError: Error?
    var getUrlUrlUnderlyingCallsCount = 0
    open var getUrlUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getUrlUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getUrlUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getUrlUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getUrlUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getUrlUrlCalled: Bool {
        return getUrlUrlCallsCount > 0
    }
    open var getUrlUrlReceivedUrl: String?
    open var getUrlUrlReceivedInvocations: [String] = []

    var getUrlUrlUnderlyingReturnValue: String!
    open var getUrlUrlReturnValue: String! {
        get {
            if Thread.isMainThread {
                return getUrlUrlUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = getUrlUrlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getUrlUrlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getUrlUrlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getUrlUrlClosure: ((String) async throws -> String)?

    open override func getUrl(url: String) async throws -> String {
        if let error = getUrlUrlThrowableError {
            throw error
        }
        getUrlUrlCallsCount += 1
        getUrlUrlReceivedUrl = url
        DispatchQueue.main.async {
            self.getUrlUrlReceivedInvocations.append(url)
        }
        if let getUrlUrlClosure = getUrlUrlClosure {
            return try await getUrlUrlClosure(url)
        } else {
            return getUrlUrlReturnValue
        }
    }

    //MARK: - homeserver

    var homeserverUnderlyingCallsCount = 0
    open var homeserverCallsCount: Int {
        get {
            if Thread.isMainThread {
                return homeserverUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = homeserverUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                homeserverUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    homeserverUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var homeserverCalled: Bool {
        return homeserverCallsCount > 0
    }

    var homeserverUnderlyingReturnValue: String!
    open var homeserverReturnValue: String! {
        get {
            if Thread.isMainThread {
                return homeserverUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = homeserverUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                homeserverUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    homeserverUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var homeserverClosure: (() -> String)?

    open override func homeserver() -> String {
        homeserverCallsCount += 1
        if let homeserverClosure = homeserverClosure {
            return homeserverClosure()
        } else {
            return homeserverReturnValue
        }
    }

    //MARK: - homeserverLoginDetails

    var homeserverLoginDetailsUnderlyingCallsCount = 0
    open var homeserverLoginDetailsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return homeserverLoginDetailsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = homeserverLoginDetailsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                homeserverLoginDetailsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    homeserverLoginDetailsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var homeserverLoginDetailsCalled: Bool {
        return homeserverLoginDetailsCallsCount > 0
    }

    var homeserverLoginDetailsUnderlyingReturnValue: HomeserverLoginDetails!
    open var homeserverLoginDetailsReturnValue: HomeserverLoginDetails! {
        get {
            if Thread.isMainThread {
                return homeserverLoginDetailsUnderlyingReturnValue
            } else {
                var returnValue: HomeserverLoginDetails? = nil
                DispatchQueue.main.sync {
                    returnValue = homeserverLoginDetailsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                homeserverLoginDetailsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    homeserverLoginDetailsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var homeserverLoginDetailsClosure: (() async -> HomeserverLoginDetails)?

    open override func homeserverLoginDetails() async -> HomeserverLoginDetails {
        homeserverLoginDetailsCallsCount += 1
        if let homeserverLoginDetailsClosure = homeserverLoginDetailsClosure {
            return await homeserverLoginDetailsClosure()
        } else {
            return homeserverLoginDetailsReturnValue
        }
    }

    //MARK: - ignoreUser

    open var ignoreUserUserIdThrowableError: Error?
    var ignoreUserUserIdUnderlyingCallsCount = 0
    open var ignoreUserUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return ignoreUserUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = ignoreUserUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ignoreUserUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    ignoreUserUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var ignoreUserUserIdCalled: Bool {
        return ignoreUserUserIdCallsCount > 0
    }
    open var ignoreUserUserIdReceivedUserId: String?
    open var ignoreUserUserIdReceivedInvocations: [String] = []
    open var ignoreUserUserIdClosure: ((String) async throws -> Void)?

    open override func ignoreUser(userId: String) async throws {
        if let error = ignoreUserUserIdThrowableError {
            throw error
        }
        ignoreUserUserIdCallsCount += 1
        ignoreUserUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.ignoreUserUserIdReceivedInvocations.append(userId)
        }
        try await ignoreUserUserIdClosure?(userId)
    }

    //MARK: - ignoredUsers

    open var ignoredUsersThrowableError: Error?
    var ignoredUsersUnderlyingCallsCount = 0
    open var ignoredUsersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return ignoredUsersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = ignoredUsersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ignoredUsersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    ignoredUsersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var ignoredUsersCalled: Bool {
        return ignoredUsersCallsCount > 0
    }

    var ignoredUsersUnderlyingReturnValue: [String]!
    open var ignoredUsersReturnValue: [String]! {
        get {
            if Thread.isMainThread {
                return ignoredUsersUnderlyingReturnValue
            } else {
                var returnValue: [String]? = nil
                DispatchQueue.main.sync {
                    returnValue = ignoredUsersUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ignoredUsersUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    ignoredUsersUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var ignoredUsersClosure: (() async throws -> [String])?

    open override func ignoredUsers() async throws -> [String] {
        if let error = ignoredUsersThrowableError {
            throw error
        }
        ignoredUsersCallsCount += 1
        if let ignoredUsersClosure = ignoredUsersClosure {
            return try await ignoredUsersClosure()
        } else {
            return ignoredUsersReturnValue
        }
    }

    //MARK: - isLivekitRtcSupported

    open var isLivekitRtcSupportedThrowableError: Error?
    var isLivekitRtcSupportedUnderlyingCallsCount = 0
    open var isLivekitRtcSupportedCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isLivekitRtcSupportedUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isLivekitRtcSupportedUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isLivekitRtcSupportedUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isLivekitRtcSupportedUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isLivekitRtcSupportedCalled: Bool {
        return isLivekitRtcSupportedCallsCount > 0
    }

    var isLivekitRtcSupportedUnderlyingReturnValue: Bool!
    open var isLivekitRtcSupportedReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isLivekitRtcSupportedUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isLivekitRtcSupportedUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isLivekitRtcSupportedUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isLivekitRtcSupportedUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isLivekitRtcSupportedClosure: (() async throws -> Bool)?

    open override func isLivekitRtcSupported() async throws -> Bool {
        if let error = isLivekitRtcSupportedThrowableError {
            throw error
        }
        isLivekitRtcSupportedCallsCount += 1
        if let isLivekitRtcSupportedClosure = isLivekitRtcSupportedClosure {
            return try await isLivekitRtcSupportedClosure()
        } else {
            return isLivekitRtcSupportedReturnValue
        }
    }

    //MARK: - isReportRoomApiSupported

    open var isReportRoomApiSupportedThrowableError: Error?
    var isReportRoomApiSupportedUnderlyingCallsCount = 0
    open var isReportRoomApiSupportedCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isReportRoomApiSupportedUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isReportRoomApiSupportedUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isReportRoomApiSupportedUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isReportRoomApiSupportedUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isReportRoomApiSupportedCalled: Bool {
        return isReportRoomApiSupportedCallsCount > 0
    }

    var isReportRoomApiSupportedUnderlyingReturnValue: Bool!
    open var isReportRoomApiSupportedReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isReportRoomApiSupportedUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isReportRoomApiSupportedUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isReportRoomApiSupportedUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isReportRoomApiSupportedUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isReportRoomApiSupportedClosure: (() async throws -> Bool)?

    open override func isReportRoomApiSupported() async throws -> Bool {
        if let error = isReportRoomApiSupportedThrowableError {
            throw error
        }
        isReportRoomApiSupportedCallsCount += 1
        if let isReportRoomApiSupportedClosure = isReportRoomApiSupportedClosure {
            return try await isReportRoomApiSupportedClosure()
        } else {
            return isReportRoomApiSupportedReturnValue
        }
    }

    //MARK: - isRoomAliasAvailable

    open var isRoomAliasAvailableAliasThrowableError: Error?
    var isRoomAliasAvailableAliasUnderlyingCallsCount = 0
    open var isRoomAliasAvailableAliasCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isRoomAliasAvailableAliasUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isRoomAliasAvailableAliasUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isRoomAliasAvailableAliasUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isRoomAliasAvailableAliasUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isRoomAliasAvailableAliasCalled: Bool {
        return isRoomAliasAvailableAliasCallsCount > 0
    }
    open var isRoomAliasAvailableAliasReceivedAlias: String?
    open var isRoomAliasAvailableAliasReceivedInvocations: [String] = []

    var isRoomAliasAvailableAliasUnderlyingReturnValue: Bool!
    open var isRoomAliasAvailableAliasReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isRoomAliasAvailableAliasUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isRoomAliasAvailableAliasUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isRoomAliasAvailableAliasUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isRoomAliasAvailableAliasUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isRoomAliasAvailableAliasClosure: ((String) async throws -> Bool)?

    open override func isRoomAliasAvailable(alias: String) async throws -> Bool {
        if let error = isRoomAliasAvailableAliasThrowableError {
            throw error
        }
        isRoomAliasAvailableAliasCallsCount += 1
        isRoomAliasAvailableAliasReceivedAlias = alias
        DispatchQueue.main.async {
            self.isRoomAliasAvailableAliasReceivedInvocations.append(alias)
        }
        if let isRoomAliasAvailableAliasClosure = isRoomAliasAvailableAliasClosure {
            return try await isRoomAliasAvailableAliasClosure(alias)
        } else {
            return isRoomAliasAvailableAliasReturnValue
        }
    }

    //MARK: - joinRoomById

    open var joinRoomByIdRoomIdThrowableError: Error?
    var joinRoomByIdRoomIdUnderlyingCallsCount = 0
    open var joinRoomByIdRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return joinRoomByIdRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = joinRoomByIdRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinRoomByIdRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    joinRoomByIdRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var joinRoomByIdRoomIdCalled: Bool {
        return joinRoomByIdRoomIdCallsCount > 0
    }
    open var joinRoomByIdRoomIdReceivedRoomId: String?
    open var joinRoomByIdRoomIdReceivedInvocations: [String] = []

    var joinRoomByIdRoomIdUnderlyingReturnValue: Room!
    open var joinRoomByIdRoomIdReturnValue: Room! {
        get {
            if Thread.isMainThread {
                return joinRoomByIdRoomIdUnderlyingReturnValue
            } else {
                var returnValue: Room? = nil
                DispatchQueue.main.sync {
                    returnValue = joinRoomByIdRoomIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinRoomByIdRoomIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    joinRoomByIdRoomIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var joinRoomByIdRoomIdClosure: ((String) async throws -> Room)?

    open override func joinRoomById(roomId: String) async throws -> Room {
        if let error = joinRoomByIdRoomIdThrowableError {
            throw error
        }
        joinRoomByIdRoomIdCallsCount += 1
        joinRoomByIdRoomIdReceivedRoomId = roomId
        DispatchQueue.main.async {
            self.joinRoomByIdRoomIdReceivedInvocations.append(roomId)
        }
        if let joinRoomByIdRoomIdClosure = joinRoomByIdRoomIdClosure {
            return try await joinRoomByIdRoomIdClosure(roomId)
        } else {
            return joinRoomByIdRoomIdReturnValue
        }
    }

    //MARK: - joinRoomByIdOrAlias

    open var joinRoomByIdOrAliasRoomIdOrAliasServerNamesThrowableError: Error?
    var joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingCallsCount = 0
    open var joinRoomByIdOrAliasRoomIdOrAliasServerNamesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var joinRoomByIdOrAliasRoomIdOrAliasServerNamesCalled: Bool {
        return joinRoomByIdOrAliasRoomIdOrAliasServerNamesCallsCount > 0
    }
    open var joinRoomByIdOrAliasRoomIdOrAliasServerNamesReceivedArguments: (roomIdOrAlias: String, serverNames: [String])?
    open var joinRoomByIdOrAliasRoomIdOrAliasServerNamesReceivedInvocations: [(roomIdOrAlias: String, serverNames: [String])] = []

    var joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingReturnValue: Room!
    open var joinRoomByIdOrAliasRoomIdOrAliasServerNamesReturnValue: Room! {
        get {
            if Thread.isMainThread {
                return joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingReturnValue
            } else {
                var returnValue: Room? = nil
                DispatchQueue.main.sync {
                    returnValue = joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    joinRoomByIdOrAliasRoomIdOrAliasServerNamesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var joinRoomByIdOrAliasRoomIdOrAliasServerNamesClosure: ((String, [String]) async throws -> Room)?

    open override func joinRoomByIdOrAlias(roomIdOrAlias: String, serverNames: [String]) async throws -> Room {
        if let error = joinRoomByIdOrAliasRoomIdOrAliasServerNamesThrowableError {
            throw error
        }
        joinRoomByIdOrAliasRoomIdOrAliasServerNamesCallsCount += 1
        joinRoomByIdOrAliasRoomIdOrAliasServerNamesReceivedArguments = (roomIdOrAlias: roomIdOrAlias, serverNames: serverNames)
        DispatchQueue.main.async {
            self.joinRoomByIdOrAliasRoomIdOrAliasServerNamesReceivedInvocations.append((roomIdOrAlias: roomIdOrAlias, serverNames: serverNames))
        }
        if let joinRoomByIdOrAliasRoomIdOrAliasServerNamesClosure = joinRoomByIdOrAliasRoomIdOrAliasServerNamesClosure {
            return try await joinRoomByIdOrAliasRoomIdOrAliasServerNamesClosure(roomIdOrAlias, serverNames)
        } else {
            return joinRoomByIdOrAliasRoomIdOrAliasServerNamesReturnValue
        }
    }

    //MARK: - knock

    open var knockRoomIdOrAliasReasonServerNamesThrowableError: Error?
    var knockRoomIdOrAliasReasonServerNamesUnderlyingCallsCount = 0
    open var knockRoomIdOrAliasReasonServerNamesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return knockRoomIdOrAliasReasonServerNamesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = knockRoomIdOrAliasReasonServerNamesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                knockRoomIdOrAliasReasonServerNamesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    knockRoomIdOrAliasReasonServerNamesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var knockRoomIdOrAliasReasonServerNamesCalled: Bool {
        return knockRoomIdOrAliasReasonServerNamesCallsCount > 0
    }
    open var knockRoomIdOrAliasReasonServerNamesReceivedArguments: (roomIdOrAlias: String, reason: String?, serverNames: [String])?
    open var knockRoomIdOrAliasReasonServerNamesReceivedInvocations: [(roomIdOrAlias: String, reason: String?, serverNames: [String])] = []

    var knockRoomIdOrAliasReasonServerNamesUnderlyingReturnValue: Room!
    open var knockRoomIdOrAliasReasonServerNamesReturnValue: Room! {
        get {
            if Thread.isMainThread {
                return knockRoomIdOrAliasReasonServerNamesUnderlyingReturnValue
            } else {
                var returnValue: Room? = nil
                DispatchQueue.main.sync {
                    returnValue = knockRoomIdOrAliasReasonServerNamesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                knockRoomIdOrAliasReasonServerNamesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    knockRoomIdOrAliasReasonServerNamesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var knockRoomIdOrAliasReasonServerNamesClosure: ((String, String?, [String]) async throws -> Room)?

    open override func knock(roomIdOrAlias: String, reason: String?, serverNames: [String]) async throws -> Room {
        if let error = knockRoomIdOrAliasReasonServerNamesThrowableError {
            throw error
        }
        knockRoomIdOrAliasReasonServerNamesCallsCount += 1
        knockRoomIdOrAliasReasonServerNamesReceivedArguments = (roomIdOrAlias: roomIdOrAlias, reason: reason, serverNames: serverNames)
        DispatchQueue.main.async {
            self.knockRoomIdOrAliasReasonServerNamesReceivedInvocations.append((roomIdOrAlias: roomIdOrAlias, reason: reason, serverNames: serverNames))
        }
        if let knockRoomIdOrAliasReasonServerNamesClosure = knockRoomIdOrAliasReasonServerNamesClosure {
            return try await knockRoomIdOrAliasReasonServerNamesClosure(roomIdOrAlias, reason, serverNames)
        } else {
            return knockRoomIdOrAliasReasonServerNamesReturnValue
        }
    }

    //MARK: - login

    open var loginUsernamePasswordInitialDeviceNameDeviceIdThrowableError: Error?
    var loginUsernamePasswordInitialDeviceNameDeviceIdUnderlyingCallsCount = 0
    open var loginUsernamePasswordInitialDeviceNameDeviceIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loginUsernamePasswordInitialDeviceNameDeviceIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loginUsernamePasswordInitialDeviceNameDeviceIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loginUsernamePasswordInitialDeviceNameDeviceIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loginUsernamePasswordInitialDeviceNameDeviceIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var loginUsernamePasswordInitialDeviceNameDeviceIdCalled: Bool {
        return loginUsernamePasswordInitialDeviceNameDeviceIdCallsCount > 0
    }
    open var loginUsernamePasswordInitialDeviceNameDeviceIdReceivedArguments: (username: String, password: String, initialDeviceName: String?, deviceId: String?)?
    open var loginUsernamePasswordInitialDeviceNameDeviceIdReceivedInvocations: [(username: String, password: String, initialDeviceName: String?, deviceId: String?)] = []
    open var loginUsernamePasswordInitialDeviceNameDeviceIdClosure: ((String, String, String?, String?) async throws -> Void)?

    open override func login(username: String, password: String, initialDeviceName: String?, deviceId: String?) async throws {
        if let error = loginUsernamePasswordInitialDeviceNameDeviceIdThrowableError {
            throw error
        }
        loginUsernamePasswordInitialDeviceNameDeviceIdCallsCount += 1
        loginUsernamePasswordInitialDeviceNameDeviceIdReceivedArguments = (username: username, password: password, initialDeviceName: initialDeviceName, deviceId: deviceId)
        DispatchQueue.main.async {
            self.loginUsernamePasswordInitialDeviceNameDeviceIdReceivedInvocations.append((username: username, password: password, initialDeviceName: initialDeviceName, deviceId: deviceId))
        }
        try await loginUsernamePasswordInitialDeviceNameDeviceIdClosure?(username, password, initialDeviceName, deviceId)
    }

    //MARK: - loginWithEmail

    open var loginWithEmailEmailPasswordInitialDeviceNameDeviceIdThrowableError: Error?
    var loginWithEmailEmailPasswordInitialDeviceNameDeviceIdUnderlyingCallsCount = 0
    open var loginWithEmailEmailPasswordInitialDeviceNameDeviceIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loginWithEmailEmailPasswordInitialDeviceNameDeviceIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loginWithEmailEmailPasswordInitialDeviceNameDeviceIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loginWithEmailEmailPasswordInitialDeviceNameDeviceIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loginWithEmailEmailPasswordInitialDeviceNameDeviceIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var loginWithEmailEmailPasswordInitialDeviceNameDeviceIdCalled: Bool {
        return loginWithEmailEmailPasswordInitialDeviceNameDeviceIdCallsCount > 0
    }
    open var loginWithEmailEmailPasswordInitialDeviceNameDeviceIdReceivedArguments: (email: String, password: String, initialDeviceName: String?, deviceId: String?)?
    open var loginWithEmailEmailPasswordInitialDeviceNameDeviceIdReceivedInvocations: [(email: String, password: String, initialDeviceName: String?, deviceId: String?)] = []
    open var loginWithEmailEmailPasswordInitialDeviceNameDeviceIdClosure: ((String, String, String?, String?) async throws -> Void)?

    open override func loginWithEmail(email: String, password: String, initialDeviceName: String?, deviceId: String?) async throws {
        if let error = loginWithEmailEmailPasswordInitialDeviceNameDeviceIdThrowableError {
            throw error
        }
        loginWithEmailEmailPasswordInitialDeviceNameDeviceIdCallsCount += 1
        loginWithEmailEmailPasswordInitialDeviceNameDeviceIdReceivedArguments = (email: email, password: password, initialDeviceName: initialDeviceName, deviceId: deviceId)
        DispatchQueue.main.async {
            self.loginWithEmailEmailPasswordInitialDeviceNameDeviceIdReceivedInvocations.append((email: email, password: password, initialDeviceName: initialDeviceName, deviceId: deviceId))
        }
        try await loginWithEmailEmailPasswordInitialDeviceNameDeviceIdClosure?(email, password, initialDeviceName, deviceId)
    }

    //MARK: - loginWithOidcCallback

    open var loginWithOidcCallbackCallbackUrlThrowableError: Error?
    var loginWithOidcCallbackCallbackUrlUnderlyingCallsCount = 0
    open var loginWithOidcCallbackCallbackUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loginWithOidcCallbackCallbackUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loginWithOidcCallbackCallbackUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loginWithOidcCallbackCallbackUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loginWithOidcCallbackCallbackUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var loginWithOidcCallbackCallbackUrlCalled: Bool {
        return loginWithOidcCallbackCallbackUrlCallsCount > 0
    }
    open var loginWithOidcCallbackCallbackUrlReceivedCallbackUrl: String?
    open var loginWithOidcCallbackCallbackUrlReceivedInvocations: [String] = []
    open var loginWithOidcCallbackCallbackUrlClosure: ((String) async throws -> Void)?

    open override func loginWithOidcCallback(callbackUrl: String) async throws {
        if let error = loginWithOidcCallbackCallbackUrlThrowableError {
            throw error
        }
        loginWithOidcCallbackCallbackUrlCallsCount += 1
        loginWithOidcCallbackCallbackUrlReceivedCallbackUrl = callbackUrl
        DispatchQueue.main.async {
            self.loginWithOidcCallbackCallbackUrlReceivedInvocations.append(callbackUrl)
        }
        try await loginWithOidcCallbackCallbackUrlClosure?(callbackUrl)
    }

    //MARK: - loginWithQrCode

    open var loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerThrowableError: Error?
    var loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerUnderlyingCallsCount = 0
    open var loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerCalled: Bool {
        return loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerCallsCount > 0
    }
    open var loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerReceivedArguments: (qrCodeData: QrCodeData, oidcConfiguration: OidcConfiguration, progressListener: QrLoginProgressListener)?
    open var loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerReceivedInvocations: [(qrCodeData: QrCodeData, oidcConfiguration: OidcConfiguration, progressListener: QrLoginProgressListener)] = []
    open var loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerClosure: ((QrCodeData, OidcConfiguration, QrLoginProgressListener) async throws -> Void)?

    open override func loginWithQrCode(qrCodeData: QrCodeData, oidcConfiguration: OidcConfiguration, progressListener: QrLoginProgressListener) async throws {
        if let error = loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerThrowableError {
            throw error
        }
        loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerCallsCount += 1
        loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerReceivedArguments = (qrCodeData: qrCodeData, oidcConfiguration: oidcConfiguration, progressListener: progressListener)
        DispatchQueue.main.async {
            self.loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerReceivedInvocations.append((qrCodeData: qrCodeData, oidcConfiguration: oidcConfiguration, progressListener: progressListener))
        }
        try await loginWithQrCodeQrCodeDataOidcConfigurationProgressListenerClosure?(qrCodeData, oidcConfiguration, progressListener)
    }

    //MARK: - logout

    open var logoutThrowableError: Error?
    var logoutUnderlyingCallsCount = 0
    open var logoutCallsCount: Int {
        get {
            if Thread.isMainThread {
                return logoutUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = logoutUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                logoutUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    logoutUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var logoutCalled: Bool {
        return logoutCallsCount > 0
    }
    open var logoutClosure: (() async throws -> Void)?

    open override func logout() async throws {
        if let error = logoutThrowableError {
            throw error
        }
        logoutCallsCount += 1
        try await logoutClosure?()
    }

    //MARK: - notificationClient

    open var notificationClientProcessSetupThrowableError: Error?
    var notificationClientProcessSetupUnderlyingCallsCount = 0
    open var notificationClientProcessSetupCallsCount: Int {
        get {
            if Thread.isMainThread {
                return notificationClientProcessSetupUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = notificationClientProcessSetupUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                notificationClientProcessSetupUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    notificationClientProcessSetupUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var notificationClientProcessSetupCalled: Bool {
        return notificationClientProcessSetupCallsCount > 0
    }
    open var notificationClientProcessSetupReceivedProcessSetup: NotificationProcessSetup?
    open var notificationClientProcessSetupReceivedInvocations: [NotificationProcessSetup] = []

    var notificationClientProcessSetupUnderlyingReturnValue: NotificationClient!
    open var notificationClientProcessSetupReturnValue: NotificationClient! {
        get {
            if Thread.isMainThread {
                return notificationClientProcessSetupUnderlyingReturnValue
            } else {
                var returnValue: NotificationClient? = nil
                DispatchQueue.main.sync {
                    returnValue = notificationClientProcessSetupUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                notificationClientProcessSetupUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    notificationClientProcessSetupUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var notificationClientProcessSetupClosure: ((NotificationProcessSetup) async throws -> NotificationClient)?

    open override func notificationClient(processSetup: NotificationProcessSetup) async throws -> NotificationClient {
        if let error = notificationClientProcessSetupThrowableError {
            throw error
        }
        notificationClientProcessSetupCallsCount += 1
        notificationClientProcessSetupReceivedProcessSetup = processSetup
        DispatchQueue.main.async {
            self.notificationClientProcessSetupReceivedInvocations.append(processSetup)
        }
        if let notificationClientProcessSetupClosure = notificationClientProcessSetupClosure {
            return try await notificationClientProcessSetupClosure(processSetup)
        } else {
            return notificationClientProcessSetupReturnValue
        }
    }

    //MARK: - observeAccountDataEvent

    var observeAccountDataEventEventTypeListenerUnderlyingCallsCount = 0
    open var observeAccountDataEventEventTypeListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return observeAccountDataEventEventTypeListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = observeAccountDataEventEventTypeListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                observeAccountDataEventEventTypeListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    observeAccountDataEventEventTypeListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var observeAccountDataEventEventTypeListenerCalled: Bool {
        return observeAccountDataEventEventTypeListenerCallsCount > 0
    }
    open var observeAccountDataEventEventTypeListenerReceivedArguments: (eventType: AccountDataEventType, listener: AccountDataListener)?
    open var observeAccountDataEventEventTypeListenerReceivedInvocations: [(eventType: AccountDataEventType, listener: AccountDataListener)] = []

    var observeAccountDataEventEventTypeListenerUnderlyingReturnValue: TaskHandle!
    open var observeAccountDataEventEventTypeListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return observeAccountDataEventEventTypeListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = observeAccountDataEventEventTypeListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                observeAccountDataEventEventTypeListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    observeAccountDataEventEventTypeListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var observeAccountDataEventEventTypeListenerClosure: ((AccountDataEventType, AccountDataListener) -> TaskHandle)?

    open override func observeAccountDataEvent(eventType: AccountDataEventType, listener: AccountDataListener) -> TaskHandle {
        observeAccountDataEventEventTypeListenerCallsCount += 1
        observeAccountDataEventEventTypeListenerReceivedArguments = (eventType: eventType, listener: listener)
        DispatchQueue.main.async {
            self.observeAccountDataEventEventTypeListenerReceivedInvocations.append((eventType: eventType, listener: listener))
        }
        if let observeAccountDataEventEventTypeListenerClosure = observeAccountDataEventEventTypeListenerClosure {
            return observeAccountDataEventEventTypeListenerClosure(eventType, listener)
        } else {
            return observeAccountDataEventEventTypeListenerReturnValue
        }
    }

    //MARK: - observeRoomAccountDataEvent

    open var observeRoomAccountDataEventRoomIdEventTypeListenerThrowableError: Error?
    var observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingCallsCount = 0
    open var observeRoomAccountDataEventRoomIdEventTypeListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var observeRoomAccountDataEventRoomIdEventTypeListenerCalled: Bool {
        return observeRoomAccountDataEventRoomIdEventTypeListenerCallsCount > 0
    }
    open var observeRoomAccountDataEventRoomIdEventTypeListenerReceivedArguments: (roomId: String, eventType: RoomAccountDataEventType, listener: RoomAccountDataListener)?
    open var observeRoomAccountDataEventRoomIdEventTypeListenerReceivedInvocations: [(roomId: String, eventType: RoomAccountDataEventType, listener: RoomAccountDataListener)] = []

    var observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingReturnValue: TaskHandle!
    open var observeRoomAccountDataEventRoomIdEventTypeListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    observeRoomAccountDataEventRoomIdEventTypeListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var observeRoomAccountDataEventRoomIdEventTypeListenerClosure: ((String, RoomAccountDataEventType, RoomAccountDataListener) throws -> TaskHandle)?

    open override func observeRoomAccountDataEvent(roomId: String, eventType: RoomAccountDataEventType, listener: RoomAccountDataListener) throws -> TaskHandle {
        if let error = observeRoomAccountDataEventRoomIdEventTypeListenerThrowableError {
            throw error
        }
        observeRoomAccountDataEventRoomIdEventTypeListenerCallsCount += 1
        observeRoomAccountDataEventRoomIdEventTypeListenerReceivedArguments = (roomId: roomId, eventType: eventType, listener: listener)
        DispatchQueue.main.async {
            self.observeRoomAccountDataEventRoomIdEventTypeListenerReceivedInvocations.append((roomId: roomId, eventType: eventType, listener: listener))
        }
        if let observeRoomAccountDataEventRoomIdEventTypeListenerClosure = observeRoomAccountDataEventRoomIdEventTypeListenerClosure {
            return try observeRoomAccountDataEventRoomIdEventTypeListenerClosure(roomId, eventType, listener)
        } else {
            return observeRoomAccountDataEventRoomIdEventTypeListenerReturnValue
        }
    }

    //MARK: - removeAvatar

    open var removeAvatarThrowableError: Error?
    var removeAvatarUnderlyingCallsCount = 0
    open var removeAvatarCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeAvatarUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeAvatarUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeAvatarUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeAvatarUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var removeAvatarCalled: Bool {
        return removeAvatarCallsCount > 0
    }
    open var removeAvatarClosure: (() async throws -> Void)?

    open override func removeAvatar() async throws {
        if let error = removeAvatarThrowableError {
            throw error
        }
        removeAvatarCallsCount += 1
        try await removeAvatarClosure?()
    }

    //MARK: - resetServerInfo

    open var resetServerInfoThrowableError: Error?
    var resetServerInfoUnderlyingCallsCount = 0
    open var resetServerInfoCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetServerInfoUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetServerInfoUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetServerInfoUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetServerInfoUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var resetServerInfoCalled: Bool {
        return resetServerInfoCallsCount > 0
    }
    open var resetServerInfoClosure: (() async throws -> Void)?

    open override func resetServerInfo() async throws {
        if let error = resetServerInfoThrowableError {
            throw error
        }
        resetServerInfoCallsCount += 1
        try await resetServerInfoClosure?()
    }

    //MARK: - resolveRoomAlias

    open var resolveRoomAliasRoomAliasThrowableError: Error?
    var resolveRoomAliasRoomAliasUnderlyingCallsCount = 0
    open var resolveRoomAliasRoomAliasCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resolveRoomAliasRoomAliasUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resolveRoomAliasRoomAliasUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resolveRoomAliasRoomAliasUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resolveRoomAliasRoomAliasUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var resolveRoomAliasRoomAliasCalled: Bool {
        return resolveRoomAliasRoomAliasCallsCount > 0
    }
    open var resolveRoomAliasRoomAliasReceivedRoomAlias: String?
    open var resolveRoomAliasRoomAliasReceivedInvocations: [String] = []

    var resolveRoomAliasRoomAliasUnderlyingReturnValue: ResolvedRoomAlias?
    open var resolveRoomAliasRoomAliasReturnValue: ResolvedRoomAlias? {
        get {
            if Thread.isMainThread {
                return resolveRoomAliasRoomAliasUnderlyingReturnValue
            } else {
                var returnValue: ResolvedRoomAlias?? = nil
                DispatchQueue.main.sync {
                    returnValue = resolveRoomAliasRoomAliasUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resolveRoomAliasRoomAliasUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    resolveRoomAliasRoomAliasUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var resolveRoomAliasRoomAliasClosure: ((String) async throws -> ResolvedRoomAlias?)?

    open override func resolveRoomAlias(roomAlias: String) async throws -> ResolvedRoomAlias? {
        if let error = resolveRoomAliasRoomAliasThrowableError {
            throw error
        }
        resolveRoomAliasRoomAliasCallsCount += 1
        resolveRoomAliasRoomAliasReceivedRoomAlias = roomAlias
        DispatchQueue.main.async {
            self.resolveRoomAliasRoomAliasReceivedInvocations.append(roomAlias)
        }
        if let resolveRoomAliasRoomAliasClosure = resolveRoomAliasRoomAliasClosure {
            return try await resolveRoomAliasRoomAliasClosure(roomAlias)
        } else {
            return resolveRoomAliasRoomAliasReturnValue
        }
    }

    //MARK: - restoreSession

    open var restoreSessionSessionThrowableError: Error?
    var restoreSessionSessionUnderlyingCallsCount = 0
    open var restoreSessionSessionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return restoreSessionSessionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = restoreSessionSessionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                restoreSessionSessionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    restoreSessionSessionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var restoreSessionSessionCalled: Bool {
        return restoreSessionSessionCallsCount > 0
    }
    open var restoreSessionSessionReceivedSession: Session?
    open var restoreSessionSessionReceivedInvocations: [Session] = []
    open var restoreSessionSessionClosure: ((Session) async throws -> Void)?

    open override func restoreSession(session: Session) async throws {
        if let error = restoreSessionSessionThrowableError {
            throw error
        }
        restoreSessionSessionCallsCount += 1
        restoreSessionSessionReceivedSession = session
        DispatchQueue.main.async {
            self.restoreSessionSessionReceivedInvocations.append(session)
        }
        try await restoreSessionSessionClosure?(session)
    }

    //MARK: - restoreSessionWith

    open var restoreSessionWithSessionRoomLoadSettingsThrowableError: Error?
    var restoreSessionWithSessionRoomLoadSettingsUnderlyingCallsCount = 0
    open var restoreSessionWithSessionRoomLoadSettingsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return restoreSessionWithSessionRoomLoadSettingsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = restoreSessionWithSessionRoomLoadSettingsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                restoreSessionWithSessionRoomLoadSettingsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    restoreSessionWithSessionRoomLoadSettingsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var restoreSessionWithSessionRoomLoadSettingsCalled: Bool {
        return restoreSessionWithSessionRoomLoadSettingsCallsCount > 0
    }
    open var restoreSessionWithSessionRoomLoadSettingsReceivedArguments: (session: Session, roomLoadSettings: RoomLoadSettings)?
    open var restoreSessionWithSessionRoomLoadSettingsReceivedInvocations: [(session: Session, roomLoadSettings: RoomLoadSettings)] = []
    open var restoreSessionWithSessionRoomLoadSettingsClosure: ((Session, RoomLoadSettings) async throws -> Void)?

    open override func restoreSessionWith(session: Session, roomLoadSettings: RoomLoadSettings) async throws {
        if let error = restoreSessionWithSessionRoomLoadSettingsThrowableError {
            throw error
        }
        restoreSessionWithSessionRoomLoadSettingsCallsCount += 1
        restoreSessionWithSessionRoomLoadSettingsReceivedArguments = (session: session, roomLoadSettings: roomLoadSettings)
        DispatchQueue.main.async {
            self.restoreSessionWithSessionRoomLoadSettingsReceivedInvocations.append((session: session, roomLoadSettings: roomLoadSettings))
        }
        try await restoreSessionWithSessionRoomLoadSettingsClosure?(session, roomLoadSettings)
    }

    //MARK: - roomAliasExists

    open var roomAliasExistsRoomAliasThrowableError: Error?
    var roomAliasExistsRoomAliasUnderlyingCallsCount = 0
    open var roomAliasExistsRoomAliasCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomAliasExistsRoomAliasUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomAliasExistsRoomAliasUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomAliasExistsRoomAliasUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomAliasExistsRoomAliasUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var roomAliasExistsRoomAliasCalled: Bool {
        return roomAliasExistsRoomAliasCallsCount > 0
    }
    open var roomAliasExistsRoomAliasReceivedRoomAlias: String?
    open var roomAliasExistsRoomAliasReceivedInvocations: [String] = []

    var roomAliasExistsRoomAliasUnderlyingReturnValue: Bool!
    open var roomAliasExistsRoomAliasReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return roomAliasExistsRoomAliasUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = roomAliasExistsRoomAliasUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomAliasExistsRoomAliasUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomAliasExistsRoomAliasUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var roomAliasExistsRoomAliasClosure: ((String) async throws -> Bool)?

    open override func roomAliasExists(roomAlias: String) async throws -> Bool {
        if let error = roomAliasExistsRoomAliasThrowableError {
            throw error
        }
        roomAliasExistsRoomAliasCallsCount += 1
        roomAliasExistsRoomAliasReceivedRoomAlias = roomAlias
        DispatchQueue.main.async {
            self.roomAliasExistsRoomAliasReceivedInvocations.append(roomAlias)
        }
        if let roomAliasExistsRoomAliasClosure = roomAliasExistsRoomAliasClosure {
            return try await roomAliasExistsRoomAliasClosure(roomAlias)
        } else {
            return roomAliasExistsRoomAliasReturnValue
        }
    }

    //MARK: - roomDirectorySearch

    var roomDirectorySearchUnderlyingCallsCount = 0
    open var roomDirectorySearchCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomDirectorySearchUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomDirectorySearchUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomDirectorySearchUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomDirectorySearchUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var roomDirectorySearchCalled: Bool {
        return roomDirectorySearchCallsCount > 0
    }

    var roomDirectorySearchUnderlyingReturnValue: RoomDirectorySearch!
    open var roomDirectorySearchReturnValue: RoomDirectorySearch! {
        get {
            if Thread.isMainThread {
                return roomDirectorySearchUnderlyingReturnValue
            } else {
                var returnValue: RoomDirectorySearch? = nil
                DispatchQueue.main.sync {
                    returnValue = roomDirectorySearchUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomDirectorySearchUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomDirectorySearchUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var roomDirectorySearchClosure: (() -> RoomDirectorySearch)?

    open override func roomDirectorySearch() -> RoomDirectorySearch {
        roomDirectorySearchCallsCount += 1
        if let roomDirectorySearchClosure = roomDirectorySearchClosure {
            return roomDirectorySearchClosure()
        } else {
            return roomDirectorySearchReturnValue
        }
    }

    //MARK: - rooms

    var roomsUnderlyingCallsCount = 0
    open var roomsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var roomsCalled: Bool {
        return roomsCallsCount > 0
    }

    var roomsUnderlyingReturnValue: [Room]!
    open var roomsReturnValue: [Room]! {
        get {
            if Thread.isMainThread {
                return roomsUnderlyingReturnValue
            } else {
                var returnValue: [Room]? = nil
                DispatchQueue.main.sync {
                    returnValue = roomsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var roomsClosure: (() -> [Room])?

    open override func rooms() -> [Room] {
        roomsCallsCount += 1
        if let roomsClosure = roomsClosure {
            return roomsClosure()
        } else {
            return roomsReturnValue
        }
    }

    //MARK: - searchUsers

    open var searchUsersSearchTermLimitThrowableError: Error?
    var searchUsersSearchTermLimitUnderlyingCallsCount = 0
    open var searchUsersSearchTermLimitCallsCount: Int {
        get {
            if Thread.isMainThread {
                return searchUsersSearchTermLimitUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = searchUsersSearchTermLimitUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                searchUsersSearchTermLimitUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    searchUsersSearchTermLimitUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var searchUsersSearchTermLimitCalled: Bool {
        return searchUsersSearchTermLimitCallsCount > 0
    }
    open var searchUsersSearchTermLimitReceivedArguments: (searchTerm: String, limit: UInt64)?
    open var searchUsersSearchTermLimitReceivedInvocations: [(searchTerm: String, limit: UInt64)] = []

    var searchUsersSearchTermLimitUnderlyingReturnValue: SearchUsersResults!
    open var searchUsersSearchTermLimitReturnValue: SearchUsersResults! {
        get {
            if Thread.isMainThread {
                return searchUsersSearchTermLimitUnderlyingReturnValue
            } else {
                var returnValue: SearchUsersResults? = nil
                DispatchQueue.main.sync {
                    returnValue = searchUsersSearchTermLimitUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                searchUsersSearchTermLimitUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    searchUsersSearchTermLimitUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var searchUsersSearchTermLimitClosure: ((String, UInt64) async throws -> SearchUsersResults)?

    open override func searchUsers(searchTerm: String, limit: UInt64) async throws -> SearchUsersResults {
        if let error = searchUsersSearchTermLimitThrowableError {
            throw error
        }
        searchUsersSearchTermLimitCallsCount += 1
        searchUsersSearchTermLimitReceivedArguments = (searchTerm: searchTerm, limit: limit)
        DispatchQueue.main.async {
            self.searchUsersSearchTermLimitReceivedInvocations.append((searchTerm: searchTerm, limit: limit))
        }
        if let searchUsersSearchTermLimitClosure = searchUsersSearchTermLimitClosure {
            return try await searchUsersSearchTermLimitClosure(searchTerm, limit)
        } else {
            return searchUsersSearchTermLimitReturnValue
        }
    }

    //MARK: - server

    var serverUnderlyingCallsCount = 0
    open var serverCallsCount: Int {
        get {
            if Thread.isMainThread {
                return serverUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = serverUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                serverUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    serverUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var serverCalled: Bool {
        return serverCallsCount > 0
    }

    var serverUnderlyingReturnValue: String?
    open var serverReturnValue: String? {
        get {
            if Thread.isMainThread {
                return serverUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = serverUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                serverUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    serverUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var serverClosure: (() -> String?)?

    open override func server() -> String? {
        serverCallsCount += 1
        if let serverClosure = serverClosure {
            return serverClosure()
        } else {
            return serverReturnValue
        }
    }

    //MARK: - session

    open var sessionThrowableError: Error?
    var sessionUnderlyingCallsCount = 0
    open var sessionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sessionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sessionCalled: Bool {
        return sessionCallsCount > 0
    }

    var sessionUnderlyingReturnValue: Session!
    open var sessionReturnValue: Session! {
        get {
            if Thread.isMainThread {
                return sessionUnderlyingReturnValue
            } else {
                var returnValue: Session? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sessionClosure: (() throws -> Session)?

    open override func session() throws -> Session {
        if let error = sessionThrowableError {
            throw error
        }
        sessionCallsCount += 1
        if let sessionClosure = sessionClosure {
            return try sessionClosure()
        } else {
            return sessionReturnValue
        }
    }

    //MARK: - setAccountData

    open var setAccountDataEventTypeContentThrowableError: Error?
    var setAccountDataEventTypeContentUnderlyingCallsCount = 0
    open var setAccountDataEventTypeContentCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setAccountDataEventTypeContentUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setAccountDataEventTypeContentUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setAccountDataEventTypeContentUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setAccountDataEventTypeContentUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setAccountDataEventTypeContentCalled: Bool {
        return setAccountDataEventTypeContentCallsCount > 0
    }
    open var setAccountDataEventTypeContentReceivedArguments: (eventType: String, content: String)?
    open var setAccountDataEventTypeContentReceivedInvocations: [(eventType: String, content: String)] = []
    open var setAccountDataEventTypeContentClosure: ((String, String) async throws -> Void)?

    open override func setAccountData(eventType: String, content: String) async throws {
        if let error = setAccountDataEventTypeContentThrowableError {
            throw error
        }
        setAccountDataEventTypeContentCallsCount += 1
        setAccountDataEventTypeContentReceivedArguments = (eventType: eventType, content: content)
        DispatchQueue.main.async {
            self.setAccountDataEventTypeContentReceivedInvocations.append((eventType: eventType, content: content))
        }
        try await setAccountDataEventTypeContentClosure?(eventType, content)
    }

    //MARK: - setDelegate

    open var setDelegateDelegateThrowableError: Error?
    var setDelegateDelegateUnderlyingCallsCount = 0
    open var setDelegateDelegateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setDelegateDelegateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setDelegateDelegateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setDelegateDelegateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setDelegateDelegateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setDelegateDelegateCalled: Bool {
        return setDelegateDelegateCallsCount > 0
    }
    open var setDelegateDelegateReceivedDelegate: ClientDelegate?
    open var setDelegateDelegateReceivedInvocations: [ClientDelegate?] = []

    var setDelegateDelegateUnderlyingReturnValue: TaskHandle?
    open var setDelegateDelegateReturnValue: TaskHandle? {
        get {
            if Thread.isMainThread {
                return setDelegateDelegateUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle?? = nil
                DispatchQueue.main.sync {
                    returnValue = setDelegateDelegateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setDelegateDelegateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    setDelegateDelegateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var setDelegateDelegateClosure: ((ClientDelegate?) throws -> TaskHandle?)?

    open override func setDelegate(delegate: ClientDelegate?) throws -> TaskHandle? {
        if let error = setDelegateDelegateThrowableError {
            throw error
        }
        setDelegateDelegateCallsCount += 1
        setDelegateDelegateReceivedDelegate = delegate
        DispatchQueue.main.async {
            self.setDelegateDelegateReceivedInvocations.append(delegate)
        }
        if let setDelegateDelegateClosure = setDelegateDelegateClosure {
            return try setDelegateDelegateClosure(delegate)
        } else {
            return setDelegateDelegateReturnValue
        }
    }

    //MARK: - setDisplayName

    open var setDisplayNameNameThrowableError: Error?
    var setDisplayNameNameUnderlyingCallsCount = 0
    open var setDisplayNameNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setDisplayNameNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setDisplayNameNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setDisplayNameNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setDisplayNameNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setDisplayNameNameCalled: Bool {
        return setDisplayNameNameCallsCount > 0
    }
    open var setDisplayNameNameReceivedName: String?
    open var setDisplayNameNameReceivedInvocations: [String] = []
    open var setDisplayNameNameClosure: ((String) async throws -> Void)?

    open override func setDisplayName(name: String) async throws {
        if let error = setDisplayNameNameThrowableError {
            throw error
        }
        setDisplayNameNameCallsCount += 1
        setDisplayNameNameReceivedName = name
        DispatchQueue.main.async {
            self.setDisplayNameNameReceivedInvocations.append(name)
        }
        try await setDisplayNameNameClosure?(name)
    }

    //MARK: - setInviteAvatarsDisplayPolicy

    open var setInviteAvatarsDisplayPolicyPolicyThrowableError: Error?
    var setInviteAvatarsDisplayPolicyPolicyUnderlyingCallsCount = 0
    open var setInviteAvatarsDisplayPolicyPolicyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setInviteAvatarsDisplayPolicyPolicyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setInviteAvatarsDisplayPolicyPolicyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setInviteAvatarsDisplayPolicyPolicyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setInviteAvatarsDisplayPolicyPolicyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setInviteAvatarsDisplayPolicyPolicyCalled: Bool {
        return setInviteAvatarsDisplayPolicyPolicyCallsCount > 0
    }
    open var setInviteAvatarsDisplayPolicyPolicyReceivedPolicy: InviteAvatars?
    open var setInviteAvatarsDisplayPolicyPolicyReceivedInvocations: [InviteAvatars] = []
    open var setInviteAvatarsDisplayPolicyPolicyClosure: ((InviteAvatars) async throws -> Void)?

    open override func setInviteAvatarsDisplayPolicy(policy: InviteAvatars) async throws {
        if let error = setInviteAvatarsDisplayPolicyPolicyThrowableError {
            throw error
        }
        setInviteAvatarsDisplayPolicyPolicyCallsCount += 1
        setInviteAvatarsDisplayPolicyPolicyReceivedPolicy = policy
        DispatchQueue.main.async {
            self.setInviteAvatarsDisplayPolicyPolicyReceivedInvocations.append(policy)
        }
        try await setInviteAvatarsDisplayPolicyPolicyClosure?(policy)
    }

    //MARK: - setMediaPreviewDisplayPolicy

    open var setMediaPreviewDisplayPolicyPolicyThrowableError: Error?
    var setMediaPreviewDisplayPolicyPolicyUnderlyingCallsCount = 0
    open var setMediaPreviewDisplayPolicyPolicyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setMediaPreviewDisplayPolicyPolicyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setMediaPreviewDisplayPolicyPolicyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setMediaPreviewDisplayPolicyPolicyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setMediaPreviewDisplayPolicyPolicyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setMediaPreviewDisplayPolicyPolicyCalled: Bool {
        return setMediaPreviewDisplayPolicyPolicyCallsCount > 0
    }
    open var setMediaPreviewDisplayPolicyPolicyReceivedPolicy: MediaPreviews?
    open var setMediaPreviewDisplayPolicyPolicyReceivedInvocations: [MediaPreviews] = []
    open var setMediaPreviewDisplayPolicyPolicyClosure: ((MediaPreviews) async throws -> Void)?

    open override func setMediaPreviewDisplayPolicy(policy: MediaPreviews) async throws {
        if let error = setMediaPreviewDisplayPolicyPolicyThrowableError {
            throw error
        }
        setMediaPreviewDisplayPolicyPolicyCallsCount += 1
        setMediaPreviewDisplayPolicyPolicyReceivedPolicy = policy
        DispatchQueue.main.async {
            self.setMediaPreviewDisplayPolicyPolicyReceivedInvocations.append(policy)
        }
        try await setMediaPreviewDisplayPolicyPolicyClosure?(policy)
    }

    //MARK: - setMediaRetentionPolicy

    open var setMediaRetentionPolicyPolicyThrowableError: Error?
    var setMediaRetentionPolicyPolicyUnderlyingCallsCount = 0
    open var setMediaRetentionPolicyPolicyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setMediaRetentionPolicyPolicyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setMediaRetentionPolicyPolicyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setMediaRetentionPolicyPolicyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setMediaRetentionPolicyPolicyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setMediaRetentionPolicyPolicyCalled: Bool {
        return setMediaRetentionPolicyPolicyCallsCount > 0
    }
    open var setMediaRetentionPolicyPolicyReceivedPolicy: MediaRetentionPolicy?
    open var setMediaRetentionPolicyPolicyReceivedInvocations: [MediaRetentionPolicy] = []
    open var setMediaRetentionPolicyPolicyClosure: ((MediaRetentionPolicy) async throws -> Void)?

    open override func setMediaRetentionPolicy(policy: MediaRetentionPolicy) async throws {
        if let error = setMediaRetentionPolicyPolicyThrowableError {
            throw error
        }
        setMediaRetentionPolicyPolicyCallsCount += 1
        setMediaRetentionPolicyPolicyReceivedPolicy = policy
        DispatchQueue.main.async {
            self.setMediaRetentionPolicyPolicyReceivedInvocations.append(policy)
        }
        try await setMediaRetentionPolicyPolicyClosure?(policy)
    }

    //MARK: - setPusher

    open var setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangThrowableError: Error?
    var setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangUnderlyingCallsCount = 0
    open var setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangCalled: Bool {
        return setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangCallsCount > 0
    }
    open var setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangReceivedArguments: (identifiers: PusherIdentifiers, kind: PusherKind, appDisplayName: String, deviceDisplayName: String, profileTag: String?, lang: String)?
    open var setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangReceivedInvocations: [(identifiers: PusherIdentifiers, kind: PusherKind, appDisplayName: String, deviceDisplayName: String, profileTag: String?, lang: String)] = []
    open var setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangClosure: ((PusherIdentifiers, PusherKind, String, String, String?, String) async throws -> Void)?

    open override func setPusher(identifiers: PusherIdentifiers, kind: PusherKind, appDisplayName: String, deviceDisplayName: String, profileTag: String?, lang: String) async throws {
        if let error = setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangThrowableError {
            throw error
        }
        setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangCallsCount += 1
        setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangReceivedArguments = (identifiers: identifiers, kind: kind, appDisplayName: appDisplayName, deviceDisplayName: deviceDisplayName, profileTag: profileTag, lang: lang)
        DispatchQueue.main.async {
            self.setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangReceivedInvocations.append((identifiers: identifiers, kind: kind, appDisplayName: appDisplayName, deviceDisplayName: deviceDisplayName, profileTag: profileTag, lang: lang))
        }
        try await setPusherIdentifiersKindAppDisplayNameDeviceDisplayNameProfileTagLangClosure?(identifiers, kind, appDisplayName, deviceDisplayName, profileTag, lang)
    }

    //MARK: - setUtdDelegate

    open var setUtdDelegateUtdDelegateThrowableError: Error?
    var setUtdDelegateUtdDelegateUnderlyingCallsCount = 0
    open var setUtdDelegateUtdDelegateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setUtdDelegateUtdDelegateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setUtdDelegateUtdDelegateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUtdDelegateUtdDelegateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setUtdDelegateUtdDelegateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setUtdDelegateUtdDelegateCalled: Bool {
        return setUtdDelegateUtdDelegateCallsCount > 0
    }
    open var setUtdDelegateUtdDelegateReceivedUtdDelegate: UnableToDecryptDelegate?
    open var setUtdDelegateUtdDelegateReceivedInvocations: [UnableToDecryptDelegate] = []
    open var setUtdDelegateUtdDelegateClosure: ((UnableToDecryptDelegate) async throws -> Void)?

    open override func setUtdDelegate(utdDelegate: UnableToDecryptDelegate) async throws {
        if let error = setUtdDelegateUtdDelegateThrowableError {
            throw error
        }
        setUtdDelegateUtdDelegateCallsCount += 1
        setUtdDelegateUtdDelegateReceivedUtdDelegate = utdDelegate
        DispatchQueue.main.async {
            self.setUtdDelegateUtdDelegateReceivedInvocations.append(utdDelegate)
        }
        try await setUtdDelegateUtdDelegateClosure?(utdDelegate)
    }

    //MARK: - slidingSyncVersion

    var slidingSyncVersionUnderlyingCallsCount = 0
    open var slidingSyncVersionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return slidingSyncVersionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = slidingSyncVersionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                slidingSyncVersionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    slidingSyncVersionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var slidingSyncVersionCalled: Bool {
        return slidingSyncVersionCallsCount > 0
    }

    var slidingSyncVersionUnderlyingReturnValue: SlidingSyncVersion!
    open var slidingSyncVersionReturnValue: SlidingSyncVersion! {
        get {
            if Thread.isMainThread {
                return slidingSyncVersionUnderlyingReturnValue
            } else {
                var returnValue: SlidingSyncVersion? = nil
                DispatchQueue.main.sync {
                    returnValue = slidingSyncVersionUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                slidingSyncVersionUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    slidingSyncVersionUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var slidingSyncVersionClosure: (() -> SlidingSyncVersion)?

    open override func slidingSyncVersion() -> SlidingSyncVersion {
        slidingSyncVersionCallsCount += 1
        if let slidingSyncVersionClosure = slidingSyncVersionClosure {
            return slidingSyncVersionClosure()
        } else {
            return slidingSyncVersionReturnValue
        }
    }

    //MARK: - startSsoLogin

    open var startSsoLoginRedirectUrlIdpIdThrowableError: Error?
    var startSsoLoginRedirectUrlIdpIdUnderlyingCallsCount = 0
    open var startSsoLoginRedirectUrlIdpIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startSsoLoginRedirectUrlIdpIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startSsoLoginRedirectUrlIdpIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startSsoLoginRedirectUrlIdpIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startSsoLoginRedirectUrlIdpIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var startSsoLoginRedirectUrlIdpIdCalled: Bool {
        return startSsoLoginRedirectUrlIdpIdCallsCount > 0
    }
    open var startSsoLoginRedirectUrlIdpIdReceivedArguments: (redirectUrl: String, idpId: String?)?
    open var startSsoLoginRedirectUrlIdpIdReceivedInvocations: [(redirectUrl: String, idpId: String?)] = []

    var startSsoLoginRedirectUrlIdpIdUnderlyingReturnValue: SsoHandler!
    open var startSsoLoginRedirectUrlIdpIdReturnValue: SsoHandler! {
        get {
            if Thread.isMainThread {
                return startSsoLoginRedirectUrlIdpIdUnderlyingReturnValue
            } else {
                var returnValue: SsoHandler? = nil
                DispatchQueue.main.sync {
                    returnValue = startSsoLoginRedirectUrlIdpIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startSsoLoginRedirectUrlIdpIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    startSsoLoginRedirectUrlIdpIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var startSsoLoginRedirectUrlIdpIdClosure: ((String, String?) async throws -> SsoHandler)?

    open override func startSsoLogin(redirectUrl: String, idpId: String?) async throws -> SsoHandler {
        if let error = startSsoLoginRedirectUrlIdpIdThrowableError {
            throw error
        }
        startSsoLoginRedirectUrlIdpIdCallsCount += 1
        startSsoLoginRedirectUrlIdpIdReceivedArguments = (redirectUrl: redirectUrl, idpId: idpId)
        DispatchQueue.main.async {
            self.startSsoLoginRedirectUrlIdpIdReceivedInvocations.append((redirectUrl: redirectUrl, idpId: idpId))
        }
        if let startSsoLoginRedirectUrlIdpIdClosure = startSsoLoginRedirectUrlIdpIdClosure {
            return try await startSsoLoginRedirectUrlIdpIdClosure(redirectUrl, idpId)
        } else {
            return startSsoLoginRedirectUrlIdpIdReturnValue
        }
    }

    //MARK: - subscribeToIgnoredUsers

    var subscribeToIgnoredUsersListenerUnderlyingCallsCount = 0
    open var subscribeToIgnoredUsersListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToIgnoredUsersListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToIgnoredUsersListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToIgnoredUsersListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToIgnoredUsersListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToIgnoredUsersListenerCalled: Bool {
        return subscribeToIgnoredUsersListenerCallsCount > 0
    }
    open var subscribeToIgnoredUsersListenerReceivedListener: IgnoredUsersListener?
    open var subscribeToIgnoredUsersListenerReceivedInvocations: [IgnoredUsersListener] = []

    var subscribeToIgnoredUsersListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToIgnoredUsersListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToIgnoredUsersListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToIgnoredUsersListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToIgnoredUsersListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToIgnoredUsersListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToIgnoredUsersListenerClosure: ((IgnoredUsersListener) -> TaskHandle)?

    open override func subscribeToIgnoredUsers(listener: IgnoredUsersListener) -> TaskHandle {
        subscribeToIgnoredUsersListenerCallsCount += 1
        subscribeToIgnoredUsersListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.subscribeToIgnoredUsersListenerReceivedInvocations.append(listener)
        }
        if let subscribeToIgnoredUsersListenerClosure = subscribeToIgnoredUsersListenerClosure {
            return subscribeToIgnoredUsersListenerClosure(listener)
        } else {
            return subscribeToIgnoredUsersListenerReturnValue
        }
    }

    //MARK: - subscribeToMediaPreviewConfig

    open var subscribeToMediaPreviewConfigListenerThrowableError: Error?
    var subscribeToMediaPreviewConfigListenerUnderlyingCallsCount = 0
    open var subscribeToMediaPreviewConfigListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToMediaPreviewConfigListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToMediaPreviewConfigListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToMediaPreviewConfigListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToMediaPreviewConfigListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToMediaPreviewConfigListenerCalled: Bool {
        return subscribeToMediaPreviewConfigListenerCallsCount > 0
    }
    open var subscribeToMediaPreviewConfigListenerReceivedListener: MediaPreviewConfigListener?
    open var subscribeToMediaPreviewConfigListenerReceivedInvocations: [MediaPreviewConfigListener] = []

    var subscribeToMediaPreviewConfigListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToMediaPreviewConfigListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToMediaPreviewConfigListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToMediaPreviewConfigListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToMediaPreviewConfigListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToMediaPreviewConfigListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToMediaPreviewConfigListenerClosure: ((MediaPreviewConfigListener) async throws -> TaskHandle)?

    open override func subscribeToMediaPreviewConfig(listener: MediaPreviewConfigListener) async throws -> TaskHandle {
        if let error = subscribeToMediaPreviewConfigListenerThrowableError {
            throw error
        }
        subscribeToMediaPreviewConfigListenerCallsCount += 1
        subscribeToMediaPreviewConfigListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.subscribeToMediaPreviewConfigListenerReceivedInvocations.append(listener)
        }
        if let subscribeToMediaPreviewConfigListenerClosure = subscribeToMediaPreviewConfigListenerClosure {
            return try await subscribeToMediaPreviewConfigListenerClosure(listener)
        } else {
            return subscribeToMediaPreviewConfigListenerReturnValue
        }
    }

    //MARK: - subscribeToRoomInfo

    open var subscribeToRoomInfoRoomIdListenerThrowableError: Error?
    var subscribeToRoomInfoRoomIdListenerUnderlyingCallsCount = 0
    open var subscribeToRoomInfoRoomIdListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToRoomInfoRoomIdListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToRoomInfoRoomIdListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToRoomInfoRoomIdListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToRoomInfoRoomIdListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToRoomInfoRoomIdListenerCalled: Bool {
        return subscribeToRoomInfoRoomIdListenerCallsCount > 0
    }
    open var subscribeToRoomInfoRoomIdListenerReceivedArguments: (roomId: String, listener: RoomInfoListener)?
    open var subscribeToRoomInfoRoomIdListenerReceivedInvocations: [(roomId: String, listener: RoomInfoListener)] = []

    var subscribeToRoomInfoRoomIdListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToRoomInfoRoomIdListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToRoomInfoRoomIdListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToRoomInfoRoomIdListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToRoomInfoRoomIdListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToRoomInfoRoomIdListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToRoomInfoRoomIdListenerClosure: ((String, RoomInfoListener) async throws -> TaskHandle)?

    open override func subscribeToRoomInfo(roomId: String, listener: RoomInfoListener) async throws -> TaskHandle {
        if let error = subscribeToRoomInfoRoomIdListenerThrowableError {
            throw error
        }
        subscribeToRoomInfoRoomIdListenerCallsCount += 1
        subscribeToRoomInfoRoomIdListenerReceivedArguments = (roomId: roomId, listener: listener)
        DispatchQueue.main.async {
            self.subscribeToRoomInfoRoomIdListenerReceivedInvocations.append((roomId: roomId, listener: listener))
        }
        if let subscribeToRoomInfoRoomIdListenerClosure = subscribeToRoomInfoRoomIdListenerClosure {
            return try await subscribeToRoomInfoRoomIdListenerClosure(roomId, listener)
        } else {
            return subscribeToRoomInfoRoomIdListenerReturnValue
        }
    }

    //MARK: - subscribeToSendQueueStatus

    var subscribeToSendQueueStatusListenerUnderlyingCallsCount = 0
    open var subscribeToSendQueueStatusListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToSendQueueStatusListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToSendQueueStatusListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToSendQueueStatusListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToSendQueueStatusListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToSendQueueStatusListenerCalled: Bool {
        return subscribeToSendQueueStatusListenerCallsCount > 0
    }
    open var subscribeToSendQueueStatusListenerReceivedListener: SendQueueRoomErrorListener?
    open var subscribeToSendQueueStatusListenerReceivedInvocations: [SendQueueRoomErrorListener] = []

    var subscribeToSendQueueStatusListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToSendQueueStatusListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToSendQueueStatusListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToSendQueueStatusListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToSendQueueStatusListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToSendQueueStatusListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToSendQueueStatusListenerClosure: ((SendQueueRoomErrorListener) -> TaskHandle)?

    open override func subscribeToSendQueueStatus(listener: SendQueueRoomErrorListener) -> TaskHandle {
        subscribeToSendQueueStatusListenerCallsCount += 1
        subscribeToSendQueueStatusListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.subscribeToSendQueueStatusListenerReceivedInvocations.append(listener)
        }
        if let subscribeToSendQueueStatusListenerClosure = subscribeToSendQueueStatusListenerClosure {
            return subscribeToSendQueueStatusListenerClosure(listener)
        } else {
            return subscribeToSendQueueStatusListenerReturnValue
        }
    }

    //MARK: - syncService

    var syncServiceUnderlyingCallsCount = 0
    open var syncServiceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return syncServiceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = syncServiceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                syncServiceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    syncServiceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var syncServiceCalled: Bool {
        return syncServiceCallsCount > 0
    }

    var syncServiceUnderlyingReturnValue: SyncServiceBuilder!
    open var syncServiceReturnValue: SyncServiceBuilder! {
        get {
            if Thread.isMainThread {
                return syncServiceUnderlyingReturnValue
            } else {
                var returnValue: SyncServiceBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = syncServiceUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                syncServiceUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    syncServiceUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var syncServiceClosure: (() -> SyncServiceBuilder)?

    open override func syncService() -> SyncServiceBuilder {
        syncServiceCallsCount += 1
        if let syncServiceClosure = syncServiceClosure {
            return syncServiceClosure()
        } else {
            return syncServiceReturnValue
        }
    }

    //MARK: - trackRecentlyVisitedRoom

    open var trackRecentlyVisitedRoomRoomThrowableError: Error?
    var trackRecentlyVisitedRoomRoomUnderlyingCallsCount = 0
    open var trackRecentlyVisitedRoomRoomCallsCount: Int {
        get {
            if Thread.isMainThread {
                return trackRecentlyVisitedRoomRoomUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = trackRecentlyVisitedRoomRoomUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                trackRecentlyVisitedRoomRoomUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    trackRecentlyVisitedRoomRoomUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var trackRecentlyVisitedRoomRoomCalled: Bool {
        return trackRecentlyVisitedRoomRoomCallsCount > 0
    }
    open var trackRecentlyVisitedRoomRoomReceivedRoom: String?
    open var trackRecentlyVisitedRoomRoomReceivedInvocations: [String] = []
    open var trackRecentlyVisitedRoomRoomClosure: ((String) async throws -> Void)?

    open override func trackRecentlyVisitedRoom(room: String) async throws {
        if let error = trackRecentlyVisitedRoomRoomThrowableError {
            throw error
        }
        trackRecentlyVisitedRoomRoomCallsCount += 1
        trackRecentlyVisitedRoomRoomReceivedRoom = room
        DispatchQueue.main.async {
            self.trackRecentlyVisitedRoomRoomReceivedInvocations.append(room)
        }
        try await trackRecentlyVisitedRoomRoomClosure?(room)
    }

    //MARK: - unignoreUser

    open var unignoreUserUserIdThrowableError: Error?
    var unignoreUserUserIdUnderlyingCallsCount = 0
    open var unignoreUserUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unignoreUserUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unignoreUserUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unignoreUserUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unignoreUserUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var unignoreUserUserIdCalled: Bool {
        return unignoreUserUserIdCallsCount > 0
    }
    open var unignoreUserUserIdReceivedUserId: String?
    open var unignoreUserUserIdReceivedInvocations: [String] = []
    open var unignoreUserUserIdClosure: ((String) async throws -> Void)?

    open override func unignoreUser(userId: String) async throws {
        if let error = unignoreUserUserIdThrowableError {
            throw error
        }
        unignoreUserUserIdCallsCount += 1
        unignoreUserUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.unignoreUserUserIdReceivedInvocations.append(userId)
        }
        try await unignoreUserUserIdClosure?(userId)
    }

    //MARK: - uploadAvatar

    open var uploadAvatarMimeTypeDataThrowableError: Error?
    var uploadAvatarMimeTypeDataUnderlyingCallsCount = 0
    open var uploadAvatarMimeTypeDataCallsCount: Int {
        get {
            if Thread.isMainThread {
                return uploadAvatarMimeTypeDataUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = uploadAvatarMimeTypeDataUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uploadAvatarMimeTypeDataUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    uploadAvatarMimeTypeDataUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var uploadAvatarMimeTypeDataCalled: Bool {
        return uploadAvatarMimeTypeDataCallsCount > 0
    }
    open var uploadAvatarMimeTypeDataReceivedArguments: (mimeType: String, data: Data)?
    open var uploadAvatarMimeTypeDataReceivedInvocations: [(mimeType: String, data: Data)] = []
    open var uploadAvatarMimeTypeDataClosure: ((String, Data) async throws -> Void)?

    open override func uploadAvatar(mimeType: String, data: Data) async throws {
        if let error = uploadAvatarMimeTypeDataThrowableError {
            throw error
        }
        uploadAvatarMimeTypeDataCallsCount += 1
        uploadAvatarMimeTypeDataReceivedArguments = (mimeType: mimeType, data: data)
        DispatchQueue.main.async {
            self.uploadAvatarMimeTypeDataReceivedInvocations.append((mimeType: mimeType, data: data))
        }
        try await uploadAvatarMimeTypeDataClosure?(mimeType, data)
    }

    //MARK: - uploadMedia

    open var uploadMediaMimeTypeDataProgressWatcherThrowableError: Error?
    var uploadMediaMimeTypeDataProgressWatcherUnderlyingCallsCount = 0
    open var uploadMediaMimeTypeDataProgressWatcherCallsCount: Int {
        get {
            if Thread.isMainThread {
                return uploadMediaMimeTypeDataProgressWatcherUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = uploadMediaMimeTypeDataProgressWatcherUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uploadMediaMimeTypeDataProgressWatcherUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    uploadMediaMimeTypeDataProgressWatcherUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var uploadMediaMimeTypeDataProgressWatcherCalled: Bool {
        return uploadMediaMimeTypeDataProgressWatcherCallsCount > 0
    }
    open var uploadMediaMimeTypeDataProgressWatcherReceivedArguments: (mimeType: String, data: Data, progressWatcher: ProgressWatcher?)?
    open var uploadMediaMimeTypeDataProgressWatcherReceivedInvocations: [(mimeType: String, data: Data, progressWatcher: ProgressWatcher?)] = []

    var uploadMediaMimeTypeDataProgressWatcherUnderlyingReturnValue: String!
    open var uploadMediaMimeTypeDataProgressWatcherReturnValue: String! {
        get {
            if Thread.isMainThread {
                return uploadMediaMimeTypeDataProgressWatcherUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = uploadMediaMimeTypeDataProgressWatcherUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uploadMediaMimeTypeDataProgressWatcherUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    uploadMediaMimeTypeDataProgressWatcherUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var uploadMediaMimeTypeDataProgressWatcherClosure: ((String, Data, ProgressWatcher?) async throws -> String)?

    open override func uploadMedia(mimeType: String, data: Data, progressWatcher: ProgressWatcher?) async throws -> String {
        if let error = uploadMediaMimeTypeDataProgressWatcherThrowableError {
            throw error
        }
        uploadMediaMimeTypeDataProgressWatcherCallsCount += 1
        uploadMediaMimeTypeDataProgressWatcherReceivedArguments = (mimeType: mimeType, data: data, progressWatcher: progressWatcher)
        DispatchQueue.main.async {
            self.uploadMediaMimeTypeDataProgressWatcherReceivedInvocations.append((mimeType: mimeType, data: data, progressWatcher: progressWatcher))
        }
        if let uploadMediaMimeTypeDataProgressWatcherClosure = uploadMediaMimeTypeDataProgressWatcherClosure {
            return try await uploadMediaMimeTypeDataProgressWatcherClosure(mimeType, data, progressWatcher)
        } else {
            return uploadMediaMimeTypeDataProgressWatcherReturnValue
        }
    }

    //MARK: - urlForOidc

    open var urlForOidcOidcConfigurationPromptLoginHintDeviceIdThrowableError: Error?
    var urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingCallsCount = 0
    open var urlForOidcOidcConfigurationPromptLoginHintDeviceIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var urlForOidcOidcConfigurationPromptLoginHintDeviceIdCalled: Bool {
        return urlForOidcOidcConfigurationPromptLoginHintDeviceIdCallsCount > 0
    }
    open var urlForOidcOidcConfigurationPromptLoginHintDeviceIdReceivedArguments: (oidcConfiguration: OidcConfiguration, prompt: OidcPrompt?, loginHint: String?, deviceId: String?)?
    open var urlForOidcOidcConfigurationPromptLoginHintDeviceIdReceivedInvocations: [(oidcConfiguration: OidcConfiguration, prompt: OidcPrompt?, loginHint: String?, deviceId: String?)] = []

    var urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingReturnValue: OAuthAuthorizationData!
    open var urlForOidcOidcConfigurationPromptLoginHintDeviceIdReturnValue: OAuthAuthorizationData! {
        get {
            if Thread.isMainThread {
                return urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingReturnValue
            } else {
                var returnValue: OAuthAuthorizationData? = nil
                DispatchQueue.main.sync {
                    returnValue = urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    urlForOidcOidcConfigurationPromptLoginHintDeviceIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var urlForOidcOidcConfigurationPromptLoginHintDeviceIdClosure: ((OidcConfiguration, OidcPrompt?, String?, String?) async throws -> OAuthAuthorizationData)?

    open override func urlForOidc(oidcConfiguration: OidcConfiguration, prompt: OidcPrompt?, loginHint: String?, deviceId: String?) async throws -> OAuthAuthorizationData {
        if let error = urlForOidcOidcConfigurationPromptLoginHintDeviceIdThrowableError {
            throw error
        }
        urlForOidcOidcConfigurationPromptLoginHintDeviceIdCallsCount += 1
        urlForOidcOidcConfigurationPromptLoginHintDeviceIdReceivedArguments = (oidcConfiguration: oidcConfiguration, prompt: prompt, loginHint: loginHint, deviceId: deviceId)
        DispatchQueue.main.async {
            self.urlForOidcOidcConfigurationPromptLoginHintDeviceIdReceivedInvocations.append((oidcConfiguration: oidcConfiguration, prompt: prompt, loginHint: loginHint, deviceId: deviceId))
        }
        if let urlForOidcOidcConfigurationPromptLoginHintDeviceIdClosure = urlForOidcOidcConfigurationPromptLoginHintDeviceIdClosure {
            return try await urlForOidcOidcConfigurationPromptLoginHintDeviceIdClosure(oidcConfiguration, prompt, loginHint, deviceId)
        } else {
            return urlForOidcOidcConfigurationPromptLoginHintDeviceIdReturnValue
        }
    }

    //MARK: - userId

    open var userIdThrowableError: Error?
    var userIdUnderlyingCallsCount = 0
    open var userIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return userIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = userIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    userIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var userIdCalled: Bool {
        return userIdCallsCount > 0
    }

    var userIdUnderlyingReturnValue: String!
    open var userIdReturnValue: String! {
        get {
            if Thread.isMainThread {
                return userIdUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = userIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    userIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var userIdClosure: (() throws -> String)?

    open override func userId() throws -> String {
        if let error = userIdThrowableError {
            throw error
        }
        userIdCallsCount += 1
        if let userIdClosure = userIdClosure {
            return try userIdClosure()
        } else {
            return userIdReturnValue
        }
    }

    //MARK: - userIdServerName

    open var userIdServerNameThrowableError: Error?
    var userIdServerNameUnderlyingCallsCount = 0
    open var userIdServerNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return userIdServerNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = userIdServerNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userIdServerNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    userIdServerNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var userIdServerNameCalled: Bool {
        return userIdServerNameCallsCount > 0
    }

    var userIdServerNameUnderlyingReturnValue: String!
    open var userIdServerNameReturnValue: String! {
        get {
            if Thread.isMainThread {
                return userIdServerNameUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = userIdServerNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userIdServerNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    userIdServerNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var userIdServerNameClosure: (() throws -> String)?

    open override func userIdServerName() throws -> String {
        if let error = userIdServerNameThrowableError {
            throw error
        }
        userIdServerNameCallsCount += 1
        if let userIdServerNameClosure = userIdServerNameClosure {
            return try userIdServerNameClosure()
        } else {
            return userIdServerNameReturnValue
        }
    }
}
open class ClientBuilderSDKMock: MatrixRustSDK.ClientBuilder, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - addRootCertificates

    var addRootCertificatesCertificatesUnderlyingCallsCount = 0
    open var addRootCertificatesCertificatesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return addRootCertificatesCertificatesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = addRootCertificatesCertificatesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                addRootCertificatesCertificatesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    addRootCertificatesCertificatesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var addRootCertificatesCertificatesCalled: Bool {
        return addRootCertificatesCertificatesCallsCount > 0
    }
    open var addRootCertificatesCertificatesReceivedCertificates: [Data]?
    open var addRootCertificatesCertificatesReceivedInvocations: [[Data]] = []

    var addRootCertificatesCertificatesUnderlyingReturnValue: ClientBuilder!
    open var addRootCertificatesCertificatesReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return addRootCertificatesCertificatesUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = addRootCertificatesCertificatesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                addRootCertificatesCertificatesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    addRootCertificatesCertificatesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var addRootCertificatesCertificatesClosure: (([Data]) -> ClientBuilder)?

    open override func addRootCertificates(certificates: [Data]) -> ClientBuilder {
        addRootCertificatesCertificatesCallsCount += 1
        addRootCertificatesCertificatesReceivedCertificates = certificates
        DispatchQueue.main.async {
            self.addRootCertificatesCertificatesReceivedInvocations.append(certificates)
        }
        if let addRootCertificatesCertificatesClosure = addRootCertificatesCertificatesClosure {
            return addRootCertificatesCertificatesClosure(certificates)
        } else {
            return addRootCertificatesCertificatesReturnValue
        }
    }

    //MARK: - autoEnableBackups

    var autoEnableBackupsAutoEnableBackupsUnderlyingCallsCount = 0
    open var autoEnableBackupsAutoEnableBackupsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return autoEnableBackupsAutoEnableBackupsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = autoEnableBackupsAutoEnableBackupsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                autoEnableBackupsAutoEnableBackupsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    autoEnableBackupsAutoEnableBackupsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var autoEnableBackupsAutoEnableBackupsCalled: Bool {
        return autoEnableBackupsAutoEnableBackupsCallsCount > 0
    }
    open var autoEnableBackupsAutoEnableBackupsReceivedAutoEnableBackups: Bool?
    open var autoEnableBackupsAutoEnableBackupsReceivedInvocations: [Bool] = []

    var autoEnableBackupsAutoEnableBackupsUnderlyingReturnValue: ClientBuilder!
    open var autoEnableBackupsAutoEnableBackupsReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return autoEnableBackupsAutoEnableBackupsUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = autoEnableBackupsAutoEnableBackupsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                autoEnableBackupsAutoEnableBackupsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    autoEnableBackupsAutoEnableBackupsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var autoEnableBackupsAutoEnableBackupsClosure: ((Bool) -> ClientBuilder)?

    open override func autoEnableBackups(autoEnableBackups: Bool) -> ClientBuilder {
        autoEnableBackupsAutoEnableBackupsCallsCount += 1
        autoEnableBackupsAutoEnableBackupsReceivedAutoEnableBackups = autoEnableBackups
        DispatchQueue.main.async {
            self.autoEnableBackupsAutoEnableBackupsReceivedInvocations.append(autoEnableBackups)
        }
        if let autoEnableBackupsAutoEnableBackupsClosure = autoEnableBackupsAutoEnableBackupsClosure {
            return autoEnableBackupsAutoEnableBackupsClosure(autoEnableBackups)
        } else {
            return autoEnableBackupsAutoEnableBackupsReturnValue
        }
    }

    //MARK: - autoEnableCrossSigning

    var autoEnableCrossSigningAutoEnableCrossSigningUnderlyingCallsCount = 0
    open var autoEnableCrossSigningAutoEnableCrossSigningCallsCount: Int {
        get {
            if Thread.isMainThread {
                return autoEnableCrossSigningAutoEnableCrossSigningUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = autoEnableCrossSigningAutoEnableCrossSigningUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                autoEnableCrossSigningAutoEnableCrossSigningUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    autoEnableCrossSigningAutoEnableCrossSigningUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var autoEnableCrossSigningAutoEnableCrossSigningCalled: Bool {
        return autoEnableCrossSigningAutoEnableCrossSigningCallsCount > 0
    }
    open var autoEnableCrossSigningAutoEnableCrossSigningReceivedAutoEnableCrossSigning: Bool?
    open var autoEnableCrossSigningAutoEnableCrossSigningReceivedInvocations: [Bool] = []

    var autoEnableCrossSigningAutoEnableCrossSigningUnderlyingReturnValue: ClientBuilder!
    open var autoEnableCrossSigningAutoEnableCrossSigningReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return autoEnableCrossSigningAutoEnableCrossSigningUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = autoEnableCrossSigningAutoEnableCrossSigningUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                autoEnableCrossSigningAutoEnableCrossSigningUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    autoEnableCrossSigningAutoEnableCrossSigningUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var autoEnableCrossSigningAutoEnableCrossSigningClosure: ((Bool) -> ClientBuilder)?

    open override func autoEnableCrossSigning(autoEnableCrossSigning: Bool) -> ClientBuilder {
        autoEnableCrossSigningAutoEnableCrossSigningCallsCount += 1
        autoEnableCrossSigningAutoEnableCrossSigningReceivedAutoEnableCrossSigning = autoEnableCrossSigning
        DispatchQueue.main.async {
            self.autoEnableCrossSigningAutoEnableCrossSigningReceivedInvocations.append(autoEnableCrossSigning)
        }
        if let autoEnableCrossSigningAutoEnableCrossSigningClosure = autoEnableCrossSigningAutoEnableCrossSigningClosure {
            return autoEnableCrossSigningAutoEnableCrossSigningClosure(autoEnableCrossSigning)
        } else {
            return autoEnableCrossSigningAutoEnableCrossSigningReturnValue
        }
    }

    //MARK: - backupDownloadStrategy

    var backupDownloadStrategyBackupDownloadStrategyUnderlyingCallsCount = 0
    open var backupDownloadStrategyBackupDownloadStrategyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return backupDownloadStrategyBackupDownloadStrategyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = backupDownloadStrategyBackupDownloadStrategyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                backupDownloadStrategyBackupDownloadStrategyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    backupDownloadStrategyBackupDownloadStrategyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var backupDownloadStrategyBackupDownloadStrategyCalled: Bool {
        return backupDownloadStrategyBackupDownloadStrategyCallsCount > 0
    }
    open var backupDownloadStrategyBackupDownloadStrategyReceivedBackupDownloadStrategy: BackupDownloadStrategy?
    open var backupDownloadStrategyBackupDownloadStrategyReceivedInvocations: [BackupDownloadStrategy] = []

    var backupDownloadStrategyBackupDownloadStrategyUnderlyingReturnValue: ClientBuilder!
    open var backupDownloadStrategyBackupDownloadStrategyReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return backupDownloadStrategyBackupDownloadStrategyUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = backupDownloadStrategyBackupDownloadStrategyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                backupDownloadStrategyBackupDownloadStrategyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    backupDownloadStrategyBackupDownloadStrategyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var backupDownloadStrategyBackupDownloadStrategyClosure: ((BackupDownloadStrategy) -> ClientBuilder)?

    open override func backupDownloadStrategy(backupDownloadStrategy: BackupDownloadStrategy) -> ClientBuilder {
        backupDownloadStrategyBackupDownloadStrategyCallsCount += 1
        backupDownloadStrategyBackupDownloadStrategyReceivedBackupDownloadStrategy = backupDownloadStrategy
        DispatchQueue.main.async {
            self.backupDownloadStrategyBackupDownloadStrategyReceivedInvocations.append(backupDownloadStrategy)
        }
        if let backupDownloadStrategyBackupDownloadStrategyClosure = backupDownloadStrategyBackupDownloadStrategyClosure {
            return backupDownloadStrategyBackupDownloadStrategyClosure(backupDownloadStrategy)
        } else {
            return backupDownloadStrategyBackupDownloadStrategyReturnValue
        }
    }

    //MARK: - build

    open var buildThrowableError: Error?
    var buildUnderlyingCallsCount = 0
    open var buildCallsCount: Int {
        get {
            if Thread.isMainThread {
                return buildUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = buildUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                buildUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    buildUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var buildCalled: Bool {
        return buildCallsCount > 0
    }

    var buildUnderlyingReturnValue: Client!
    open var buildReturnValue: Client! {
        get {
            if Thread.isMainThread {
                return buildUnderlyingReturnValue
            } else {
                var returnValue: Client? = nil
                DispatchQueue.main.sync {
                    returnValue = buildUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                buildUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    buildUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var buildClosure: (() async throws -> Client)?

    open override func build() async throws -> Client {
        if let error = buildThrowableError {
            throw error
        }
        buildCallsCount += 1
        if let buildClosure = buildClosure {
            return try await buildClosure()
        } else {
            return buildReturnValue
        }
    }

    //MARK: - crossProcessStoreLocksHolderName

    var crossProcessStoreLocksHolderNameHolderNameUnderlyingCallsCount = 0
    open var crossProcessStoreLocksHolderNameHolderNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return crossProcessStoreLocksHolderNameHolderNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = crossProcessStoreLocksHolderNameHolderNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                crossProcessStoreLocksHolderNameHolderNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    crossProcessStoreLocksHolderNameHolderNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var crossProcessStoreLocksHolderNameHolderNameCalled: Bool {
        return crossProcessStoreLocksHolderNameHolderNameCallsCount > 0
    }
    open var crossProcessStoreLocksHolderNameHolderNameReceivedHolderName: String?
    open var crossProcessStoreLocksHolderNameHolderNameReceivedInvocations: [String] = []

    var crossProcessStoreLocksHolderNameHolderNameUnderlyingReturnValue: ClientBuilder!
    open var crossProcessStoreLocksHolderNameHolderNameReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return crossProcessStoreLocksHolderNameHolderNameUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = crossProcessStoreLocksHolderNameHolderNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                crossProcessStoreLocksHolderNameHolderNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    crossProcessStoreLocksHolderNameHolderNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var crossProcessStoreLocksHolderNameHolderNameClosure: ((String) -> ClientBuilder)?

    open override func crossProcessStoreLocksHolderName(holderName: String) -> ClientBuilder {
        crossProcessStoreLocksHolderNameHolderNameCallsCount += 1
        crossProcessStoreLocksHolderNameHolderNameReceivedHolderName = holderName
        DispatchQueue.main.async {
            self.crossProcessStoreLocksHolderNameHolderNameReceivedInvocations.append(holderName)
        }
        if let crossProcessStoreLocksHolderNameHolderNameClosure = crossProcessStoreLocksHolderNameHolderNameClosure {
            return crossProcessStoreLocksHolderNameHolderNameClosure(holderName)
        } else {
            return crossProcessStoreLocksHolderNameHolderNameReturnValue
        }
    }

    //MARK: - decryptionSettings

    var decryptionSettingsDecryptionSettingsUnderlyingCallsCount = 0
    open var decryptionSettingsDecryptionSettingsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return decryptionSettingsDecryptionSettingsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = decryptionSettingsDecryptionSettingsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                decryptionSettingsDecryptionSettingsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    decryptionSettingsDecryptionSettingsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var decryptionSettingsDecryptionSettingsCalled: Bool {
        return decryptionSettingsDecryptionSettingsCallsCount > 0
    }
    open var decryptionSettingsDecryptionSettingsReceivedDecryptionSettings: DecryptionSettings?
    open var decryptionSettingsDecryptionSettingsReceivedInvocations: [DecryptionSettings] = []

    var decryptionSettingsDecryptionSettingsUnderlyingReturnValue: ClientBuilder!
    open var decryptionSettingsDecryptionSettingsReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return decryptionSettingsDecryptionSettingsUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = decryptionSettingsDecryptionSettingsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                decryptionSettingsDecryptionSettingsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    decryptionSettingsDecryptionSettingsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var decryptionSettingsDecryptionSettingsClosure: ((DecryptionSettings) -> ClientBuilder)?

    open override func decryptionSettings(decryptionSettings: DecryptionSettings) -> ClientBuilder {
        decryptionSettingsDecryptionSettingsCallsCount += 1
        decryptionSettingsDecryptionSettingsReceivedDecryptionSettings = decryptionSettings
        DispatchQueue.main.async {
            self.decryptionSettingsDecryptionSettingsReceivedInvocations.append(decryptionSettings)
        }
        if let decryptionSettingsDecryptionSettingsClosure = decryptionSettingsDecryptionSettingsClosure {
            return decryptionSettingsDecryptionSettingsClosure(decryptionSettings)
        } else {
            return decryptionSettingsDecryptionSettingsReturnValue
        }
    }

    //MARK: - disableAutomaticTokenRefresh

    var disableAutomaticTokenRefreshUnderlyingCallsCount = 0
    open var disableAutomaticTokenRefreshCallsCount: Int {
        get {
            if Thread.isMainThread {
                return disableAutomaticTokenRefreshUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = disableAutomaticTokenRefreshUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableAutomaticTokenRefreshUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    disableAutomaticTokenRefreshUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var disableAutomaticTokenRefreshCalled: Bool {
        return disableAutomaticTokenRefreshCallsCount > 0
    }

    var disableAutomaticTokenRefreshUnderlyingReturnValue: ClientBuilder!
    open var disableAutomaticTokenRefreshReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return disableAutomaticTokenRefreshUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = disableAutomaticTokenRefreshUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableAutomaticTokenRefreshUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    disableAutomaticTokenRefreshUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var disableAutomaticTokenRefreshClosure: (() -> ClientBuilder)?

    open override func disableAutomaticTokenRefresh() -> ClientBuilder {
        disableAutomaticTokenRefreshCallsCount += 1
        if let disableAutomaticTokenRefreshClosure = disableAutomaticTokenRefreshClosure {
            return disableAutomaticTokenRefreshClosure()
        } else {
            return disableAutomaticTokenRefreshReturnValue
        }
    }

    //MARK: - disableBuiltInRootCertificates

    var disableBuiltInRootCertificatesUnderlyingCallsCount = 0
    open var disableBuiltInRootCertificatesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return disableBuiltInRootCertificatesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = disableBuiltInRootCertificatesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableBuiltInRootCertificatesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    disableBuiltInRootCertificatesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var disableBuiltInRootCertificatesCalled: Bool {
        return disableBuiltInRootCertificatesCallsCount > 0
    }

    var disableBuiltInRootCertificatesUnderlyingReturnValue: ClientBuilder!
    open var disableBuiltInRootCertificatesReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return disableBuiltInRootCertificatesUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = disableBuiltInRootCertificatesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableBuiltInRootCertificatesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    disableBuiltInRootCertificatesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var disableBuiltInRootCertificatesClosure: (() -> ClientBuilder)?

    open override func disableBuiltInRootCertificates() -> ClientBuilder {
        disableBuiltInRootCertificatesCallsCount += 1
        if let disableBuiltInRootCertificatesClosure = disableBuiltInRootCertificatesClosure {
            return disableBuiltInRootCertificatesClosure()
        } else {
            return disableBuiltInRootCertificatesReturnValue
        }
    }

    //MARK: - disableSslVerification

    var disableSslVerificationUnderlyingCallsCount = 0
    open var disableSslVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return disableSslVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = disableSslVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableSslVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    disableSslVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var disableSslVerificationCalled: Bool {
        return disableSslVerificationCallsCount > 0
    }

    var disableSslVerificationUnderlyingReturnValue: ClientBuilder!
    open var disableSslVerificationReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return disableSslVerificationUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = disableSslVerificationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableSslVerificationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    disableSslVerificationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var disableSslVerificationClosure: (() -> ClientBuilder)?

    open override func disableSslVerification() -> ClientBuilder {
        disableSslVerificationCallsCount += 1
        if let disableSslVerificationClosure = disableSslVerificationClosure {
            return disableSslVerificationClosure()
        } else {
            return disableSslVerificationReturnValue
        }
    }

    //MARK: - enableOidcRefreshLock

    var enableOidcRefreshLockUnderlyingCallsCount = 0
    open var enableOidcRefreshLockCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enableOidcRefreshLockUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enableOidcRefreshLockUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableOidcRefreshLockUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enableOidcRefreshLockUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var enableOidcRefreshLockCalled: Bool {
        return enableOidcRefreshLockCallsCount > 0
    }

    var enableOidcRefreshLockUnderlyingReturnValue: ClientBuilder!
    open var enableOidcRefreshLockReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return enableOidcRefreshLockUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = enableOidcRefreshLockUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableOidcRefreshLockUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    enableOidcRefreshLockUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var enableOidcRefreshLockClosure: (() -> ClientBuilder)?

    open override func enableOidcRefreshLock() -> ClientBuilder {
        enableOidcRefreshLockCallsCount += 1
        if let enableOidcRefreshLockClosure = enableOidcRefreshLockClosure {
            return enableOidcRefreshLockClosure()
        } else {
            return enableOidcRefreshLockReturnValue
        }
    }

    //MARK: - enableShareHistoryOnInvite

    var enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingCallsCount = 0
    open var enableShareHistoryOnInviteEnableShareHistoryOnInviteCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var enableShareHistoryOnInviteEnableShareHistoryOnInviteCalled: Bool {
        return enableShareHistoryOnInviteEnableShareHistoryOnInviteCallsCount > 0
    }
    open var enableShareHistoryOnInviteEnableShareHistoryOnInviteReceivedEnableShareHistoryOnInvite: Bool?
    open var enableShareHistoryOnInviteEnableShareHistoryOnInviteReceivedInvocations: [Bool] = []

    var enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingReturnValue: ClientBuilder!
    open var enableShareHistoryOnInviteEnableShareHistoryOnInviteReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    enableShareHistoryOnInviteEnableShareHistoryOnInviteUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var enableShareHistoryOnInviteEnableShareHistoryOnInviteClosure: ((Bool) -> ClientBuilder)?

    open override func enableShareHistoryOnInvite(enableShareHistoryOnInvite: Bool) -> ClientBuilder {
        enableShareHistoryOnInviteEnableShareHistoryOnInviteCallsCount += 1
        enableShareHistoryOnInviteEnableShareHistoryOnInviteReceivedEnableShareHistoryOnInvite = enableShareHistoryOnInvite
        DispatchQueue.main.async {
            self.enableShareHistoryOnInviteEnableShareHistoryOnInviteReceivedInvocations.append(enableShareHistoryOnInvite)
        }
        if let enableShareHistoryOnInviteEnableShareHistoryOnInviteClosure = enableShareHistoryOnInviteEnableShareHistoryOnInviteClosure {
            return enableShareHistoryOnInviteEnableShareHistoryOnInviteClosure(enableShareHistoryOnInvite)
        } else {
            return enableShareHistoryOnInviteEnableShareHistoryOnInviteReturnValue
        }
    }

    //MARK: - homeserverUrl

    var homeserverUrlUrlUnderlyingCallsCount = 0
    open var homeserverUrlUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return homeserverUrlUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = homeserverUrlUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                homeserverUrlUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    homeserverUrlUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var homeserverUrlUrlCalled: Bool {
        return homeserverUrlUrlCallsCount > 0
    }
    open var homeserverUrlUrlReceivedUrl: String?
    open var homeserverUrlUrlReceivedInvocations: [String] = []

    var homeserverUrlUrlUnderlyingReturnValue: ClientBuilder!
    open var homeserverUrlUrlReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return homeserverUrlUrlUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = homeserverUrlUrlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                homeserverUrlUrlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    homeserverUrlUrlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var homeserverUrlUrlClosure: ((String) -> ClientBuilder)?

    open override func homeserverUrl(url: String) -> ClientBuilder {
        homeserverUrlUrlCallsCount += 1
        homeserverUrlUrlReceivedUrl = url
        DispatchQueue.main.async {
            self.homeserverUrlUrlReceivedInvocations.append(url)
        }
        if let homeserverUrlUrlClosure = homeserverUrlUrlClosure {
            return homeserverUrlUrlClosure(url)
        } else {
            return homeserverUrlUrlReturnValue
        }
    }

    //MARK: - proxy

    var proxyUrlUnderlyingCallsCount = 0
    open var proxyUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return proxyUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = proxyUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                proxyUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    proxyUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var proxyUrlCalled: Bool {
        return proxyUrlCallsCount > 0
    }
    open var proxyUrlReceivedUrl: String?
    open var proxyUrlReceivedInvocations: [String] = []

    var proxyUrlUnderlyingReturnValue: ClientBuilder!
    open var proxyUrlReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return proxyUrlUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = proxyUrlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                proxyUrlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    proxyUrlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var proxyUrlClosure: ((String) -> ClientBuilder)?

    open override func proxy(url: String) -> ClientBuilder {
        proxyUrlCallsCount += 1
        proxyUrlReceivedUrl = url
        DispatchQueue.main.async {
            self.proxyUrlReceivedInvocations.append(url)
        }
        if let proxyUrlClosure = proxyUrlClosure {
            return proxyUrlClosure(url)
        } else {
            return proxyUrlReturnValue
        }
    }

    //MARK: - requestConfig

    var requestConfigConfigUnderlyingCallsCount = 0
    open var requestConfigConfigCallsCount: Int {
        get {
            if Thread.isMainThread {
                return requestConfigConfigUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = requestConfigConfigUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestConfigConfigUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    requestConfigConfigUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var requestConfigConfigCalled: Bool {
        return requestConfigConfigCallsCount > 0
    }
    open var requestConfigConfigReceivedConfig: RequestConfig?
    open var requestConfigConfigReceivedInvocations: [RequestConfig] = []

    var requestConfigConfigUnderlyingReturnValue: ClientBuilder!
    open var requestConfigConfigReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return requestConfigConfigUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = requestConfigConfigUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestConfigConfigUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    requestConfigConfigUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var requestConfigConfigClosure: ((RequestConfig) -> ClientBuilder)?

    open override func requestConfig(config: RequestConfig) -> ClientBuilder {
        requestConfigConfigCallsCount += 1
        requestConfigConfigReceivedConfig = config
        DispatchQueue.main.async {
            self.requestConfigConfigReceivedInvocations.append(config)
        }
        if let requestConfigConfigClosure = requestConfigConfigClosure {
            return requestConfigConfigClosure(config)
        } else {
            return requestConfigConfigReturnValue
        }
    }

    //MARK: - roomKeyRecipientStrategy

    var roomKeyRecipientStrategyStrategyUnderlyingCallsCount = 0
    open var roomKeyRecipientStrategyStrategyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomKeyRecipientStrategyStrategyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomKeyRecipientStrategyStrategyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomKeyRecipientStrategyStrategyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomKeyRecipientStrategyStrategyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var roomKeyRecipientStrategyStrategyCalled: Bool {
        return roomKeyRecipientStrategyStrategyCallsCount > 0
    }
    open var roomKeyRecipientStrategyStrategyReceivedStrategy: CollectStrategy?
    open var roomKeyRecipientStrategyStrategyReceivedInvocations: [CollectStrategy] = []

    var roomKeyRecipientStrategyStrategyUnderlyingReturnValue: ClientBuilder!
    open var roomKeyRecipientStrategyStrategyReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return roomKeyRecipientStrategyStrategyUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = roomKeyRecipientStrategyStrategyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomKeyRecipientStrategyStrategyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomKeyRecipientStrategyStrategyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var roomKeyRecipientStrategyStrategyClosure: ((CollectStrategy) -> ClientBuilder)?

    open override func roomKeyRecipientStrategy(strategy: CollectStrategy) -> ClientBuilder {
        roomKeyRecipientStrategyStrategyCallsCount += 1
        roomKeyRecipientStrategyStrategyReceivedStrategy = strategy
        DispatchQueue.main.async {
            self.roomKeyRecipientStrategyStrategyReceivedInvocations.append(strategy)
        }
        if let roomKeyRecipientStrategyStrategyClosure = roomKeyRecipientStrategyStrategyClosure {
            return roomKeyRecipientStrategyStrategyClosure(strategy)
        } else {
            return roomKeyRecipientStrategyStrategyReturnValue
        }
    }

    //MARK: - serverName

    var serverNameServerNameUnderlyingCallsCount = 0
    open var serverNameServerNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return serverNameServerNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = serverNameServerNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                serverNameServerNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    serverNameServerNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var serverNameServerNameCalled: Bool {
        return serverNameServerNameCallsCount > 0
    }
    open var serverNameServerNameReceivedServerName: String?
    open var serverNameServerNameReceivedInvocations: [String] = []

    var serverNameServerNameUnderlyingReturnValue: ClientBuilder!
    open var serverNameServerNameReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return serverNameServerNameUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = serverNameServerNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                serverNameServerNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    serverNameServerNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var serverNameServerNameClosure: ((String) -> ClientBuilder)?

    open override func serverName(serverName: String) -> ClientBuilder {
        serverNameServerNameCallsCount += 1
        serverNameServerNameReceivedServerName = serverName
        DispatchQueue.main.async {
            self.serverNameServerNameReceivedInvocations.append(serverName)
        }
        if let serverNameServerNameClosure = serverNameServerNameClosure {
            return serverNameServerNameClosure(serverName)
        } else {
            return serverNameServerNameReturnValue
        }
    }

    //MARK: - serverNameOrHomeserverUrl

    var serverNameOrHomeserverUrlServerNameOrUrlUnderlyingCallsCount = 0
    open var serverNameOrHomeserverUrlServerNameOrUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return serverNameOrHomeserverUrlServerNameOrUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = serverNameOrHomeserverUrlServerNameOrUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                serverNameOrHomeserverUrlServerNameOrUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    serverNameOrHomeserverUrlServerNameOrUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var serverNameOrHomeserverUrlServerNameOrUrlCalled: Bool {
        return serverNameOrHomeserverUrlServerNameOrUrlCallsCount > 0
    }
    open var serverNameOrHomeserverUrlServerNameOrUrlReceivedServerNameOrUrl: String?
    open var serverNameOrHomeserverUrlServerNameOrUrlReceivedInvocations: [String] = []

    var serverNameOrHomeserverUrlServerNameOrUrlUnderlyingReturnValue: ClientBuilder!
    open var serverNameOrHomeserverUrlServerNameOrUrlReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return serverNameOrHomeserverUrlServerNameOrUrlUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = serverNameOrHomeserverUrlServerNameOrUrlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                serverNameOrHomeserverUrlServerNameOrUrlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    serverNameOrHomeserverUrlServerNameOrUrlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var serverNameOrHomeserverUrlServerNameOrUrlClosure: ((String) -> ClientBuilder)?

    open override func serverNameOrHomeserverUrl(serverNameOrUrl: String) -> ClientBuilder {
        serverNameOrHomeserverUrlServerNameOrUrlCallsCount += 1
        serverNameOrHomeserverUrlServerNameOrUrlReceivedServerNameOrUrl = serverNameOrUrl
        DispatchQueue.main.async {
            self.serverNameOrHomeserverUrlServerNameOrUrlReceivedInvocations.append(serverNameOrUrl)
        }
        if let serverNameOrHomeserverUrlServerNameOrUrlClosure = serverNameOrHomeserverUrlServerNameOrUrlClosure {
            return serverNameOrHomeserverUrlServerNameOrUrlClosure(serverNameOrUrl)
        } else {
            return serverNameOrHomeserverUrlServerNameOrUrlReturnValue
        }
    }

    //MARK: - sessionCacheSize

    var sessionCacheSizeCacheSizeUnderlyingCallsCount = 0
    open var sessionCacheSizeCacheSizeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sessionCacheSizeCacheSizeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionCacheSizeCacheSizeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionCacheSizeCacheSizeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionCacheSizeCacheSizeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sessionCacheSizeCacheSizeCalled: Bool {
        return sessionCacheSizeCacheSizeCallsCount > 0
    }
    open var sessionCacheSizeCacheSizeReceivedCacheSize: UInt32?
    open var sessionCacheSizeCacheSizeReceivedInvocations: [UInt32?] = []

    var sessionCacheSizeCacheSizeUnderlyingReturnValue: ClientBuilder!
    open var sessionCacheSizeCacheSizeReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return sessionCacheSizeCacheSizeUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionCacheSizeCacheSizeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionCacheSizeCacheSizeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionCacheSizeCacheSizeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sessionCacheSizeCacheSizeClosure: ((UInt32?) -> ClientBuilder)?

    open override func sessionCacheSize(cacheSize: UInt32?) -> ClientBuilder {
        sessionCacheSizeCacheSizeCallsCount += 1
        sessionCacheSizeCacheSizeReceivedCacheSize = cacheSize
        DispatchQueue.main.async {
            self.sessionCacheSizeCacheSizeReceivedInvocations.append(cacheSize)
        }
        if let sessionCacheSizeCacheSizeClosure = sessionCacheSizeCacheSizeClosure {
            return sessionCacheSizeCacheSizeClosure(cacheSize)
        } else {
            return sessionCacheSizeCacheSizeReturnValue
        }
    }

    //MARK: - sessionJournalSizeLimit

    var sessionJournalSizeLimitLimitUnderlyingCallsCount = 0
    open var sessionJournalSizeLimitLimitCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sessionJournalSizeLimitLimitUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionJournalSizeLimitLimitUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionJournalSizeLimitLimitUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionJournalSizeLimitLimitUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sessionJournalSizeLimitLimitCalled: Bool {
        return sessionJournalSizeLimitLimitCallsCount > 0
    }
    open var sessionJournalSizeLimitLimitReceivedLimit: UInt32?
    open var sessionJournalSizeLimitLimitReceivedInvocations: [UInt32?] = []

    var sessionJournalSizeLimitLimitUnderlyingReturnValue: ClientBuilder!
    open var sessionJournalSizeLimitLimitReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return sessionJournalSizeLimitLimitUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionJournalSizeLimitLimitUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionJournalSizeLimitLimitUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionJournalSizeLimitLimitUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sessionJournalSizeLimitLimitClosure: ((UInt32?) -> ClientBuilder)?

    open override func sessionJournalSizeLimit(limit: UInt32?) -> ClientBuilder {
        sessionJournalSizeLimitLimitCallsCount += 1
        sessionJournalSizeLimitLimitReceivedLimit = limit
        DispatchQueue.main.async {
            self.sessionJournalSizeLimitLimitReceivedInvocations.append(limit)
        }
        if let sessionJournalSizeLimitLimitClosure = sessionJournalSizeLimitLimitClosure {
            return sessionJournalSizeLimitLimitClosure(limit)
        } else {
            return sessionJournalSizeLimitLimitReturnValue
        }
    }

    //MARK: - sessionPassphrase

    var sessionPassphrasePassphraseUnderlyingCallsCount = 0
    open var sessionPassphrasePassphraseCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sessionPassphrasePassphraseUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionPassphrasePassphraseUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionPassphrasePassphraseUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionPassphrasePassphraseUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sessionPassphrasePassphraseCalled: Bool {
        return sessionPassphrasePassphraseCallsCount > 0
    }
    open var sessionPassphrasePassphraseReceivedPassphrase: String?
    open var sessionPassphrasePassphraseReceivedInvocations: [String?] = []

    var sessionPassphrasePassphraseUnderlyingReturnValue: ClientBuilder!
    open var sessionPassphrasePassphraseReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return sessionPassphrasePassphraseUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionPassphrasePassphraseUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionPassphrasePassphraseUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionPassphrasePassphraseUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sessionPassphrasePassphraseClosure: ((String?) -> ClientBuilder)?

    open override func sessionPassphrase(passphrase: String?) -> ClientBuilder {
        sessionPassphrasePassphraseCallsCount += 1
        sessionPassphrasePassphraseReceivedPassphrase = passphrase
        DispatchQueue.main.async {
            self.sessionPassphrasePassphraseReceivedInvocations.append(passphrase)
        }
        if let sessionPassphrasePassphraseClosure = sessionPassphrasePassphraseClosure {
            return sessionPassphrasePassphraseClosure(passphrase)
        } else {
            return sessionPassphrasePassphraseReturnValue
        }
    }

    //MARK: - sessionPaths

    var sessionPathsDataPathCachePathUnderlyingCallsCount = 0
    open var sessionPathsDataPathCachePathCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sessionPathsDataPathCachePathUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionPathsDataPathCachePathUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionPathsDataPathCachePathUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionPathsDataPathCachePathUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sessionPathsDataPathCachePathCalled: Bool {
        return sessionPathsDataPathCachePathCallsCount > 0
    }
    open var sessionPathsDataPathCachePathReceivedArguments: (dataPath: String, cachePath: String)?
    open var sessionPathsDataPathCachePathReceivedInvocations: [(dataPath: String, cachePath: String)] = []

    var sessionPathsDataPathCachePathUnderlyingReturnValue: ClientBuilder!
    open var sessionPathsDataPathCachePathReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return sessionPathsDataPathCachePathUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionPathsDataPathCachePathUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionPathsDataPathCachePathUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionPathsDataPathCachePathUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sessionPathsDataPathCachePathClosure: ((String, String) -> ClientBuilder)?

    open override func sessionPaths(dataPath: String, cachePath: String) -> ClientBuilder {
        sessionPathsDataPathCachePathCallsCount += 1
        sessionPathsDataPathCachePathReceivedArguments = (dataPath: dataPath, cachePath: cachePath)
        DispatchQueue.main.async {
            self.sessionPathsDataPathCachePathReceivedInvocations.append((dataPath: dataPath, cachePath: cachePath))
        }
        if let sessionPathsDataPathCachePathClosure = sessionPathsDataPathCachePathClosure {
            return sessionPathsDataPathCachePathClosure(dataPath, cachePath)
        } else {
            return sessionPathsDataPathCachePathReturnValue
        }
    }

    //MARK: - sessionPoolMaxSize

    var sessionPoolMaxSizePoolMaxSizeUnderlyingCallsCount = 0
    open var sessionPoolMaxSizePoolMaxSizeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sessionPoolMaxSizePoolMaxSizeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionPoolMaxSizePoolMaxSizeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionPoolMaxSizePoolMaxSizeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionPoolMaxSizePoolMaxSizeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sessionPoolMaxSizePoolMaxSizeCalled: Bool {
        return sessionPoolMaxSizePoolMaxSizeCallsCount > 0
    }
    open var sessionPoolMaxSizePoolMaxSizeReceivedPoolMaxSize: UInt32?
    open var sessionPoolMaxSizePoolMaxSizeReceivedInvocations: [UInt32?] = []

    var sessionPoolMaxSizePoolMaxSizeUnderlyingReturnValue: ClientBuilder!
    open var sessionPoolMaxSizePoolMaxSizeReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return sessionPoolMaxSizePoolMaxSizeUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionPoolMaxSizePoolMaxSizeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionPoolMaxSizePoolMaxSizeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionPoolMaxSizePoolMaxSizeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sessionPoolMaxSizePoolMaxSizeClosure: ((UInt32?) -> ClientBuilder)?

    open override func sessionPoolMaxSize(poolMaxSize: UInt32?) -> ClientBuilder {
        sessionPoolMaxSizePoolMaxSizeCallsCount += 1
        sessionPoolMaxSizePoolMaxSizeReceivedPoolMaxSize = poolMaxSize
        DispatchQueue.main.async {
            self.sessionPoolMaxSizePoolMaxSizeReceivedInvocations.append(poolMaxSize)
        }
        if let sessionPoolMaxSizePoolMaxSizeClosure = sessionPoolMaxSizePoolMaxSizeClosure {
            return sessionPoolMaxSizePoolMaxSizeClosure(poolMaxSize)
        } else {
            return sessionPoolMaxSizePoolMaxSizeReturnValue
        }
    }

    //MARK: - setSessionDelegate

    var setSessionDelegateSessionDelegateUnderlyingCallsCount = 0
    open var setSessionDelegateSessionDelegateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setSessionDelegateSessionDelegateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setSessionDelegateSessionDelegateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setSessionDelegateSessionDelegateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setSessionDelegateSessionDelegateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setSessionDelegateSessionDelegateCalled: Bool {
        return setSessionDelegateSessionDelegateCallsCount > 0
    }
    open var setSessionDelegateSessionDelegateReceivedSessionDelegate: ClientSessionDelegate?
    open var setSessionDelegateSessionDelegateReceivedInvocations: [ClientSessionDelegate] = []

    var setSessionDelegateSessionDelegateUnderlyingReturnValue: ClientBuilder!
    open var setSessionDelegateSessionDelegateReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return setSessionDelegateSessionDelegateUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = setSessionDelegateSessionDelegateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setSessionDelegateSessionDelegateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    setSessionDelegateSessionDelegateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var setSessionDelegateSessionDelegateClosure: ((ClientSessionDelegate) -> ClientBuilder)?

    open override func setSessionDelegate(sessionDelegate: ClientSessionDelegate) -> ClientBuilder {
        setSessionDelegateSessionDelegateCallsCount += 1
        setSessionDelegateSessionDelegateReceivedSessionDelegate = sessionDelegate
        DispatchQueue.main.async {
            self.setSessionDelegateSessionDelegateReceivedInvocations.append(sessionDelegate)
        }
        if let setSessionDelegateSessionDelegateClosure = setSessionDelegateSessionDelegateClosure {
            return setSessionDelegateSessionDelegateClosure(sessionDelegate)
        } else {
            return setSessionDelegateSessionDelegateReturnValue
        }
    }

    //MARK: - slidingSyncVersionBuilder

    var slidingSyncVersionBuilderVersionBuilderUnderlyingCallsCount = 0
    open var slidingSyncVersionBuilderVersionBuilderCallsCount: Int {
        get {
            if Thread.isMainThread {
                return slidingSyncVersionBuilderVersionBuilderUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = slidingSyncVersionBuilderVersionBuilderUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                slidingSyncVersionBuilderVersionBuilderUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    slidingSyncVersionBuilderVersionBuilderUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var slidingSyncVersionBuilderVersionBuilderCalled: Bool {
        return slidingSyncVersionBuilderVersionBuilderCallsCount > 0
    }
    open var slidingSyncVersionBuilderVersionBuilderReceivedVersionBuilder: SlidingSyncVersionBuilder?
    open var slidingSyncVersionBuilderVersionBuilderReceivedInvocations: [SlidingSyncVersionBuilder] = []

    var slidingSyncVersionBuilderVersionBuilderUnderlyingReturnValue: ClientBuilder!
    open var slidingSyncVersionBuilderVersionBuilderReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return slidingSyncVersionBuilderVersionBuilderUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = slidingSyncVersionBuilderVersionBuilderUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                slidingSyncVersionBuilderVersionBuilderUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    slidingSyncVersionBuilderVersionBuilderUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var slidingSyncVersionBuilderVersionBuilderClosure: ((SlidingSyncVersionBuilder) -> ClientBuilder)?

    open override func slidingSyncVersionBuilder(versionBuilder: SlidingSyncVersionBuilder) -> ClientBuilder {
        slidingSyncVersionBuilderVersionBuilderCallsCount += 1
        slidingSyncVersionBuilderVersionBuilderReceivedVersionBuilder = versionBuilder
        DispatchQueue.main.async {
            self.slidingSyncVersionBuilderVersionBuilderReceivedInvocations.append(versionBuilder)
        }
        if let slidingSyncVersionBuilderVersionBuilderClosure = slidingSyncVersionBuilderVersionBuilderClosure {
            return slidingSyncVersionBuilderVersionBuilderClosure(versionBuilder)
        } else {
            return slidingSyncVersionBuilderVersionBuilderReturnValue
        }
    }

    //MARK: - systemIsMemoryConstrained

    var systemIsMemoryConstrainedUnderlyingCallsCount = 0
    open var systemIsMemoryConstrainedCallsCount: Int {
        get {
            if Thread.isMainThread {
                return systemIsMemoryConstrainedUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = systemIsMemoryConstrainedUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                systemIsMemoryConstrainedUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    systemIsMemoryConstrainedUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var systemIsMemoryConstrainedCalled: Bool {
        return systemIsMemoryConstrainedCallsCount > 0
    }

    var systemIsMemoryConstrainedUnderlyingReturnValue: ClientBuilder!
    open var systemIsMemoryConstrainedReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return systemIsMemoryConstrainedUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = systemIsMemoryConstrainedUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                systemIsMemoryConstrainedUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    systemIsMemoryConstrainedUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var systemIsMemoryConstrainedClosure: (() -> ClientBuilder)?

    open override func systemIsMemoryConstrained() -> ClientBuilder {
        systemIsMemoryConstrainedCallsCount += 1
        if let systemIsMemoryConstrainedClosure = systemIsMemoryConstrainedClosure {
            return systemIsMemoryConstrainedClosure()
        } else {
            return systemIsMemoryConstrainedReturnValue
        }
    }

    //MARK: - threadsEnabled

    var threadsEnabledEnabledUnderlyingCallsCount = 0
    open var threadsEnabledEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return threadsEnabledEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = threadsEnabledEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                threadsEnabledEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    threadsEnabledEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var threadsEnabledEnabledCalled: Bool {
        return threadsEnabledEnabledCallsCount > 0
    }
    open var threadsEnabledEnabledReceivedEnabled: Bool?
    open var threadsEnabledEnabledReceivedInvocations: [Bool] = []

    var threadsEnabledEnabledUnderlyingReturnValue: ClientBuilder!
    open var threadsEnabledEnabledReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return threadsEnabledEnabledUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = threadsEnabledEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                threadsEnabledEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    threadsEnabledEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var threadsEnabledEnabledClosure: ((Bool) -> ClientBuilder)?

    open override func threadsEnabled(enabled: Bool) -> ClientBuilder {
        threadsEnabledEnabledCallsCount += 1
        threadsEnabledEnabledReceivedEnabled = enabled
        DispatchQueue.main.async {
            self.threadsEnabledEnabledReceivedInvocations.append(enabled)
        }
        if let threadsEnabledEnabledClosure = threadsEnabledEnabledClosure {
            return threadsEnabledEnabledClosure(enabled)
        } else {
            return threadsEnabledEnabledReturnValue
        }
    }

    //MARK: - userAgent

    var userAgentUserAgentUnderlyingCallsCount = 0
    open var userAgentUserAgentCallsCount: Int {
        get {
            if Thread.isMainThread {
                return userAgentUserAgentUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = userAgentUserAgentUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userAgentUserAgentUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    userAgentUserAgentUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var userAgentUserAgentCalled: Bool {
        return userAgentUserAgentCallsCount > 0
    }
    open var userAgentUserAgentReceivedUserAgent: String?
    open var userAgentUserAgentReceivedInvocations: [String] = []

    var userAgentUserAgentUnderlyingReturnValue: ClientBuilder!
    open var userAgentUserAgentReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return userAgentUserAgentUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = userAgentUserAgentUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userAgentUserAgentUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    userAgentUserAgentUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var userAgentUserAgentClosure: ((String) -> ClientBuilder)?

    open override func userAgent(userAgent: String) -> ClientBuilder {
        userAgentUserAgentCallsCount += 1
        userAgentUserAgentReceivedUserAgent = userAgent
        DispatchQueue.main.async {
            self.userAgentUserAgentReceivedInvocations.append(userAgent)
        }
        if let userAgentUserAgentClosure = userAgentUserAgentClosure {
            return userAgentUserAgentClosure(userAgent)
        } else {
            return userAgentUserAgentReturnValue
        }
    }

    //MARK: - username

    var usernameUsernameUnderlyingCallsCount = 0
    open var usernameUsernameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return usernameUsernameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = usernameUsernameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                usernameUsernameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    usernameUsernameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var usernameUsernameCalled: Bool {
        return usernameUsernameCallsCount > 0
    }
    open var usernameUsernameReceivedUsername: String?
    open var usernameUsernameReceivedInvocations: [String] = []

    var usernameUsernameUnderlyingReturnValue: ClientBuilder!
    open var usernameUsernameReturnValue: ClientBuilder! {
        get {
            if Thread.isMainThread {
                return usernameUsernameUnderlyingReturnValue
            } else {
                var returnValue: ClientBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = usernameUsernameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                usernameUsernameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    usernameUsernameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var usernameUsernameClosure: ((String) -> ClientBuilder)?

    open override func username(username: String) -> ClientBuilder {
        usernameUsernameCallsCount += 1
        usernameUsernameReceivedUsername = username
        DispatchQueue.main.async {
            self.usernameUsernameReceivedInvocations.append(username)
        }
        if let usernameUsernameClosure = usernameUsernameClosure {
            return usernameUsernameClosure(username)
        } else {
            return usernameUsernameReturnValue
        }
    }
}
open class EncryptionSDKMock: MatrixRustSDK.Encryption, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - backupExistsOnServer

    open var backupExistsOnServerThrowableError: Error?
    var backupExistsOnServerUnderlyingCallsCount = 0
    open var backupExistsOnServerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return backupExistsOnServerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = backupExistsOnServerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                backupExistsOnServerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    backupExistsOnServerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var backupExistsOnServerCalled: Bool {
        return backupExistsOnServerCallsCount > 0
    }

    var backupExistsOnServerUnderlyingReturnValue: Bool!
    open var backupExistsOnServerReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return backupExistsOnServerUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = backupExistsOnServerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                backupExistsOnServerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    backupExistsOnServerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var backupExistsOnServerClosure: (() async throws -> Bool)?

    open override func backupExistsOnServer() async throws -> Bool {
        if let error = backupExistsOnServerThrowableError {
            throw error
        }
        backupExistsOnServerCallsCount += 1
        if let backupExistsOnServerClosure = backupExistsOnServerClosure {
            return try await backupExistsOnServerClosure()
        } else {
            return backupExistsOnServerReturnValue
        }
    }

    //MARK: - backupState

    var backupStateUnderlyingCallsCount = 0
    open var backupStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return backupStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = backupStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                backupStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    backupStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var backupStateCalled: Bool {
        return backupStateCallsCount > 0
    }

    var backupStateUnderlyingReturnValue: BackupState!
    open var backupStateReturnValue: BackupState! {
        get {
            if Thread.isMainThread {
                return backupStateUnderlyingReturnValue
            } else {
                var returnValue: BackupState? = nil
                DispatchQueue.main.sync {
                    returnValue = backupStateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                backupStateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    backupStateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var backupStateClosure: (() -> BackupState)?

    open override func backupState() -> BackupState {
        backupStateCallsCount += 1
        if let backupStateClosure = backupStateClosure {
            return backupStateClosure()
        } else {
            return backupStateReturnValue
        }
    }

    //MARK: - backupStateListener

    var backupStateListenerListenerUnderlyingCallsCount = 0
    open var backupStateListenerListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return backupStateListenerListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = backupStateListenerListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                backupStateListenerListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    backupStateListenerListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var backupStateListenerListenerCalled: Bool {
        return backupStateListenerListenerCallsCount > 0
    }
    open var backupStateListenerListenerReceivedListener: BackupStateListener?
    open var backupStateListenerListenerReceivedInvocations: [BackupStateListener] = []

    var backupStateListenerListenerUnderlyingReturnValue: TaskHandle!
    open var backupStateListenerListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return backupStateListenerListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = backupStateListenerListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                backupStateListenerListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    backupStateListenerListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var backupStateListenerListenerClosure: ((BackupStateListener) -> TaskHandle)?

    open override func backupStateListener(listener: BackupStateListener) -> TaskHandle {
        backupStateListenerListenerCallsCount += 1
        backupStateListenerListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.backupStateListenerListenerReceivedInvocations.append(listener)
        }
        if let backupStateListenerListenerClosure = backupStateListenerListenerClosure {
            return backupStateListenerListenerClosure(listener)
        } else {
            return backupStateListenerListenerReturnValue
        }
    }

    //MARK: - curve25519Key

    var curve25519KeyUnderlyingCallsCount = 0
    open var curve25519KeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return curve25519KeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = curve25519KeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                curve25519KeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    curve25519KeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var curve25519KeyCalled: Bool {
        return curve25519KeyCallsCount > 0
    }

    var curve25519KeyUnderlyingReturnValue: String?
    open var curve25519KeyReturnValue: String? {
        get {
            if Thread.isMainThread {
                return curve25519KeyUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = curve25519KeyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                curve25519KeyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    curve25519KeyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var curve25519KeyClosure: (() async -> String?)?

    open override func curve25519Key() async -> String? {
        curve25519KeyCallsCount += 1
        if let curve25519KeyClosure = curve25519KeyClosure {
            return await curve25519KeyClosure()
        } else {
            return curve25519KeyReturnValue
        }
    }

    //MARK: - disableRecovery

    open var disableRecoveryThrowableError: Error?
    var disableRecoveryUnderlyingCallsCount = 0
    open var disableRecoveryCallsCount: Int {
        get {
            if Thread.isMainThread {
                return disableRecoveryUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = disableRecoveryUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableRecoveryUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    disableRecoveryUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var disableRecoveryCalled: Bool {
        return disableRecoveryCallsCount > 0
    }
    open var disableRecoveryClosure: (() async throws -> Void)?

    open override func disableRecovery() async throws {
        if let error = disableRecoveryThrowableError {
            throw error
        }
        disableRecoveryCallsCount += 1
        try await disableRecoveryClosure?()
    }

    //MARK: - ed25519Key

    var ed25519KeyUnderlyingCallsCount = 0
    open var ed25519KeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return ed25519KeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = ed25519KeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ed25519KeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    ed25519KeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var ed25519KeyCalled: Bool {
        return ed25519KeyCallsCount > 0
    }

    var ed25519KeyUnderlyingReturnValue: String?
    open var ed25519KeyReturnValue: String? {
        get {
            if Thread.isMainThread {
                return ed25519KeyUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = ed25519KeyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ed25519KeyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    ed25519KeyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var ed25519KeyClosure: (() async -> String?)?

    open override func ed25519Key() async -> String? {
        ed25519KeyCallsCount += 1
        if let ed25519KeyClosure = ed25519KeyClosure {
            return await ed25519KeyClosure()
        } else {
            return ed25519KeyReturnValue
        }
    }

    //MARK: - enableBackups

    open var enableBackupsThrowableError: Error?
    var enableBackupsUnderlyingCallsCount = 0
    open var enableBackupsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enableBackupsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enableBackupsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableBackupsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enableBackupsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var enableBackupsCalled: Bool {
        return enableBackupsCallsCount > 0
    }
    open var enableBackupsClosure: (() async throws -> Void)?

    open override func enableBackups() async throws {
        if let error = enableBackupsThrowableError {
            throw error
        }
        enableBackupsCallsCount += 1
        try await enableBackupsClosure?()
    }

    //MARK: - enableRecovery

    open var enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerThrowableError: Error?
    var enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingCallsCount = 0
    open var enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerCalled: Bool {
        return enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerCallsCount > 0
    }
    open var enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerReceivedArguments: (waitForBackupsToUpload: Bool, passphrase: String?, progressListener: EnableRecoveryProgressListener)?
    open var enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerReceivedInvocations: [(waitForBackupsToUpload: Bool, passphrase: String?, progressListener: EnableRecoveryProgressListener)] = []

    var enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingReturnValue: String!
    open var enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerReturnValue: String! {
        get {
            if Thread.isMainThread {
                return enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerClosure: ((Bool, String?, EnableRecoveryProgressListener) async throws -> String)?

    open override func enableRecovery(waitForBackupsToUpload: Bool, passphrase: String?, progressListener: EnableRecoveryProgressListener) async throws -> String {
        if let error = enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerThrowableError {
            throw error
        }
        enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerCallsCount += 1
        enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerReceivedArguments = (waitForBackupsToUpload: waitForBackupsToUpload, passphrase: passphrase, progressListener: progressListener)
        DispatchQueue.main.async {
            self.enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerReceivedInvocations.append((waitForBackupsToUpload: waitForBackupsToUpload, passphrase: passphrase, progressListener: progressListener))
        }
        if let enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerClosure = enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerClosure {
            return try await enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerClosure(waitForBackupsToUpload, passphrase, progressListener)
        } else {
            return enableRecoveryWaitForBackupsToUploadPassphraseProgressListenerReturnValue
        }
    }

    //MARK: - isLastDevice

    open var isLastDeviceThrowableError: Error?
    var isLastDeviceUnderlyingCallsCount = 0
    open var isLastDeviceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isLastDeviceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isLastDeviceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isLastDeviceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isLastDeviceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isLastDeviceCalled: Bool {
        return isLastDeviceCallsCount > 0
    }

    var isLastDeviceUnderlyingReturnValue: Bool!
    open var isLastDeviceReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isLastDeviceUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isLastDeviceUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isLastDeviceUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isLastDeviceUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isLastDeviceClosure: (() async throws -> Bool)?

    open override func isLastDevice() async throws -> Bool {
        if let error = isLastDeviceThrowableError {
            throw error
        }
        isLastDeviceCallsCount += 1
        if let isLastDeviceClosure = isLastDeviceClosure {
            return try await isLastDeviceClosure()
        } else {
            return isLastDeviceReturnValue
        }
    }

    //MARK: - recover

    open var recoverRecoveryKeyThrowableError: Error?
    var recoverRecoveryKeyUnderlyingCallsCount = 0
    open var recoverRecoveryKeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return recoverRecoveryKeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = recoverRecoveryKeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recoverRecoveryKeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    recoverRecoveryKeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var recoverRecoveryKeyCalled: Bool {
        return recoverRecoveryKeyCallsCount > 0
    }
    open var recoverRecoveryKeyReceivedRecoveryKey: String?
    open var recoverRecoveryKeyReceivedInvocations: [String] = []
    open var recoverRecoveryKeyClosure: ((String) async throws -> Void)?

    open override func recover(recoveryKey: String) async throws {
        if let error = recoverRecoveryKeyThrowableError {
            throw error
        }
        recoverRecoveryKeyCallsCount += 1
        recoverRecoveryKeyReceivedRecoveryKey = recoveryKey
        DispatchQueue.main.async {
            self.recoverRecoveryKeyReceivedInvocations.append(recoveryKey)
        }
        try await recoverRecoveryKeyClosure?(recoveryKey)
    }

    //MARK: - recoverAndReset

    open var recoverAndResetOldRecoveryKeyThrowableError: Error?
    var recoverAndResetOldRecoveryKeyUnderlyingCallsCount = 0
    open var recoverAndResetOldRecoveryKeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return recoverAndResetOldRecoveryKeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = recoverAndResetOldRecoveryKeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recoverAndResetOldRecoveryKeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    recoverAndResetOldRecoveryKeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var recoverAndResetOldRecoveryKeyCalled: Bool {
        return recoverAndResetOldRecoveryKeyCallsCount > 0
    }
    open var recoverAndResetOldRecoveryKeyReceivedOldRecoveryKey: String?
    open var recoverAndResetOldRecoveryKeyReceivedInvocations: [String] = []

    var recoverAndResetOldRecoveryKeyUnderlyingReturnValue: String!
    open var recoverAndResetOldRecoveryKeyReturnValue: String! {
        get {
            if Thread.isMainThread {
                return recoverAndResetOldRecoveryKeyUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = recoverAndResetOldRecoveryKeyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recoverAndResetOldRecoveryKeyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    recoverAndResetOldRecoveryKeyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var recoverAndResetOldRecoveryKeyClosure: ((String) async throws -> String)?

    open override func recoverAndReset(oldRecoveryKey: String) async throws -> String {
        if let error = recoverAndResetOldRecoveryKeyThrowableError {
            throw error
        }
        recoverAndResetOldRecoveryKeyCallsCount += 1
        recoverAndResetOldRecoveryKeyReceivedOldRecoveryKey = oldRecoveryKey
        DispatchQueue.main.async {
            self.recoverAndResetOldRecoveryKeyReceivedInvocations.append(oldRecoveryKey)
        }
        if let recoverAndResetOldRecoveryKeyClosure = recoverAndResetOldRecoveryKeyClosure {
            return try await recoverAndResetOldRecoveryKeyClosure(oldRecoveryKey)
        } else {
            return recoverAndResetOldRecoveryKeyReturnValue
        }
    }

    //MARK: - recoveryState

    var recoveryStateUnderlyingCallsCount = 0
    open var recoveryStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return recoveryStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = recoveryStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recoveryStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    recoveryStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var recoveryStateCalled: Bool {
        return recoveryStateCallsCount > 0
    }

    var recoveryStateUnderlyingReturnValue: RecoveryState!
    open var recoveryStateReturnValue: RecoveryState! {
        get {
            if Thread.isMainThread {
                return recoveryStateUnderlyingReturnValue
            } else {
                var returnValue: RecoveryState? = nil
                DispatchQueue.main.sync {
                    returnValue = recoveryStateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recoveryStateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    recoveryStateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var recoveryStateClosure: (() -> RecoveryState)?

    open override func recoveryState() -> RecoveryState {
        recoveryStateCallsCount += 1
        if let recoveryStateClosure = recoveryStateClosure {
            return recoveryStateClosure()
        } else {
            return recoveryStateReturnValue
        }
    }

    //MARK: - recoveryStateListener

    var recoveryStateListenerListenerUnderlyingCallsCount = 0
    open var recoveryStateListenerListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return recoveryStateListenerListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = recoveryStateListenerListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recoveryStateListenerListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    recoveryStateListenerListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var recoveryStateListenerListenerCalled: Bool {
        return recoveryStateListenerListenerCallsCount > 0
    }
    open var recoveryStateListenerListenerReceivedListener: RecoveryStateListener?
    open var recoveryStateListenerListenerReceivedInvocations: [RecoveryStateListener] = []

    var recoveryStateListenerListenerUnderlyingReturnValue: TaskHandle!
    open var recoveryStateListenerListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return recoveryStateListenerListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = recoveryStateListenerListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recoveryStateListenerListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    recoveryStateListenerListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var recoveryStateListenerListenerClosure: ((RecoveryStateListener) -> TaskHandle)?

    open override func recoveryStateListener(listener: RecoveryStateListener) -> TaskHandle {
        recoveryStateListenerListenerCallsCount += 1
        recoveryStateListenerListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.recoveryStateListenerListenerReceivedInvocations.append(listener)
        }
        if let recoveryStateListenerListenerClosure = recoveryStateListenerListenerClosure {
            return recoveryStateListenerListenerClosure(listener)
        } else {
            return recoveryStateListenerListenerReturnValue
        }
    }

    //MARK: - resetIdentity

    open var resetIdentityThrowableError: Error?
    var resetIdentityUnderlyingCallsCount = 0
    open var resetIdentityCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetIdentityUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetIdentityUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetIdentityUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetIdentityUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var resetIdentityCalled: Bool {
        return resetIdentityCallsCount > 0
    }

    var resetIdentityUnderlyingReturnValue: IdentityResetHandle?
    open var resetIdentityReturnValue: IdentityResetHandle? {
        get {
            if Thread.isMainThread {
                return resetIdentityUnderlyingReturnValue
            } else {
                var returnValue: IdentityResetHandle?? = nil
                DispatchQueue.main.sync {
                    returnValue = resetIdentityUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetIdentityUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    resetIdentityUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var resetIdentityClosure: (() async throws -> IdentityResetHandle?)?

    open override func resetIdentity() async throws -> IdentityResetHandle? {
        if let error = resetIdentityThrowableError {
            throw error
        }
        resetIdentityCallsCount += 1
        if let resetIdentityClosure = resetIdentityClosure {
            return try await resetIdentityClosure()
        } else {
            return resetIdentityReturnValue
        }
    }

    //MARK: - resetRecoveryKey

    open var resetRecoveryKeyThrowableError: Error?
    var resetRecoveryKeyUnderlyingCallsCount = 0
    open var resetRecoveryKeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetRecoveryKeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetRecoveryKeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetRecoveryKeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetRecoveryKeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var resetRecoveryKeyCalled: Bool {
        return resetRecoveryKeyCallsCount > 0
    }

    var resetRecoveryKeyUnderlyingReturnValue: String!
    open var resetRecoveryKeyReturnValue: String! {
        get {
            if Thread.isMainThread {
                return resetRecoveryKeyUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = resetRecoveryKeyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetRecoveryKeyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    resetRecoveryKeyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var resetRecoveryKeyClosure: (() async throws -> String)?

    open override func resetRecoveryKey() async throws -> String {
        if let error = resetRecoveryKeyThrowableError {
            throw error
        }
        resetRecoveryKeyCallsCount += 1
        if let resetRecoveryKeyClosure = resetRecoveryKeyClosure {
            return try await resetRecoveryKeyClosure()
        } else {
            return resetRecoveryKeyReturnValue
        }
    }

    //MARK: - userIdentity

    open var userIdentityUserIdThrowableError: Error?
    var userIdentityUserIdUnderlyingCallsCount = 0
    open var userIdentityUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return userIdentityUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = userIdentityUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userIdentityUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    userIdentityUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var userIdentityUserIdCalled: Bool {
        return userIdentityUserIdCallsCount > 0
    }
    open var userIdentityUserIdReceivedUserId: String?
    open var userIdentityUserIdReceivedInvocations: [String] = []

    var userIdentityUserIdUnderlyingReturnValue: UserIdentity?
    open var userIdentityUserIdReturnValue: UserIdentity? {
        get {
            if Thread.isMainThread {
                return userIdentityUserIdUnderlyingReturnValue
            } else {
                var returnValue: UserIdentity?? = nil
                DispatchQueue.main.sync {
                    returnValue = userIdentityUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userIdentityUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    userIdentityUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var userIdentityUserIdClosure: ((String) async throws -> UserIdentity?)?

    open override func userIdentity(userId: String) async throws -> UserIdentity? {
        if let error = userIdentityUserIdThrowableError {
            throw error
        }
        userIdentityUserIdCallsCount += 1
        userIdentityUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.userIdentityUserIdReceivedInvocations.append(userId)
        }
        if let userIdentityUserIdClosure = userIdentityUserIdClosure {
            return try await userIdentityUserIdClosure(userId)
        } else {
            return userIdentityUserIdReturnValue
        }
    }

    //MARK: - verificationState

    var verificationStateUnderlyingCallsCount = 0
    open var verificationStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return verificationStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = verificationStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                verificationStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    verificationStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var verificationStateCalled: Bool {
        return verificationStateCallsCount > 0
    }

    var verificationStateUnderlyingReturnValue: VerificationState!
    open var verificationStateReturnValue: VerificationState! {
        get {
            if Thread.isMainThread {
                return verificationStateUnderlyingReturnValue
            } else {
                var returnValue: VerificationState? = nil
                DispatchQueue.main.sync {
                    returnValue = verificationStateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                verificationStateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    verificationStateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var verificationStateClosure: (() -> VerificationState)?

    open override func verificationState() -> VerificationState {
        verificationStateCallsCount += 1
        if let verificationStateClosure = verificationStateClosure {
            return verificationStateClosure()
        } else {
            return verificationStateReturnValue
        }
    }

    //MARK: - verificationStateListener

    var verificationStateListenerListenerUnderlyingCallsCount = 0
    open var verificationStateListenerListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return verificationStateListenerListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = verificationStateListenerListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                verificationStateListenerListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    verificationStateListenerListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var verificationStateListenerListenerCalled: Bool {
        return verificationStateListenerListenerCallsCount > 0
    }
    open var verificationStateListenerListenerReceivedListener: VerificationStateListener?
    open var verificationStateListenerListenerReceivedInvocations: [VerificationStateListener] = []

    var verificationStateListenerListenerUnderlyingReturnValue: TaskHandle!
    open var verificationStateListenerListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return verificationStateListenerListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = verificationStateListenerListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                verificationStateListenerListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    verificationStateListenerListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var verificationStateListenerListenerClosure: ((VerificationStateListener) -> TaskHandle)?

    open override func verificationStateListener(listener: VerificationStateListener) -> TaskHandle {
        verificationStateListenerListenerCallsCount += 1
        verificationStateListenerListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.verificationStateListenerListenerReceivedInvocations.append(listener)
        }
        if let verificationStateListenerListenerClosure = verificationStateListenerListenerClosure {
            return verificationStateListenerListenerClosure(listener)
        } else {
            return verificationStateListenerListenerReturnValue
        }
    }

    //MARK: - waitForBackupUploadSteadyState

    open var waitForBackupUploadSteadyStateProgressListenerThrowableError: Error?
    var waitForBackupUploadSteadyStateProgressListenerUnderlyingCallsCount = 0
    open var waitForBackupUploadSteadyStateProgressListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return waitForBackupUploadSteadyStateProgressListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = waitForBackupUploadSteadyStateProgressListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                waitForBackupUploadSteadyStateProgressListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    waitForBackupUploadSteadyStateProgressListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var waitForBackupUploadSteadyStateProgressListenerCalled: Bool {
        return waitForBackupUploadSteadyStateProgressListenerCallsCount > 0
    }
    open var waitForBackupUploadSteadyStateProgressListenerReceivedProgressListener: BackupSteadyStateListener?
    open var waitForBackupUploadSteadyStateProgressListenerReceivedInvocations: [BackupSteadyStateListener?] = []
    open var waitForBackupUploadSteadyStateProgressListenerClosure: ((BackupSteadyStateListener?) async throws -> Void)?

    open override func waitForBackupUploadSteadyState(progressListener: BackupSteadyStateListener?) async throws {
        if let error = waitForBackupUploadSteadyStateProgressListenerThrowableError {
            throw error
        }
        waitForBackupUploadSteadyStateProgressListenerCallsCount += 1
        waitForBackupUploadSteadyStateProgressListenerReceivedProgressListener = progressListener
        DispatchQueue.main.async {
            self.waitForBackupUploadSteadyStateProgressListenerReceivedInvocations.append(progressListener)
        }
        try await waitForBackupUploadSteadyStateProgressListenerClosure?(progressListener)
    }

    //MARK: - waitForE2eeInitializationTasks

    var waitForE2eeInitializationTasksUnderlyingCallsCount = 0
    open var waitForE2eeInitializationTasksCallsCount: Int {
        get {
            if Thread.isMainThread {
                return waitForE2eeInitializationTasksUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = waitForE2eeInitializationTasksUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                waitForE2eeInitializationTasksUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    waitForE2eeInitializationTasksUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var waitForE2eeInitializationTasksCalled: Bool {
        return waitForE2eeInitializationTasksCallsCount > 0
    }
    open var waitForE2eeInitializationTasksClosure: (() async -> Void)?

    open override func waitForE2eeInitializationTasks() async {
        waitForE2eeInitializationTasksCallsCount += 1
        await waitForE2eeInitializationTasksClosure?()
    }
}
open class HomeserverLoginDetailsSDKMock: MatrixRustSDK.HomeserverLoginDetails, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - slidingSyncVersion

    var slidingSyncVersionUnderlyingCallsCount = 0
    open var slidingSyncVersionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return slidingSyncVersionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = slidingSyncVersionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                slidingSyncVersionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    slidingSyncVersionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var slidingSyncVersionCalled: Bool {
        return slidingSyncVersionCallsCount > 0
    }

    var slidingSyncVersionUnderlyingReturnValue: SlidingSyncVersion!
    open var slidingSyncVersionReturnValue: SlidingSyncVersion! {
        get {
            if Thread.isMainThread {
                return slidingSyncVersionUnderlyingReturnValue
            } else {
                var returnValue: SlidingSyncVersion? = nil
                DispatchQueue.main.sync {
                    returnValue = slidingSyncVersionUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                slidingSyncVersionUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    slidingSyncVersionUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var slidingSyncVersionClosure: (() -> SlidingSyncVersion)?

    open override func slidingSyncVersion() -> SlidingSyncVersion {
        slidingSyncVersionCallsCount += 1
        if let slidingSyncVersionClosure = slidingSyncVersionClosure {
            return slidingSyncVersionClosure()
        } else {
            return slidingSyncVersionReturnValue
        }
    }

    //MARK: - supportedOidcPrompts

    var supportedOidcPromptsUnderlyingCallsCount = 0
    open var supportedOidcPromptsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return supportedOidcPromptsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = supportedOidcPromptsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                supportedOidcPromptsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    supportedOidcPromptsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var supportedOidcPromptsCalled: Bool {
        return supportedOidcPromptsCallsCount > 0
    }

    var supportedOidcPromptsUnderlyingReturnValue: [OidcPrompt]!
    open var supportedOidcPromptsReturnValue: [OidcPrompt]! {
        get {
            if Thread.isMainThread {
                return supportedOidcPromptsUnderlyingReturnValue
            } else {
                var returnValue: [OidcPrompt]? = nil
                DispatchQueue.main.sync {
                    returnValue = supportedOidcPromptsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                supportedOidcPromptsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    supportedOidcPromptsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var supportedOidcPromptsClosure: (() -> [OidcPrompt])?

    open override func supportedOidcPrompts() -> [OidcPrompt] {
        supportedOidcPromptsCallsCount += 1
        if let supportedOidcPromptsClosure = supportedOidcPromptsClosure {
            return supportedOidcPromptsClosure()
        } else {
            return supportedOidcPromptsReturnValue
        }
    }

    //MARK: - supportsOidcLogin

    var supportsOidcLoginUnderlyingCallsCount = 0
    open var supportsOidcLoginCallsCount: Int {
        get {
            if Thread.isMainThread {
                return supportsOidcLoginUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = supportsOidcLoginUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                supportsOidcLoginUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    supportsOidcLoginUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var supportsOidcLoginCalled: Bool {
        return supportsOidcLoginCallsCount > 0
    }

    var supportsOidcLoginUnderlyingReturnValue: Bool!
    open var supportsOidcLoginReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return supportsOidcLoginUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = supportsOidcLoginUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                supportsOidcLoginUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    supportsOidcLoginUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var supportsOidcLoginClosure: (() -> Bool)?

    open override func supportsOidcLogin() -> Bool {
        supportsOidcLoginCallsCount += 1
        if let supportsOidcLoginClosure = supportsOidcLoginClosure {
            return supportsOidcLoginClosure()
        } else {
            return supportsOidcLoginReturnValue
        }
    }

    //MARK: - supportsPasswordLogin

    var supportsPasswordLoginUnderlyingCallsCount = 0
    open var supportsPasswordLoginCallsCount: Int {
        get {
            if Thread.isMainThread {
                return supportsPasswordLoginUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = supportsPasswordLoginUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                supportsPasswordLoginUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    supportsPasswordLoginUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var supportsPasswordLoginCalled: Bool {
        return supportsPasswordLoginCallsCount > 0
    }

    var supportsPasswordLoginUnderlyingReturnValue: Bool!
    open var supportsPasswordLoginReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return supportsPasswordLoginUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = supportsPasswordLoginUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                supportsPasswordLoginUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    supportsPasswordLoginUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var supportsPasswordLoginClosure: (() -> Bool)?

    open override func supportsPasswordLogin() -> Bool {
        supportsPasswordLoginCallsCount += 1
        if let supportsPasswordLoginClosure = supportsPasswordLoginClosure {
            return supportsPasswordLoginClosure()
        } else {
            return supportsPasswordLoginReturnValue
        }
    }

    //MARK: - url

    var urlUnderlyingCallsCount = 0
    open var urlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return urlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = urlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                urlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    urlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var urlCalled: Bool {
        return urlCallsCount > 0
    }

    var urlUnderlyingReturnValue: String!
    open var urlReturnValue: String! {
        get {
            if Thread.isMainThread {
                return urlUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = urlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                urlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    urlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var urlClosure: (() -> String)?

    open override func url() -> String {
        urlCallsCount += 1
        if let urlClosure = urlClosure {
            return urlClosure()
        } else {
            return urlReturnValue
        }
    }
}
open class IdentityResetHandleSDKMock: MatrixRustSDK.IdentityResetHandle, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - authType

    var authTypeUnderlyingCallsCount = 0
    open var authTypeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return authTypeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = authTypeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                authTypeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    authTypeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var authTypeCalled: Bool {
        return authTypeCallsCount > 0
    }

    var authTypeUnderlyingReturnValue: CrossSigningResetAuthType!
    open var authTypeReturnValue: CrossSigningResetAuthType! {
        get {
            if Thread.isMainThread {
                return authTypeUnderlyingReturnValue
            } else {
                var returnValue: CrossSigningResetAuthType? = nil
                DispatchQueue.main.sync {
                    returnValue = authTypeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                authTypeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    authTypeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var authTypeClosure: (() -> CrossSigningResetAuthType)?

    open override func authType() -> CrossSigningResetAuthType {
        authTypeCallsCount += 1
        if let authTypeClosure = authTypeClosure {
            return authTypeClosure()
        } else {
            return authTypeReturnValue
        }
    }

    //MARK: - cancel

    var cancelUnderlyingCallsCount = 0
    open var cancelCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cancelUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cancelUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cancelUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cancelUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var cancelCalled: Bool {
        return cancelCallsCount > 0
    }
    open var cancelClosure: (() async -> Void)?

    open override func cancel() async {
        cancelCallsCount += 1
        await cancelClosure?()
    }

    //MARK: - reset

    open var resetAuthThrowableError: Error?
    var resetAuthUnderlyingCallsCount = 0
    open var resetAuthCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetAuthUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetAuthUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetAuthUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetAuthUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var resetAuthCalled: Bool {
        return resetAuthCallsCount > 0
    }
    open var resetAuthReceivedAuth: AuthData?
    open var resetAuthReceivedInvocations: [AuthData?] = []
    open var resetAuthClosure: ((AuthData?) async throws -> Void)?

    open override func reset(auth: AuthData?) async throws {
        if let error = resetAuthThrowableError {
            throw error
        }
        resetAuthCallsCount += 1
        resetAuthReceivedAuth = auth
        DispatchQueue.main.async {
            self.resetAuthReceivedInvocations.append(auth)
        }
        try await resetAuthClosure?(auth)
    }
}
open class InReplyToDetailsSDKMock: MatrixRustSDK.InReplyToDetails, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - event

    var eventUnderlyingCallsCount = 0
    open var eventCallsCount: Int {
        get {
            if Thread.isMainThread {
                return eventUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = eventUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                eventUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    eventUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var eventCalled: Bool {
        return eventCallsCount > 0
    }

    var eventUnderlyingReturnValue: EmbeddedEventDetails!
    open var eventReturnValue: EmbeddedEventDetails! {
        get {
            if Thread.isMainThread {
                return eventUnderlyingReturnValue
            } else {
                var returnValue: EmbeddedEventDetails? = nil
                DispatchQueue.main.sync {
                    returnValue = eventUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                eventUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    eventUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var eventClosure: (() -> EmbeddedEventDetails)?

    open override func event() -> EmbeddedEventDetails {
        eventCallsCount += 1
        if let eventClosure = eventClosure {
            return eventClosure()
        } else {
            return eventReturnValue
        }
    }

    //MARK: - eventId

    var eventIdUnderlyingCallsCount = 0
    open var eventIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return eventIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = eventIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                eventIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    eventIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var eventIdCalled: Bool {
        return eventIdCallsCount > 0
    }

    var eventIdUnderlyingReturnValue: String!
    open var eventIdReturnValue: String! {
        get {
            if Thread.isMainThread {
                return eventIdUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = eventIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                eventIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    eventIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var eventIdClosure: (() -> String)?

    open override func eventId() -> String {
        eventIdCallsCount += 1
        if let eventIdClosure = eventIdClosure {
            return eventIdClosure()
        } else {
            return eventIdReturnValue
        }
    }
}
open class KnockRequestActionsSDKMock: MatrixRustSDK.KnockRequestActions, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - accept

    open var acceptThrowableError: Error?
    var acceptUnderlyingCallsCount = 0
    open var acceptCallsCount: Int {
        get {
            if Thread.isMainThread {
                return acceptUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = acceptUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                acceptUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    acceptUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var acceptCalled: Bool {
        return acceptCallsCount > 0
    }
    open var acceptClosure: (() async throws -> Void)?

    open override func accept() async throws {
        if let error = acceptThrowableError {
            throw error
        }
        acceptCallsCount += 1
        try await acceptClosure?()
    }

    //MARK: - decline

    open var declineReasonThrowableError: Error?
    var declineReasonUnderlyingCallsCount = 0
    open var declineReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return declineReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = declineReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                declineReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    declineReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var declineReasonCalled: Bool {
        return declineReasonCallsCount > 0
    }
    open var declineReasonReceivedReason: String?
    open var declineReasonReceivedInvocations: [String?] = []
    open var declineReasonClosure: ((String?) async throws -> Void)?

    open override func decline(reason: String?) async throws {
        if let error = declineReasonThrowableError {
            throw error
        }
        declineReasonCallsCount += 1
        declineReasonReceivedReason = reason
        DispatchQueue.main.async {
            self.declineReasonReceivedInvocations.append(reason)
        }
        try await declineReasonClosure?(reason)
    }

    //MARK: - declineAndBan

    open var declineAndBanReasonThrowableError: Error?
    var declineAndBanReasonUnderlyingCallsCount = 0
    open var declineAndBanReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return declineAndBanReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = declineAndBanReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                declineAndBanReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    declineAndBanReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var declineAndBanReasonCalled: Bool {
        return declineAndBanReasonCallsCount > 0
    }
    open var declineAndBanReasonReceivedReason: String?
    open var declineAndBanReasonReceivedInvocations: [String?] = []
    open var declineAndBanReasonClosure: ((String?) async throws -> Void)?

    open override func declineAndBan(reason: String?) async throws {
        if let error = declineAndBanReasonThrowableError {
            throw error
        }
        declineAndBanReasonCallsCount += 1
        declineAndBanReasonReceivedReason = reason
        DispatchQueue.main.async {
            self.declineAndBanReasonReceivedInvocations.append(reason)
        }
        try await declineAndBanReasonClosure?(reason)
    }

    //MARK: - markAsSeen

    open var markAsSeenThrowableError: Error?
    var markAsSeenUnderlyingCallsCount = 0
    open var markAsSeenCallsCount: Int {
        get {
            if Thread.isMainThread {
                return markAsSeenUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = markAsSeenUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                markAsSeenUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    markAsSeenUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var markAsSeenCalled: Bool {
        return markAsSeenCallsCount > 0
    }
    open var markAsSeenClosure: (() async throws -> Void)?

    open override func markAsSeen() async throws {
        if let error = markAsSeenThrowableError {
            throw error
        }
        markAsSeenCallsCount += 1
        try await markAsSeenClosure?()
    }
}
open class LazyTimelineItemProviderSDKMock: MatrixRustSDK.LazyTimelineItemProvider, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - containsOnlyEmojis

    var containsOnlyEmojisUnderlyingCallsCount = 0
    open var containsOnlyEmojisCallsCount: Int {
        get {
            if Thread.isMainThread {
                return containsOnlyEmojisUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = containsOnlyEmojisUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                containsOnlyEmojisUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    containsOnlyEmojisUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var containsOnlyEmojisCalled: Bool {
        return containsOnlyEmojisCallsCount > 0
    }

    var containsOnlyEmojisUnderlyingReturnValue: Bool!
    open var containsOnlyEmojisReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return containsOnlyEmojisUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = containsOnlyEmojisUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                containsOnlyEmojisUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    containsOnlyEmojisUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var containsOnlyEmojisClosure: (() -> Bool)?

    open override func containsOnlyEmojis() -> Bool {
        containsOnlyEmojisCallsCount += 1
        if let containsOnlyEmojisClosure = containsOnlyEmojisClosure {
            return containsOnlyEmojisClosure()
        } else {
            return containsOnlyEmojisReturnValue
        }
    }

    //MARK: - debugInfo

    var debugInfoUnderlyingCallsCount = 0
    open var debugInfoCallsCount: Int {
        get {
            if Thread.isMainThread {
                return debugInfoUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = debugInfoUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                debugInfoUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    debugInfoUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var debugInfoCalled: Bool {
        return debugInfoCallsCount > 0
    }

    var debugInfoUnderlyingReturnValue: EventTimelineItemDebugInfo!
    open var debugInfoReturnValue: EventTimelineItemDebugInfo! {
        get {
            if Thread.isMainThread {
                return debugInfoUnderlyingReturnValue
            } else {
                var returnValue: EventTimelineItemDebugInfo? = nil
                DispatchQueue.main.sync {
                    returnValue = debugInfoUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                debugInfoUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    debugInfoUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var debugInfoClosure: (() -> EventTimelineItemDebugInfo)?

    open override func debugInfo() -> EventTimelineItemDebugInfo {
        debugInfoCallsCount += 1
        if let debugInfoClosure = debugInfoClosure {
            return debugInfoClosure()
        } else {
            return debugInfoReturnValue
        }
    }

    //MARK: - getSendHandle

    var getSendHandleUnderlyingCallsCount = 0
    open var getSendHandleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getSendHandleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getSendHandleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getSendHandleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getSendHandleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getSendHandleCalled: Bool {
        return getSendHandleCallsCount > 0
    }

    var getSendHandleUnderlyingReturnValue: SendHandle?
    open var getSendHandleReturnValue: SendHandle? {
        get {
            if Thread.isMainThread {
                return getSendHandleUnderlyingReturnValue
            } else {
                var returnValue: SendHandle?? = nil
                DispatchQueue.main.sync {
                    returnValue = getSendHandleUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getSendHandleUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getSendHandleUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getSendHandleClosure: (() -> SendHandle?)?

    open override func getSendHandle() -> SendHandle? {
        getSendHandleCallsCount += 1
        if let getSendHandleClosure = getSendHandleClosure {
            return getSendHandleClosure()
        } else {
            return getSendHandleReturnValue
        }
    }

    //MARK: - getShields

    var getShieldsStrictUnderlyingCallsCount = 0
    open var getShieldsStrictCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getShieldsStrictUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getShieldsStrictUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getShieldsStrictUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getShieldsStrictUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getShieldsStrictCalled: Bool {
        return getShieldsStrictCallsCount > 0
    }
    open var getShieldsStrictReceivedStrict: Bool?
    open var getShieldsStrictReceivedInvocations: [Bool] = []

    var getShieldsStrictUnderlyingReturnValue: ShieldState?
    open var getShieldsStrictReturnValue: ShieldState? {
        get {
            if Thread.isMainThread {
                return getShieldsStrictUnderlyingReturnValue
            } else {
                var returnValue: ShieldState?? = nil
                DispatchQueue.main.sync {
                    returnValue = getShieldsStrictUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getShieldsStrictUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getShieldsStrictUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getShieldsStrictClosure: ((Bool) -> ShieldState?)?

    open override func getShields(strict: Bool) -> ShieldState? {
        getShieldsStrictCallsCount += 1
        getShieldsStrictReceivedStrict = strict
        DispatchQueue.main.async {
            self.getShieldsStrictReceivedInvocations.append(strict)
        }
        if let getShieldsStrictClosure = getShieldsStrictClosure {
            return getShieldsStrictClosure(strict)
        } else {
            return getShieldsStrictReturnValue
        }
    }
}
open class MediaFileHandleSDKMock: MatrixRustSDK.MediaFileHandle, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - path

    open var pathThrowableError: Error?
    var pathUnderlyingCallsCount = 0
    open var pathCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pathUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pathUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pathUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pathUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var pathCalled: Bool {
        return pathCallsCount > 0
    }

    var pathUnderlyingReturnValue: String!
    open var pathReturnValue: String! {
        get {
            if Thread.isMainThread {
                return pathUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = pathUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pathUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    pathUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var pathClosure: (() throws -> String)?

    open override func path() throws -> String {
        if let error = pathThrowableError {
            throw error
        }
        pathCallsCount += 1
        if let pathClosure = pathClosure {
            return try pathClosure()
        } else {
            return pathReturnValue
        }
    }

    //MARK: - persist

    open var persistPathThrowableError: Error?
    var persistPathUnderlyingCallsCount = 0
    open var persistPathCallsCount: Int {
        get {
            if Thread.isMainThread {
                return persistPathUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = persistPathUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                persistPathUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    persistPathUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var persistPathCalled: Bool {
        return persistPathCallsCount > 0
    }
    open var persistPathReceivedPath: String?
    open var persistPathReceivedInvocations: [String] = []

    var persistPathUnderlyingReturnValue: Bool!
    open var persistPathReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return persistPathUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = persistPathUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                persistPathUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    persistPathUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var persistPathClosure: ((String) throws -> Bool)?

    open override func persist(path: String) throws -> Bool {
        if let error = persistPathThrowableError {
            throw error
        }
        persistPathCallsCount += 1
        persistPathReceivedPath = path
        DispatchQueue.main.async {
            self.persistPathReceivedInvocations.append(path)
        }
        if let persistPathClosure = persistPathClosure {
            return try persistPathClosure(path)
        } else {
            return persistPathReturnValue
        }
    }
}
open class MediaSourceSDKMock: MatrixRustSDK.MediaSource, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!
    static func reset()
    {
    }

    //MARK: - toJson

    var toJsonUnderlyingCallsCount = 0
    open var toJsonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return toJsonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = toJsonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                toJsonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    toJsonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var toJsonCalled: Bool {
        return toJsonCallsCount > 0
    }

    var toJsonUnderlyingReturnValue: String!
    open var toJsonReturnValue: String! {
        get {
            if Thread.isMainThread {
                return toJsonUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = toJsonUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                toJsonUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    toJsonUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var toJsonClosure: (() -> String)?

    open override func toJson() -> String {
        toJsonCallsCount += 1
        if let toJsonClosure = toJsonClosure {
            return toJsonClosure()
        } else {
            return toJsonReturnValue
        }
    }

    //MARK: - url

    var urlUnderlyingCallsCount = 0
    open var urlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return urlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = urlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                urlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    urlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var urlCalled: Bool {
        return urlCallsCount > 0
    }

    var urlUnderlyingReturnValue: String!
    open var urlReturnValue: String! {
        get {
            if Thread.isMainThread {
                return urlUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = urlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                urlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    urlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var urlClosure: (() -> String)?

    open override func url() -> String {
        urlCallsCount += 1
        if let urlClosure = urlClosure {
            return urlClosure()
        } else {
            return urlReturnValue
        }
    }
}
open class NotificationClientSDKMock: MatrixRustSDK.NotificationClient, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - getNotification

    open var getNotificationRoomIdEventIdThrowableError: Error?
    var getNotificationRoomIdEventIdUnderlyingCallsCount = 0
    open var getNotificationRoomIdEventIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getNotificationRoomIdEventIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getNotificationRoomIdEventIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getNotificationRoomIdEventIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getNotificationRoomIdEventIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getNotificationRoomIdEventIdCalled: Bool {
        return getNotificationRoomIdEventIdCallsCount > 0
    }
    open var getNotificationRoomIdEventIdReceivedArguments: (roomId: String, eventId: String)?
    open var getNotificationRoomIdEventIdReceivedInvocations: [(roomId: String, eventId: String)] = []

    var getNotificationRoomIdEventIdUnderlyingReturnValue: NotificationStatus!
    open var getNotificationRoomIdEventIdReturnValue: NotificationStatus! {
        get {
            if Thread.isMainThread {
                return getNotificationRoomIdEventIdUnderlyingReturnValue
            } else {
                var returnValue: NotificationStatus? = nil
                DispatchQueue.main.sync {
                    returnValue = getNotificationRoomIdEventIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getNotificationRoomIdEventIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getNotificationRoomIdEventIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getNotificationRoomIdEventIdClosure: ((String, String) async throws -> NotificationStatus)?

    open override func getNotification(roomId: String, eventId: String) async throws -> NotificationStatus {
        if let error = getNotificationRoomIdEventIdThrowableError {
            throw error
        }
        getNotificationRoomIdEventIdCallsCount += 1
        getNotificationRoomIdEventIdReceivedArguments = (roomId: roomId, eventId: eventId)
        DispatchQueue.main.async {
            self.getNotificationRoomIdEventIdReceivedInvocations.append((roomId: roomId, eventId: eventId))
        }
        if let getNotificationRoomIdEventIdClosure = getNotificationRoomIdEventIdClosure {
            return try await getNotificationRoomIdEventIdClosure(roomId, eventId)
        } else {
            return getNotificationRoomIdEventIdReturnValue
        }
    }

    //MARK: - getNotifications

    open var getNotificationsRequestsThrowableError: Error?
    var getNotificationsRequestsUnderlyingCallsCount = 0
    open var getNotificationsRequestsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getNotificationsRequestsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getNotificationsRequestsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getNotificationsRequestsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getNotificationsRequestsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getNotificationsRequestsCalled: Bool {
        return getNotificationsRequestsCallsCount > 0
    }
    open var getNotificationsRequestsReceivedRequests: [NotificationItemsRequest]?
    open var getNotificationsRequestsReceivedInvocations: [[NotificationItemsRequest]] = []

    var getNotificationsRequestsUnderlyingReturnValue: [String: BatchNotificationResult]!
    open var getNotificationsRequestsReturnValue: [String: BatchNotificationResult]! {
        get {
            if Thread.isMainThread {
                return getNotificationsRequestsUnderlyingReturnValue
            } else {
                var returnValue: [String: BatchNotificationResult]? = nil
                DispatchQueue.main.sync {
                    returnValue = getNotificationsRequestsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getNotificationsRequestsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getNotificationsRequestsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getNotificationsRequestsClosure: (([NotificationItemsRequest]) async throws -> [String: BatchNotificationResult])?

    open override func getNotifications(requests: [NotificationItemsRequest]) async throws -> [String: BatchNotificationResult] {
        if let error = getNotificationsRequestsThrowableError {
            throw error
        }
        getNotificationsRequestsCallsCount += 1
        getNotificationsRequestsReceivedRequests = requests
        DispatchQueue.main.async {
            self.getNotificationsRequestsReceivedInvocations.append(requests)
        }
        if let getNotificationsRequestsClosure = getNotificationsRequestsClosure {
            return try await getNotificationsRequestsClosure(requests)
        } else {
            return getNotificationsRequestsReturnValue
        }
    }

    //MARK: - getRoom

    open var getRoomRoomIdThrowableError: Error?
    var getRoomRoomIdUnderlyingCallsCount = 0
    open var getRoomRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getRoomRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getRoomRoomIdCalled: Bool {
        return getRoomRoomIdCallsCount > 0
    }
    open var getRoomRoomIdReceivedRoomId: String?
    open var getRoomRoomIdReceivedInvocations: [String] = []

    var getRoomRoomIdUnderlyingReturnValue: Room?
    open var getRoomRoomIdReturnValue: Room? {
        get {
            if Thread.isMainThread {
                return getRoomRoomIdUnderlyingReturnValue
            } else {
                var returnValue: Room?? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomRoomIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomRoomIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomRoomIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getRoomRoomIdClosure: ((String) throws -> Room?)?

    open override func getRoom(roomId: String) throws -> Room? {
        if let error = getRoomRoomIdThrowableError {
            throw error
        }
        getRoomRoomIdCallsCount += 1
        getRoomRoomIdReceivedRoomId = roomId
        DispatchQueue.main.async {
            self.getRoomRoomIdReceivedInvocations.append(roomId)
        }
        if let getRoomRoomIdClosure = getRoomRoomIdClosure {
            return try getRoomRoomIdClosure(roomId)
        } else {
            return getRoomRoomIdReturnValue
        }
    }
}
open class NotificationSettingsSDKMock: MatrixRustSDK.NotificationSettings, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - canHomeserverPushEncryptedEventToDevice

    var canHomeserverPushEncryptedEventToDeviceUnderlyingCallsCount = 0
    open var canHomeserverPushEncryptedEventToDeviceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canHomeserverPushEncryptedEventToDeviceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canHomeserverPushEncryptedEventToDeviceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canHomeserverPushEncryptedEventToDeviceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canHomeserverPushEncryptedEventToDeviceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canHomeserverPushEncryptedEventToDeviceCalled: Bool {
        return canHomeserverPushEncryptedEventToDeviceCallsCount > 0
    }

    var canHomeserverPushEncryptedEventToDeviceUnderlyingReturnValue: Bool!
    open var canHomeserverPushEncryptedEventToDeviceReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canHomeserverPushEncryptedEventToDeviceUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canHomeserverPushEncryptedEventToDeviceUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canHomeserverPushEncryptedEventToDeviceUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canHomeserverPushEncryptedEventToDeviceUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canHomeserverPushEncryptedEventToDeviceClosure: (() async -> Bool)?

    open override func canHomeserverPushEncryptedEventToDevice() async -> Bool {
        canHomeserverPushEncryptedEventToDeviceCallsCount += 1
        if let canHomeserverPushEncryptedEventToDeviceClosure = canHomeserverPushEncryptedEventToDeviceClosure {
            return await canHomeserverPushEncryptedEventToDeviceClosure()
        } else {
            return canHomeserverPushEncryptedEventToDeviceReturnValue
        }
    }

    //MARK: - canPushEncryptedEventToDevice

    var canPushEncryptedEventToDeviceUnderlyingCallsCount = 0
    open var canPushEncryptedEventToDeviceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canPushEncryptedEventToDeviceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canPushEncryptedEventToDeviceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canPushEncryptedEventToDeviceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canPushEncryptedEventToDeviceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canPushEncryptedEventToDeviceCalled: Bool {
        return canPushEncryptedEventToDeviceCallsCount > 0
    }

    var canPushEncryptedEventToDeviceUnderlyingReturnValue: Bool!
    open var canPushEncryptedEventToDeviceReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canPushEncryptedEventToDeviceUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canPushEncryptedEventToDeviceUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canPushEncryptedEventToDeviceUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canPushEncryptedEventToDeviceUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canPushEncryptedEventToDeviceClosure: (() async -> Bool)?

    open override func canPushEncryptedEventToDevice() async -> Bool {
        canPushEncryptedEventToDeviceCallsCount += 1
        if let canPushEncryptedEventToDeviceClosure = canPushEncryptedEventToDeviceClosure {
            return await canPushEncryptedEventToDeviceClosure()
        } else {
            return canPushEncryptedEventToDeviceReturnValue
        }
    }

    //MARK: - containsKeywordsRules

    var containsKeywordsRulesUnderlyingCallsCount = 0
    open var containsKeywordsRulesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return containsKeywordsRulesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = containsKeywordsRulesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                containsKeywordsRulesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    containsKeywordsRulesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var containsKeywordsRulesCalled: Bool {
        return containsKeywordsRulesCallsCount > 0
    }

    var containsKeywordsRulesUnderlyingReturnValue: Bool!
    open var containsKeywordsRulesReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return containsKeywordsRulesUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = containsKeywordsRulesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                containsKeywordsRulesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    containsKeywordsRulesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var containsKeywordsRulesClosure: (() async -> Bool)?

    open override func containsKeywordsRules() async -> Bool {
        containsKeywordsRulesCallsCount += 1
        if let containsKeywordsRulesClosure = containsKeywordsRulesClosure {
            return await containsKeywordsRulesClosure()
        } else {
            return containsKeywordsRulesReturnValue
        }
    }

    //MARK: - getDefaultRoomNotificationMode

    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount = 0
    open var getDefaultRoomNotificationModeIsEncryptedIsOneToOneCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getDefaultRoomNotificationModeIsEncryptedIsOneToOneCalled: Bool {
        return getDefaultRoomNotificationModeIsEncryptedIsOneToOneCallsCount > 0
    }
    open var getDefaultRoomNotificationModeIsEncryptedIsOneToOneReceivedArguments: (isEncrypted: Bool, isOneToOne: Bool)?
    open var getDefaultRoomNotificationModeIsEncryptedIsOneToOneReceivedInvocations: [(isEncrypted: Bool, isOneToOne: Bool)] = []

    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue: RoomNotificationMode!
    open var getDefaultRoomNotificationModeIsEncryptedIsOneToOneReturnValue: RoomNotificationMode! {
        get {
            if Thread.isMainThread {
                return getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue
            } else {
                var returnValue: RoomNotificationMode? = nil
                DispatchQueue.main.sync {
                    returnValue = getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getDefaultRoomNotificationModeIsEncryptedIsOneToOneClosure: ((Bool, Bool) async -> RoomNotificationMode)?

    open override func getDefaultRoomNotificationMode(isEncrypted: Bool, isOneToOne: Bool) async -> RoomNotificationMode {
        getDefaultRoomNotificationModeIsEncryptedIsOneToOneCallsCount += 1
        getDefaultRoomNotificationModeIsEncryptedIsOneToOneReceivedArguments = (isEncrypted: isEncrypted, isOneToOne: isOneToOne)
        DispatchQueue.main.async {
            self.getDefaultRoomNotificationModeIsEncryptedIsOneToOneReceivedInvocations.append((isEncrypted: isEncrypted, isOneToOne: isOneToOne))
        }
        if let getDefaultRoomNotificationModeIsEncryptedIsOneToOneClosure = getDefaultRoomNotificationModeIsEncryptedIsOneToOneClosure {
            return await getDefaultRoomNotificationModeIsEncryptedIsOneToOneClosure(isEncrypted, isOneToOne)
        } else {
            return getDefaultRoomNotificationModeIsEncryptedIsOneToOneReturnValue
        }
    }

    //MARK: - getRoomNotificationSettings

    open var getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneThrowableError: Error?
    var getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = 0
    open var getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneCalled: Bool {
        return getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneCallsCount > 0
    }
    open var getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneReceivedArguments: (roomId: String, isEncrypted: Bool, isOneToOne: Bool)?
    open var getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneReceivedInvocations: [(roomId: String, isEncrypted: Bool, isOneToOne: Bool)] = []

    var getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue: RoomNotificationSettings!
    open var getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneReturnValue: RoomNotificationSettings! {
        get {
            if Thread.isMainThread {
                return getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue
            } else {
                var returnValue: RoomNotificationSettings? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneClosure: ((String, Bool, Bool) async throws -> RoomNotificationSettings)?

    open override func getRoomNotificationSettings(roomId: String, isEncrypted: Bool, isOneToOne: Bool) async throws -> RoomNotificationSettings {
        if let error = getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneThrowableError {
            throw error
        }
        getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneCallsCount += 1
        getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneReceivedArguments = (roomId: roomId, isEncrypted: isEncrypted, isOneToOne: isOneToOne)
        DispatchQueue.main.async {
            self.getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneReceivedInvocations.append((roomId: roomId, isEncrypted: isEncrypted, isOneToOne: isOneToOne))
        }
        if let getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneClosure = getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneClosure {
            return try await getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneClosure(roomId, isEncrypted, isOneToOne)
        } else {
            return getRoomNotificationSettingsRoomIdIsEncryptedIsOneToOneReturnValue
        }
    }

    //MARK: - getRoomsWithUserDefinedRules

    var getRoomsWithUserDefinedRulesEnabledUnderlyingCallsCount = 0
    open var getRoomsWithUserDefinedRulesEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getRoomsWithUserDefinedRulesEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomsWithUserDefinedRulesEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomsWithUserDefinedRulesEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomsWithUserDefinedRulesEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getRoomsWithUserDefinedRulesEnabledCalled: Bool {
        return getRoomsWithUserDefinedRulesEnabledCallsCount > 0
    }
    open var getRoomsWithUserDefinedRulesEnabledReceivedEnabled: Bool?
    open var getRoomsWithUserDefinedRulesEnabledReceivedInvocations: [Bool?] = []

    var getRoomsWithUserDefinedRulesEnabledUnderlyingReturnValue: [String]!
    open var getRoomsWithUserDefinedRulesEnabledReturnValue: [String]! {
        get {
            if Thread.isMainThread {
                return getRoomsWithUserDefinedRulesEnabledUnderlyingReturnValue
            } else {
                var returnValue: [String]? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomsWithUserDefinedRulesEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomsWithUserDefinedRulesEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomsWithUserDefinedRulesEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getRoomsWithUserDefinedRulesEnabledClosure: ((Bool?) async -> [String])?

    open override func getRoomsWithUserDefinedRules(enabled: Bool?) async -> [String] {
        getRoomsWithUserDefinedRulesEnabledCallsCount += 1
        getRoomsWithUserDefinedRulesEnabledReceivedEnabled = enabled
        DispatchQueue.main.async {
            self.getRoomsWithUserDefinedRulesEnabledReceivedInvocations.append(enabled)
        }
        if let getRoomsWithUserDefinedRulesEnabledClosure = getRoomsWithUserDefinedRulesEnabledClosure {
            return await getRoomsWithUserDefinedRulesEnabledClosure(enabled)
        } else {
            return getRoomsWithUserDefinedRulesEnabledReturnValue
        }
    }

    //MARK: - getUserDefinedRoomNotificationMode

    open var getUserDefinedRoomNotificationModeRoomIdThrowableError: Error?
    var getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount = 0
    open var getUserDefinedRoomNotificationModeRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getUserDefinedRoomNotificationModeRoomIdCalled: Bool {
        return getUserDefinedRoomNotificationModeRoomIdCallsCount > 0
    }
    open var getUserDefinedRoomNotificationModeRoomIdReceivedRoomId: String?
    open var getUserDefinedRoomNotificationModeRoomIdReceivedInvocations: [String] = []

    var getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue: RoomNotificationMode?
    open var getUserDefinedRoomNotificationModeRoomIdReturnValue: RoomNotificationMode? {
        get {
            if Thread.isMainThread {
                return getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue
            } else {
                var returnValue: RoomNotificationMode?? = nil
                DispatchQueue.main.sync {
                    returnValue = getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getUserDefinedRoomNotificationModeRoomIdClosure: ((String) async throws -> RoomNotificationMode?)?

    open override func getUserDefinedRoomNotificationMode(roomId: String) async throws -> RoomNotificationMode? {
        if let error = getUserDefinedRoomNotificationModeRoomIdThrowableError {
            throw error
        }
        getUserDefinedRoomNotificationModeRoomIdCallsCount += 1
        getUserDefinedRoomNotificationModeRoomIdReceivedRoomId = roomId
        DispatchQueue.main.async {
            self.getUserDefinedRoomNotificationModeRoomIdReceivedInvocations.append(roomId)
        }
        if let getUserDefinedRoomNotificationModeRoomIdClosure = getUserDefinedRoomNotificationModeRoomIdClosure {
            return try await getUserDefinedRoomNotificationModeRoomIdClosure(roomId)
        } else {
            return getUserDefinedRoomNotificationModeRoomIdReturnValue
        }
    }

    //MARK: - isCallEnabled

    open var isCallEnabledThrowableError: Error?
    var isCallEnabledUnderlyingCallsCount = 0
    open var isCallEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isCallEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isCallEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isCallEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isCallEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isCallEnabledCalled: Bool {
        return isCallEnabledCallsCount > 0
    }

    var isCallEnabledUnderlyingReturnValue: Bool!
    open var isCallEnabledReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isCallEnabledUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isCallEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isCallEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isCallEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isCallEnabledClosure: (() async throws -> Bool)?

    open override func isCallEnabled() async throws -> Bool {
        if let error = isCallEnabledThrowableError {
            throw error
        }
        isCallEnabledCallsCount += 1
        if let isCallEnabledClosure = isCallEnabledClosure {
            return try await isCallEnabledClosure()
        } else {
            return isCallEnabledReturnValue
        }
    }

    //MARK: - isInviteForMeEnabled

    open var isInviteForMeEnabledThrowableError: Error?
    var isInviteForMeEnabledUnderlyingCallsCount = 0
    open var isInviteForMeEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isInviteForMeEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isInviteForMeEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isInviteForMeEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isInviteForMeEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isInviteForMeEnabledCalled: Bool {
        return isInviteForMeEnabledCallsCount > 0
    }

    var isInviteForMeEnabledUnderlyingReturnValue: Bool!
    open var isInviteForMeEnabledReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isInviteForMeEnabledUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isInviteForMeEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isInviteForMeEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isInviteForMeEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isInviteForMeEnabledClosure: (() async throws -> Bool)?

    open override func isInviteForMeEnabled() async throws -> Bool {
        if let error = isInviteForMeEnabledThrowableError {
            throw error
        }
        isInviteForMeEnabledCallsCount += 1
        if let isInviteForMeEnabledClosure = isInviteForMeEnabledClosure {
            return try await isInviteForMeEnabledClosure()
        } else {
            return isInviteForMeEnabledReturnValue
        }
    }

    //MARK: - isRoomMentionEnabled

    open var isRoomMentionEnabledThrowableError: Error?
    var isRoomMentionEnabledUnderlyingCallsCount = 0
    open var isRoomMentionEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isRoomMentionEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isRoomMentionEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isRoomMentionEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isRoomMentionEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isRoomMentionEnabledCalled: Bool {
        return isRoomMentionEnabledCallsCount > 0
    }

    var isRoomMentionEnabledUnderlyingReturnValue: Bool!
    open var isRoomMentionEnabledReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isRoomMentionEnabledUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isRoomMentionEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isRoomMentionEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isRoomMentionEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isRoomMentionEnabledClosure: (() async throws -> Bool)?

    open override func isRoomMentionEnabled() async throws -> Bool {
        if let error = isRoomMentionEnabledThrowableError {
            throw error
        }
        isRoomMentionEnabledCallsCount += 1
        if let isRoomMentionEnabledClosure = isRoomMentionEnabledClosure {
            return try await isRoomMentionEnabledClosure()
        } else {
            return isRoomMentionEnabledReturnValue
        }
    }

    //MARK: - isUserMentionEnabled

    open var isUserMentionEnabledThrowableError: Error?
    var isUserMentionEnabledUnderlyingCallsCount = 0
    open var isUserMentionEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isUserMentionEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isUserMentionEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isUserMentionEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isUserMentionEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isUserMentionEnabledCalled: Bool {
        return isUserMentionEnabledCallsCount > 0
    }

    var isUserMentionEnabledUnderlyingReturnValue: Bool!
    open var isUserMentionEnabledReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isUserMentionEnabledUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isUserMentionEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isUserMentionEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isUserMentionEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isUserMentionEnabledClosure: (() async throws -> Bool)?

    open override func isUserMentionEnabled() async throws -> Bool {
        if let error = isUserMentionEnabledThrowableError {
            throw error
        }
        isUserMentionEnabledCallsCount += 1
        if let isUserMentionEnabledClosure = isUserMentionEnabledClosure {
            return try await isUserMentionEnabledClosure()
        } else {
            return isUserMentionEnabledReturnValue
        }
    }

    //MARK: - restoreDefaultRoomNotificationMode

    open var restoreDefaultRoomNotificationModeRoomIdThrowableError: Error?
    var restoreDefaultRoomNotificationModeRoomIdUnderlyingCallsCount = 0
    open var restoreDefaultRoomNotificationModeRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return restoreDefaultRoomNotificationModeRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = restoreDefaultRoomNotificationModeRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                restoreDefaultRoomNotificationModeRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    restoreDefaultRoomNotificationModeRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var restoreDefaultRoomNotificationModeRoomIdCalled: Bool {
        return restoreDefaultRoomNotificationModeRoomIdCallsCount > 0
    }
    open var restoreDefaultRoomNotificationModeRoomIdReceivedRoomId: String?
    open var restoreDefaultRoomNotificationModeRoomIdReceivedInvocations: [String] = []
    open var restoreDefaultRoomNotificationModeRoomIdClosure: ((String) async throws -> Void)?

    open override func restoreDefaultRoomNotificationMode(roomId: String) async throws {
        if let error = restoreDefaultRoomNotificationModeRoomIdThrowableError {
            throw error
        }
        restoreDefaultRoomNotificationModeRoomIdCallsCount += 1
        restoreDefaultRoomNotificationModeRoomIdReceivedRoomId = roomId
        DispatchQueue.main.async {
            self.restoreDefaultRoomNotificationModeRoomIdReceivedInvocations.append(roomId)
        }
        try await restoreDefaultRoomNotificationModeRoomIdClosure?(roomId)
    }

    //MARK: - setCallEnabled

    open var setCallEnabledEnabledThrowableError: Error?
    var setCallEnabledEnabledUnderlyingCallsCount = 0
    open var setCallEnabledEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setCallEnabledEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setCallEnabledEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setCallEnabledEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setCallEnabledEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setCallEnabledEnabledCalled: Bool {
        return setCallEnabledEnabledCallsCount > 0
    }
    open var setCallEnabledEnabledReceivedEnabled: Bool?
    open var setCallEnabledEnabledReceivedInvocations: [Bool] = []
    open var setCallEnabledEnabledClosure: ((Bool) async throws -> Void)?

    open override func setCallEnabled(enabled: Bool) async throws {
        if let error = setCallEnabledEnabledThrowableError {
            throw error
        }
        setCallEnabledEnabledCallsCount += 1
        setCallEnabledEnabledReceivedEnabled = enabled
        DispatchQueue.main.async {
            self.setCallEnabledEnabledReceivedInvocations.append(enabled)
        }
        try await setCallEnabledEnabledClosure?(enabled)
    }

    //MARK: - setCustomPushRule

    open var setCustomPushRuleRuleIdRuleKindActionsConditionsThrowableError: Error?
    var setCustomPushRuleRuleIdRuleKindActionsConditionsUnderlyingCallsCount = 0
    open var setCustomPushRuleRuleIdRuleKindActionsConditionsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setCustomPushRuleRuleIdRuleKindActionsConditionsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setCustomPushRuleRuleIdRuleKindActionsConditionsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setCustomPushRuleRuleIdRuleKindActionsConditionsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setCustomPushRuleRuleIdRuleKindActionsConditionsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setCustomPushRuleRuleIdRuleKindActionsConditionsCalled: Bool {
        return setCustomPushRuleRuleIdRuleKindActionsConditionsCallsCount > 0
    }
    open var setCustomPushRuleRuleIdRuleKindActionsConditionsReceivedArguments: (ruleId: String, ruleKind: RuleKind, actions: [Action], conditions: [PushCondition])?
    open var setCustomPushRuleRuleIdRuleKindActionsConditionsReceivedInvocations: [(ruleId: String, ruleKind: RuleKind, actions: [Action], conditions: [PushCondition])] = []
    open var setCustomPushRuleRuleIdRuleKindActionsConditionsClosure: ((String, RuleKind, [Action], [PushCondition]) async throws -> Void)?

    open override func setCustomPushRule(ruleId: String, ruleKind: RuleKind, actions: [Action], conditions: [PushCondition]) async throws {
        if let error = setCustomPushRuleRuleIdRuleKindActionsConditionsThrowableError {
            throw error
        }
        setCustomPushRuleRuleIdRuleKindActionsConditionsCallsCount += 1
        setCustomPushRuleRuleIdRuleKindActionsConditionsReceivedArguments = (ruleId: ruleId, ruleKind: ruleKind, actions: actions, conditions: conditions)
        DispatchQueue.main.async {
            self.setCustomPushRuleRuleIdRuleKindActionsConditionsReceivedInvocations.append((ruleId: ruleId, ruleKind: ruleKind, actions: actions, conditions: conditions))
        }
        try await setCustomPushRuleRuleIdRuleKindActionsConditionsClosure?(ruleId, ruleKind, actions, conditions)
    }

    //MARK: - setDefaultRoomNotificationMode

    open var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeThrowableError: Error?
    var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount = 0
    open var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeCalled: Bool {
        return setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeCallsCount > 0
    }
    open var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeReceivedArguments: (isEncrypted: Bool, isOneToOne: Bool, mode: RoomNotificationMode)?
    open var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeReceivedInvocations: [(isEncrypted: Bool, isOneToOne: Bool, mode: RoomNotificationMode)] = []
    open var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeClosure: ((Bool, Bool, RoomNotificationMode) async throws -> Void)?

    open override func setDefaultRoomNotificationMode(isEncrypted: Bool, isOneToOne: Bool, mode: RoomNotificationMode) async throws {
        if let error = setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeThrowableError {
            throw error
        }
        setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeCallsCount += 1
        setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeReceivedArguments = (isEncrypted: isEncrypted, isOneToOne: isOneToOne, mode: mode)
        DispatchQueue.main.async {
            self.setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeReceivedInvocations.append((isEncrypted: isEncrypted, isOneToOne: isOneToOne, mode: mode))
        }
        try await setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeClosure?(isEncrypted, isOneToOne, mode)
    }

    //MARK: - setDelegate

    var setDelegateDelegateUnderlyingCallsCount = 0
    open var setDelegateDelegateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setDelegateDelegateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setDelegateDelegateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setDelegateDelegateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setDelegateDelegateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setDelegateDelegateCalled: Bool {
        return setDelegateDelegateCallsCount > 0
    }
    open var setDelegateDelegateReceivedDelegate: NotificationSettingsDelegate?
    open var setDelegateDelegateReceivedInvocations: [NotificationSettingsDelegate?] = []
    open var setDelegateDelegateClosure: ((NotificationSettingsDelegate?) -> Void)?

    open override func setDelegate(delegate: NotificationSettingsDelegate?) {
        setDelegateDelegateCallsCount += 1
        setDelegateDelegateReceivedDelegate = delegate
        DispatchQueue.main.async {
            self.setDelegateDelegateReceivedInvocations.append(delegate)
        }
        setDelegateDelegateClosure?(delegate)
    }

    //MARK: - setInviteForMeEnabled

    open var setInviteForMeEnabledEnabledThrowableError: Error?
    var setInviteForMeEnabledEnabledUnderlyingCallsCount = 0
    open var setInviteForMeEnabledEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setInviteForMeEnabledEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setInviteForMeEnabledEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setInviteForMeEnabledEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setInviteForMeEnabledEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setInviteForMeEnabledEnabledCalled: Bool {
        return setInviteForMeEnabledEnabledCallsCount > 0
    }
    open var setInviteForMeEnabledEnabledReceivedEnabled: Bool?
    open var setInviteForMeEnabledEnabledReceivedInvocations: [Bool] = []
    open var setInviteForMeEnabledEnabledClosure: ((Bool) async throws -> Void)?

    open override func setInviteForMeEnabled(enabled: Bool) async throws {
        if let error = setInviteForMeEnabledEnabledThrowableError {
            throw error
        }
        setInviteForMeEnabledEnabledCallsCount += 1
        setInviteForMeEnabledEnabledReceivedEnabled = enabled
        DispatchQueue.main.async {
            self.setInviteForMeEnabledEnabledReceivedInvocations.append(enabled)
        }
        try await setInviteForMeEnabledEnabledClosure?(enabled)
    }

    //MARK: - setRoomMentionEnabled

    open var setRoomMentionEnabledEnabledThrowableError: Error?
    var setRoomMentionEnabledEnabledUnderlyingCallsCount = 0
    open var setRoomMentionEnabledEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setRoomMentionEnabledEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setRoomMentionEnabledEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setRoomMentionEnabledEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setRoomMentionEnabledEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setRoomMentionEnabledEnabledCalled: Bool {
        return setRoomMentionEnabledEnabledCallsCount > 0
    }
    open var setRoomMentionEnabledEnabledReceivedEnabled: Bool?
    open var setRoomMentionEnabledEnabledReceivedInvocations: [Bool] = []
    open var setRoomMentionEnabledEnabledClosure: ((Bool) async throws -> Void)?

    open override func setRoomMentionEnabled(enabled: Bool) async throws {
        if let error = setRoomMentionEnabledEnabledThrowableError {
            throw error
        }
        setRoomMentionEnabledEnabledCallsCount += 1
        setRoomMentionEnabledEnabledReceivedEnabled = enabled
        DispatchQueue.main.async {
            self.setRoomMentionEnabledEnabledReceivedInvocations.append(enabled)
        }
        try await setRoomMentionEnabledEnabledClosure?(enabled)
    }

    //MARK: - setRoomNotificationMode

    open var setRoomNotificationModeRoomIdModeThrowableError: Error?
    var setRoomNotificationModeRoomIdModeUnderlyingCallsCount = 0
    open var setRoomNotificationModeRoomIdModeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setRoomNotificationModeRoomIdModeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setRoomNotificationModeRoomIdModeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setRoomNotificationModeRoomIdModeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setRoomNotificationModeRoomIdModeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setRoomNotificationModeRoomIdModeCalled: Bool {
        return setRoomNotificationModeRoomIdModeCallsCount > 0
    }
    open var setRoomNotificationModeRoomIdModeReceivedArguments: (roomId: String, mode: RoomNotificationMode)?
    open var setRoomNotificationModeRoomIdModeReceivedInvocations: [(roomId: String, mode: RoomNotificationMode)] = []
    open var setRoomNotificationModeRoomIdModeClosure: ((String, RoomNotificationMode) async throws -> Void)?

    open override func setRoomNotificationMode(roomId: String, mode: RoomNotificationMode) async throws {
        if let error = setRoomNotificationModeRoomIdModeThrowableError {
            throw error
        }
        setRoomNotificationModeRoomIdModeCallsCount += 1
        setRoomNotificationModeRoomIdModeReceivedArguments = (roomId: roomId, mode: mode)
        DispatchQueue.main.async {
            self.setRoomNotificationModeRoomIdModeReceivedInvocations.append((roomId: roomId, mode: mode))
        }
        try await setRoomNotificationModeRoomIdModeClosure?(roomId, mode)
    }

    //MARK: - setUserMentionEnabled

    open var setUserMentionEnabledEnabledThrowableError: Error?
    var setUserMentionEnabledEnabledUnderlyingCallsCount = 0
    open var setUserMentionEnabledEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setUserMentionEnabledEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setUserMentionEnabledEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUserMentionEnabledEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setUserMentionEnabledEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setUserMentionEnabledEnabledCalled: Bool {
        return setUserMentionEnabledEnabledCallsCount > 0
    }
    open var setUserMentionEnabledEnabledReceivedEnabled: Bool?
    open var setUserMentionEnabledEnabledReceivedInvocations: [Bool] = []
    open var setUserMentionEnabledEnabledClosure: ((Bool) async throws -> Void)?

    open override func setUserMentionEnabled(enabled: Bool) async throws {
        if let error = setUserMentionEnabledEnabledThrowableError {
            throw error
        }
        setUserMentionEnabledEnabledCallsCount += 1
        setUserMentionEnabledEnabledReceivedEnabled = enabled
        DispatchQueue.main.async {
            self.setUserMentionEnabledEnabledReceivedInvocations.append(enabled)
        }
        try await setUserMentionEnabledEnabledClosure?(enabled)
    }

    //MARK: - unmuteRoom

    open var unmuteRoomRoomIdIsEncryptedIsOneToOneThrowableError: Error?
    var unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = 0
    open var unmuteRoomRoomIdIsEncryptedIsOneToOneCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var unmuteRoomRoomIdIsEncryptedIsOneToOneCalled: Bool {
        return unmuteRoomRoomIdIsEncryptedIsOneToOneCallsCount > 0
    }
    open var unmuteRoomRoomIdIsEncryptedIsOneToOneReceivedArguments: (roomId: String, isEncrypted: Bool, isOneToOne: Bool)?
    open var unmuteRoomRoomIdIsEncryptedIsOneToOneReceivedInvocations: [(roomId: String, isEncrypted: Bool, isOneToOne: Bool)] = []
    open var unmuteRoomRoomIdIsEncryptedIsOneToOneClosure: ((String, Bool, Bool) async throws -> Void)?

    open override func unmuteRoom(roomId: String, isEncrypted: Bool, isOneToOne: Bool) async throws {
        if let error = unmuteRoomRoomIdIsEncryptedIsOneToOneThrowableError {
            throw error
        }
        unmuteRoomRoomIdIsEncryptedIsOneToOneCallsCount += 1
        unmuteRoomRoomIdIsEncryptedIsOneToOneReceivedArguments = (roomId: roomId, isEncrypted: isEncrypted, isOneToOne: isOneToOne)
        DispatchQueue.main.async {
            self.unmuteRoomRoomIdIsEncryptedIsOneToOneReceivedInvocations.append((roomId: roomId, isEncrypted: isEncrypted, isOneToOne: isOneToOne))
        }
        try await unmuteRoomRoomIdIsEncryptedIsOneToOneClosure?(roomId, isEncrypted, isOneToOne)
    }
}
open class OAuthAuthorizationDataSDKMock: MatrixRustSDK.OAuthAuthorizationData, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - loginUrl

    var loginUrlUnderlyingCallsCount = 0
    open var loginUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loginUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loginUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loginUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loginUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var loginUrlCalled: Bool {
        return loginUrlCallsCount > 0
    }

    var loginUrlUnderlyingReturnValue: String!
    open var loginUrlReturnValue: String! {
        get {
            if Thread.isMainThread {
                return loginUrlUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = loginUrlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loginUrlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loginUrlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var loginUrlClosure: (() -> String)?

    open override func loginUrl() -> String {
        loginUrlCallsCount += 1
        if let loginUrlClosure = loginUrlClosure {
            return loginUrlClosure()
        } else {
            return loginUrlReturnValue
        }
    }
}
open class QrCodeDataSDKMock: MatrixRustSDK.QrCodeData, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!
    static func reset()
    {
    }

    //MARK: - serverName

    var serverNameUnderlyingCallsCount = 0
    open var serverNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return serverNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = serverNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                serverNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    serverNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var serverNameCalled: Bool {
        return serverNameCallsCount > 0
    }

    var serverNameUnderlyingReturnValue: String?
    open var serverNameReturnValue: String? {
        get {
            if Thread.isMainThread {
                return serverNameUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = serverNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                serverNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    serverNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var serverNameClosure: (() -> String?)?

    open override func serverName() -> String? {
        serverNameCallsCount += 1
        if let serverNameClosure = serverNameClosure {
            return serverNameClosure()
        } else {
            return serverNameReturnValue
        }
    }
}
open class RoomSDKMock: MatrixRustSDK.Room, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - activeMembersCount

    var activeMembersCountUnderlyingCallsCount = 0
    open var activeMembersCountCallsCount: Int {
        get {
            if Thread.isMainThread {
                return activeMembersCountUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = activeMembersCountUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                activeMembersCountUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    activeMembersCountUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var activeMembersCountCalled: Bool {
        return activeMembersCountCallsCount > 0
    }

    var activeMembersCountUnderlyingReturnValue: UInt64!
    open var activeMembersCountReturnValue: UInt64! {
        get {
            if Thread.isMainThread {
                return activeMembersCountUnderlyingReturnValue
            } else {
                var returnValue: UInt64? = nil
                DispatchQueue.main.sync {
                    returnValue = activeMembersCountUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                activeMembersCountUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    activeMembersCountUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var activeMembersCountClosure: (() -> UInt64)?

    open override func activeMembersCount() -> UInt64 {
        activeMembersCountCallsCount += 1
        if let activeMembersCountClosure = activeMembersCountClosure {
            return activeMembersCountClosure()
        } else {
            return activeMembersCountReturnValue
        }
    }

    //MARK: - activeRoomCallParticipants

    var activeRoomCallParticipantsUnderlyingCallsCount = 0
    open var activeRoomCallParticipantsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return activeRoomCallParticipantsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = activeRoomCallParticipantsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                activeRoomCallParticipantsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    activeRoomCallParticipantsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var activeRoomCallParticipantsCalled: Bool {
        return activeRoomCallParticipantsCallsCount > 0
    }

    var activeRoomCallParticipantsUnderlyingReturnValue: [String]!
    open var activeRoomCallParticipantsReturnValue: [String]! {
        get {
            if Thread.isMainThread {
                return activeRoomCallParticipantsUnderlyingReturnValue
            } else {
                var returnValue: [String]? = nil
                DispatchQueue.main.sync {
                    returnValue = activeRoomCallParticipantsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                activeRoomCallParticipantsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    activeRoomCallParticipantsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var activeRoomCallParticipantsClosure: (() -> [String])?

    open override func activeRoomCallParticipants() -> [String] {
        activeRoomCallParticipantsCallsCount += 1
        if let activeRoomCallParticipantsClosure = activeRoomCallParticipantsClosure {
            return activeRoomCallParticipantsClosure()
        } else {
            return activeRoomCallParticipantsReturnValue
        }
    }

    //MARK: - alternativeAliases

    var alternativeAliasesUnderlyingCallsCount = 0
    open var alternativeAliasesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return alternativeAliasesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = alternativeAliasesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                alternativeAliasesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    alternativeAliasesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var alternativeAliasesCalled: Bool {
        return alternativeAliasesCallsCount > 0
    }

    var alternativeAliasesUnderlyingReturnValue: [String]!
    open var alternativeAliasesReturnValue: [String]! {
        get {
            if Thread.isMainThread {
                return alternativeAliasesUnderlyingReturnValue
            } else {
                var returnValue: [String]? = nil
                DispatchQueue.main.sync {
                    returnValue = alternativeAliasesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                alternativeAliasesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    alternativeAliasesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var alternativeAliasesClosure: (() -> [String])?

    open override func alternativeAliases() -> [String] {
        alternativeAliasesCallsCount += 1
        if let alternativeAliasesClosure = alternativeAliasesClosure {
            return alternativeAliasesClosure()
        } else {
            return alternativeAliasesReturnValue
        }
    }

    //MARK: - applyPowerLevelChanges

    open var applyPowerLevelChangesChangesThrowableError: Error?
    var applyPowerLevelChangesChangesUnderlyingCallsCount = 0
    open var applyPowerLevelChangesChangesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return applyPowerLevelChangesChangesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = applyPowerLevelChangesChangesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                applyPowerLevelChangesChangesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    applyPowerLevelChangesChangesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var applyPowerLevelChangesChangesCalled: Bool {
        return applyPowerLevelChangesChangesCallsCount > 0
    }
    open var applyPowerLevelChangesChangesReceivedChanges: RoomPowerLevelChanges?
    open var applyPowerLevelChangesChangesReceivedInvocations: [RoomPowerLevelChanges] = []
    open var applyPowerLevelChangesChangesClosure: ((RoomPowerLevelChanges) async throws -> Void)?

    open override func applyPowerLevelChanges(changes: RoomPowerLevelChanges) async throws {
        if let error = applyPowerLevelChangesChangesThrowableError {
            throw error
        }
        applyPowerLevelChangesChangesCallsCount += 1
        applyPowerLevelChangesChangesReceivedChanges = changes
        DispatchQueue.main.async {
            self.applyPowerLevelChangesChangesReceivedInvocations.append(changes)
        }
        try await applyPowerLevelChangesChangesClosure?(changes)
    }

    //MARK: - avatarUrl

    var avatarUrlUnderlyingCallsCount = 0
    open var avatarUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return avatarUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = avatarUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                avatarUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    avatarUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var avatarUrlCalled: Bool {
        return avatarUrlCallsCount > 0
    }

    var avatarUrlUnderlyingReturnValue: String?
    open var avatarUrlReturnValue: String? {
        get {
            if Thread.isMainThread {
                return avatarUrlUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = avatarUrlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                avatarUrlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    avatarUrlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var avatarUrlClosure: (() -> String?)?

    open override func avatarUrl() -> String? {
        avatarUrlCallsCount += 1
        if let avatarUrlClosure = avatarUrlClosure {
            return avatarUrlClosure()
        } else {
            return avatarUrlReturnValue
        }
    }

    //MARK: - banUser

    open var banUserUserIdReasonThrowableError: Error?
    var banUserUserIdReasonUnderlyingCallsCount = 0
    open var banUserUserIdReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return banUserUserIdReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = banUserUserIdReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                banUserUserIdReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    banUserUserIdReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var banUserUserIdReasonCalled: Bool {
        return banUserUserIdReasonCallsCount > 0
    }
    open var banUserUserIdReasonReceivedArguments: (userId: String, reason: String?)?
    open var banUserUserIdReasonReceivedInvocations: [(userId: String, reason: String?)] = []
    open var banUserUserIdReasonClosure: ((String, String?) async throws -> Void)?

    open override func banUser(userId: String, reason: String?) async throws {
        if let error = banUserUserIdReasonThrowableError {
            throw error
        }
        banUserUserIdReasonCallsCount += 1
        banUserUserIdReasonReceivedArguments = (userId: userId, reason: reason)
        DispatchQueue.main.async {
            self.banUserUserIdReasonReceivedInvocations.append((userId: userId, reason: reason))
        }
        try await banUserUserIdReasonClosure?(userId, reason)
    }

    //MARK: - canonicalAlias

    var canonicalAliasUnderlyingCallsCount = 0
    open var canonicalAliasCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canonicalAliasUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canonicalAliasUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canonicalAliasUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canonicalAliasUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canonicalAliasCalled: Bool {
        return canonicalAliasCallsCount > 0
    }

    var canonicalAliasUnderlyingReturnValue: String?
    open var canonicalAliasReturnValue: String? {
        get {
            if Thread.isMainThread {
                return canonicalAliasUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = canonicalAliasUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canonicalAliasUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canonicalAliasUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canonicalAliasClosure: (() -> String?)?

    open override func canonicalAlias() -> String? {
        canonicalAliasCallsCount += 1
        if let canonicalAliasClosure = canonicalAliasClosure {
            return canonicalAliasClosure()
        } else {
            return canonicalAliasReturnValue
        }
    }

    //MARK: - clearComposerDraft

    open var clearComposerDraftThreadRootThrowableError: Error?
    var clearComposerDraftThreadRootUnderlyingCallsCount = 0
    open var clearComposerDraftThreadRootCallsCount: Int {
        get {
            if Thread.isMainThread {
                return clearComposerDraftThreadRootUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = clearComposerDraftThreadRootUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                clearComposerDraftThreadRootUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    clearComposerDraftThreadRootUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var clearComposerDraftThreadRootCalled: Bool {
        return clearComposerDraftThreadRootCallsCount > 0
    }
    open var clearComposerDraftThreadRootReceivedThreadRoot: String?
    open var clearComposerDraftThreadRootReceivedInvocations: [String?] = []
    open var clearComposerDraftThreadRootClosure: ((String?) async throws -> Void)?

    open override func clearComposerDraft(threadRoot: String?) async throws {
        if let error = clearComposerDraftThreadRootThrowableError {
            throw error
        }
        clearComposerDraftThreadRootCallsCount += 1
        clearComposerDraftThreadRootReceivedThreadRoot = threadRoot
        DispatchQueue.main.async {
            self.clearComposerDraftThreadRootReceivedInvocations.append(threadRoot)
        }
        try await clearComposerDraftThreadRootClosure?(threadRoot)
    }

    //MARK: - clearEventCacheStorage

    open var clearEventCacheStorageThrowableError: Error?
    var clearEventCacheStorageUnderlyingCallsCount = 0
    open var clearEventCacheStorageCallsCount: Int {
        get {
            if Thread.isMainThread {
                return clearEventCacheStorageUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = clearEventCacheStorageUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                clearEventCacheStorageUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    clearEventCacheStorageUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var clearEventCacheStorageCalled: Bool {
        return clearEventCacheStorageCallsCount > 0
    }
    open var clearEventCacheStorageClosure: (() async throws -> Void)?

    open override func clearEventCacheStorage() async throws {
        if let error = clearEventCacheStorageThrowableError {
            throw error
        }
        clearEventCacheStorageCallsCount += 1
        try await clearEventCacheStorageClosure?()
    }

    //MARK: - discardRoomKey

    open var discardRoomKeyThrowableError: Error?
    var discardRoomKeyUnderlyingCallsCount = 0
    open var discardRoomKeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return discardRoomKeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = discardRoomKeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                discardRoomKeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    discardRoomKeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var discardRoomKeyCalled: Bool {
        return discardRoomKeyCallsCount > 0
    }
    open var discardRoomKeyClosure: (() async throws -> Void)?

    open override func discardRoomKey() async throws {
        if let error = discardRoomKeyThrowableError {
            throw error
        }
        discardRoomKeyCallsCount += 1
        try await discardRoomKeyClosure?()
    }

    //MARK: - displayName

    var displayNameUnderlyingCallsCount = 0
    open var displayNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return displayNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = displayNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                displayNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    displayNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var displayNameCalled: Bool {
        return displayNameCallsCount > 0
    }

    var displayNameUnderlyingReturnValue: String?
    open var displayNameReturnValue: String? {
        get {
            if Thread.isMainThread {
                return displayNameUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = displayNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                displayNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    displayNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var displayNameClosure: (() -> String?)?

    open override func displayName() -> String? {
        displayNameCallsCount += 1
        if let displayNameClosure = displayNameClosure {
            return displayNameClosure()
        } else {
            return displayNameReturnValue
        }
    }

    //MARK: - edit

    open var editEventIdNewContentThrowableError: Error?
    var editEventIdNewContentUnderlyingCallsCount = 0
    open var editEventIdNewContentCallsCount: Int {
        get {
            if Thread.isMainThread {
                return editEventIdNewContentUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = editEventIdNewContentUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                editEventIdNewContentUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    editEventIdNewContentUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var editEventIdNewContentCalled: Bool {
        return editEventIdNewContentCallsCount > 0
    }
    open var editEventIdNewContentReceivedArguments: (eventId: String, newContent: RoomMessageEventContentWithoutRelation)?
    open var editEventIdNewContentReceivedInvocations: [(eventId: String, newContent: RoomMessageEventContentWithoutRelation)] = []
    open var editEventIdNewContentClosure: ((String, RoomMessageEventContentWithoutRelation) async throws -> Void)?

    open override func edit(eventId: String, newContent: RoomMessageEventContentWithoutRelation) async throws {
        if let error = editEventIdNewContentThrowableError {
            throw error
        }
        editEventIdNewContentCallsCount += 1
        editEventIdNewContentReceivedArguments = (eventId: eventId, newContent: newContent)
        DispatchQueue.main.async {
            self.editEventIdNewContentReceivedInvocations.append((eventId: eventId, newContent: newContent))
        }
        try await editEventIdNewContentClosure?(eventId, newContent)
    }

    //MARK: - enableEncryption

    open var enableEncryptionThrowableError: Error?
    var enableEncryptionUnderlyingCallsCount = 0
    open var enableEncryptionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enableEncryptionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enableEncryptionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableEncryptionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enableEncryptionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var enableEncryptionCalled: Bool {
        return enableEncryptionCallsCount > 0
    }
    open var enableEncryptionClosure: (() async throws -> Void)?

    open override func enableEncryption() async throws {
        if let error = enableEncryptionThrowableError {
            throw error
        }
        enableEncryptionCallsCount += 1
        try await enableEncryptionClosure?()
    }

    //MARK: - enableSendQueue

    var enableSendQueueEnableUnderlyingCallsCount = 0
    open var enableSendQueueEnableCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enableSendQueueEnableUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enableSendQueueEnableUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableSendQueueEnableUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enableSendQueueEnableUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var enableSendQueueEnableCalled: Bool {
        return enableSendQueueEnableCallsCount > 0
    }
    open var enableSendQueueEnableReceivedEnable: Bool?
    open var enableSendQueueEnableReceivedInvocations: [Bool] = []
    open var enableSendQueueEnableClosure: ((Bool) -> Void)?

    open override func enableSendQueue(enable: Bool) {
        enableSendQueueEnableCallsCount += 1
        enableSendQueueEnableReceivedEnable = enable
        DispatchQueue.main.async {
            self.enableSendQueueEnableReceivedInvocations.append(enable)
        }
        enableSendQueueEnableClosure?(enable)
    }

    //MARK: - encryptionState

    var encryptionStateUnderlyingCallsCount = 0
    open var encryptionStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return encryptionStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = encryptionStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                encryptionStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    encryptionStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var encryptionStateCalled: Bool {
        return encryptionStateCallsCount > 0
    }

    var encryptionStateUnderlyingReturnValue: EncryptionState!
    open var encryptionStateReturnValue: EncryptionState! {
        get {
            if Thread.isMainThread {
                return encryptionStateUnderlyingReturnValue
            } else {
                var returnValue: EncryptionState? = nil
                DispatchQueue.main.sync {
                    returnValue = encryptionStateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                encryptionStateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    encryptionStateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var encryptionStateClosure: (() -> EncryptionState)?

    open override func encryptionState() -> EncryptionState {
        encryptionStateCallsCount += 1
        if let encryptionStateClosure = encryptionStateClosure {
            return encryptionStateClosure()
        } else {
            return encryptionStateReturnValue
        }
    }

    //MARK: - forget

    open var forgetThrowableError: Error?
    var forgetUnderlyingCallsCount = 0
    open var forgetCallsCount: Int {
        get {
            if Thread.isMainThread {
                return forgetUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = forgetUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                forgetUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    forgetUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var forgetCalled: Bool {
        return forgetCallsCount > 0
    }
    open var forgetClosure: (() async throws -> Void)?

    open override func forget() async throws {
        if let error = forgetThrowableError {
            throw error
        }
        forgetCallsCount += 1
        try await forgetClosure?()
    }

    //MARK: - getPowerLevels

    open var getPowerLevelsThrowableError: Error?
    var getPowerLevelsUnderlyingCallsCount = 0
    open var getPowerLevelsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getPowerLevelsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getPowerLevelsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getPowerLevelsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getPowerLevelsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getPowerLevelsCalled: Bool {
        return getPowerLevelsCallsCount > 0
    }

    var getPowerLevelsUnderlyingReturnValue: RoomPowerLevels!
    open var getPowerLevelsReturnValue: RoomPowerLevels! {
        get {
            if Thread.isMainThread {
                return getPowerLevelsUnderlyingReturnValue
            } else {
                var returnValue: RoomPowerLevels? = nil
                DispatchQueue.main.sync {
                    returnValue = getPowerLevelsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getPowerLevelsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getPowerLevelsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getPowerLevelsClosure: (() async throws -> RoomPowerLevels)?

    open override func getPowerLevels() async throws -> RoomPowerLevels {
        if let error = getPowerLevelsThrowableError {
            throw error
        }
        getPowerLevelsCallsCount += 1
        if let getPowerLevelsClosure = getPowerLevelsClosure {
            return try await getPowerLevelsClosure()
        } else {
            return getPowerLevelsReturnValue
        }
    }

    //MARK: - getRoomVisibility

    open var getRoomVisibilityThrowableError: Error?
    var getRoomVisibilityUnderlyingCallsCount = 0
    open var getRoomVisibilityCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getRoomVisibilityUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomVisibilityUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomVisibilityUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomVisibilityUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getRoomVisibilityCalled: Bool {
        return getRoomVisibilityCallsCount > 0
    }

    var getRoomVisibilityUnderlyingReturnValue: RoomVisibility!
    open var getRoomVisibilityReturnValue: RoomVisibility! {
        get {
            if Thread.isMainThread {
                return getRoomVisibilityUnderlyingReturnValue
            } else {
                var returnValue: RoomVisibility? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomVisibilityUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomVisibilityUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomVisibilityUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getRoomVisibilityClosure: (() async throws -> RoomVisibility)?

    open override func getRoomVisibility() async throws -> RoomVisibility {
        if let error = getRoomVisibilityThrowableError {
            throw error
        }
        getRoomVisibilityCallsCount += 1
        if let getRoomVisibilityClosure = getRoomVisibilityClosure {
            return try await getRoomVisibilityClosure()
        } else {
            return getRoomVisibilityReturnValue
        }
    }

    //MARK: - hasActiveRoomCall

    var hasActiveRoomCallUnderlyingCallsCount = 0
    open var hasActiveRoomCallCallsCount: Int {
        get {
            if Thread.isMainThread {
                return hasActiveRoomCallUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = hasActiveRoomCallUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                hasActiveRoomCallUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    hasActiveRoomCallUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var hasActiveRoomCallCalled: Bool {
        return hasActiveRoomCallCallsCount > 0
    }

    var hasActiveRoomCallUnderlyingReturnValue: Bool!
    open var hasActiveRoomCallReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return hasActiveRoomCallUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = hasActiveRoomCallUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                hasActiveRoomCallUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    hasActiveRoomCallUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var hasActiveRoomCallClosure: (() -> Bool)?

    open override func hasActiveRoomCall() -> Bool {
        hasActiveRoomCallCallsCount += 1
        if let hasActiveRoomCallClosure = hasActiveRoomCallClosure {
            return hasActiveRoomCallClosure()
        } else {
            return hasActiveRoomCallReturnValue
        }
    }

    //MARK: - heroes

    var heroesUnderlyingCallsCount = 0
    open var heroesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return heroesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = heroesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                heroesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    heroesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var heroesCalled: Bool {
        return heroesCallsCount > 0
    }

    var heroesUnderlyingReturnValue: [RoomHero]!
    open var heroesReturnValue: [RoomHero]! {
        get {
            if Thread.isMainThread {
                return heroesUnderlyingReturnValue
            } else {
                var returnValue: [RoomHero]? = nil
                DispatchQueue.main.sync {
                    returnValue = heroesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                heroesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    heroesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var heroesClosure: (() -> [RoomHero])?

    open override func heroes() -> [RoomHero] {
        heroesCallsCount += 1
        if let heroesClosure = heroesClosure {
            return heroesClosure()
        } else {
            return heroesReturnValue
        }
    }

    //MARK: - id

    var idUnderlyingCallsCount = 0
    open var idCallsCount: Int {
        get {
            if Thread.isMainThread {
                return idUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = idUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                idUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    idUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var idCalled: Bool {
        return idCallsCount > 0
    }

    var idUnderlyingReturnValue: String!
    open var idReturnValue: String! {
        get {
            if Thread.isMainThread {
                return idUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = idUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                idUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    idUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var idClosure: (() -> String)?

    open override func id() -> String {
        idCallsCount += 1
        if let idClosure = idClosure {
            return idClosure()
        } else {
            return idReturnValue
        }
    }

    //MARK: - ignoreDeviceTrustAndResend

    open var ignoreDeviceTrustAndResendDevicesSendHandleThrowableError: Error?
    var ignoreDeviceTrustAndResendDevicesSendHandleUnderlyingCallsCount = 0
    open var ignoreDeviceTrustAndResendDevicesSendHandleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return ignoreDeviceTrustAndResendDevicesSendHandleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = ignoreDeviceTrustAndResendDevicesSendHandleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ignoreDeviceTrustAndResendDevicesSendHandleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    ignoreDeviceTrustAndResendDevicesSendHandleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var ignoreDeviceTrustAndResendDevicesSendHandleCalled: Bool {
        return ignoreDeviceTrustAndResendDevicesSendHandleCallsCount > 0
    }
    open var ignoreDeviceTrustAndResendDevicesSendHandleReceivedArguments: (devices: [String: [String]], sendHandle: SendHandle)?
    open var ignoreDeviceTrustAndResendDevicesSendHandleReceivedInvocations: [(devices: [String: [String]], sendHandle: SendHandle)] = []
    open var ignoreDeviceTrustAndResendDevicesSendHandleClosure: (([String: [String]], SendHandle) async throws -> Void)?

    open override func ignoreDeviceTrustAndResend(devices: [String: [String]], sendHandle: SendHandle) async throws {
        if let error = ignoreDeviceTrustAndResendDevicesSendHandleThrowableError {
            throw error
        }
        ignoreDeviceTrustAndResendDevicesSendHandleCallsCount += 1
        ignoreDeviceTrustAndResendDevicesSendHandleReceivedArguments = (devices: devices, sendHandle: sendHandle)
        DispatchQueue.main.async {
            self.ignoreDeviceTrustAndResendDevicesSendHandleReceivedInvocations.append((devices: devices, sendHandle: sendHandle))
        }
        try await ignoreDeviceTrustAndResendDevicesSendHandleClosure?(devices, sendHandle)
    }

    //MARK: - ignoreUser

    open var ignoreUserUserIdThrowableError: Error?
    var ignoreUserUserIdUnderlyingCallsCount = 0
    open var ignoreUserUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return ignoreUserUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = ignoreUserUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ignoreUserUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    ignoreUserUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var ignoreUserUserIdCalled: Bool {
        return ignoreUserUserIdCallsCount > 0
    }
    open var ignoreUserUserIdReceivedUserId: String?
    open var ignoreUserUserIdReceivedInvocations: [String] = []
    open var ignoreUserUserIdClosure: ((String) async throws -> Void)?

    open override func ignoreUser(userId: String) async throws {
        if let error = ignoreUserUserIdThrowableError {
            throw error
        }
        ignoreUserUserIdCallsCount += 1
        ignoreUserUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.ignoreUserUserIdReceivedInvocations.append(userId)
        }
        try await ignoreUserUserIdClosure?(userId)
    }

    //MARK: - inviteUserById

    open var inviteUserByIdUserIdThrowableError: Error?
    var inviteUserByIdUserIdUnderlyingCallsCount = 0
    open var inviteUserByIdUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return inviteUserByIdUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = inviteUserByIdUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                inviteUserByIdUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    inviteUserByIdUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var inviteUserByIdUserIdCalled: Bool {
        return inviteUserByIdUserIdCallsCount > 0
    }
    open var inviteUserByIdUserIdReceivedUserId: String?
    open var inviteUserByIdUserIdReceivedInvocations: [String] = []
    open var inviteUserByIdUserIdClosure: ((String) async throws -> Void)?

    open override func inviteUserById(userId: String) async throws {
        if let error = inviteUserByIdUserIdThrowableError {
            throw error
        }
        inviteUserByIdUserIdCallsCount += 1
        inviteUserByIdUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.inviteUserByIdUserIdReceivedInvocations.append(userId)
        }
        try await inviteUserByIdUserIdClosure?(userId)
    }

    //MARK: - invitedMembersCount

    var invitedMembersCountUnderlyingCallsCount = 0
    open var invitedMembersCountCallsCount: Int {
        get {
            if Thread.isMainThread {
                return invitedMembersCountUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = invitedMembersCountUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                invitedMembersCountUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    invitedMembersCountUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var invitedMembersCountCalled: Bool {
        return invitedMembersCountCallsCount > 0
    }

    var invitedMembersCountUnderlyingReturnValue: UInt64!
    open var invitedMembersCountReturnValue: UInt64! {
        get {
            if Thread.isMainThread {
                return invitedMembersCountUnderlyingReturnValue
            } else {
                var returnValue: UInt64? = nil
                DispatchQueue.main.sync {
                    returnValue = invitedMembersCountUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                invitedMembersCountUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    invitedMembersCountUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var invitedMembersCountClosure: (() -> UInt64)?

    open override func invitedMembersCount() -> UInt64 {
        invitedMembersCountCallsCount += 1
        if let invitedMembersCountClosure = invitedMembersCountClosure {
            return invitedMembersCountClosure()
        } else {
            return invitedMembersCountReturnValue
        }
    }

    //MARK: - inviter

    open var inviterThrowableError: Error?
    var inviterUnderlyingCallsCount = 0
    open var inviterCallsCount: Int {
        get {
            if Thread.isMainThread {
                return inviterUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = inviterUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                inviterUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    inviterUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var inviterCalled: Bool {
        return inviterCallsCount > 0
    }

    var inviterUnderlyingReturnValue: RoomMember?
    open var inviterReturnValue: RoomMember? {
        get {
            if Thread.isMainThread {
                return inviterUnderlyingReturnValue
            } else {
                var returnValue: RoomMember?? = nil
                DispatchQueue.main.sync {
                    returnValue = inviterUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                inviterUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    inviterUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var inviterClosure: (() async throws -> RoomMember?)?

    open override func inviter() async throws -> RoomMember? {
        if let error = inviterThrowableError {
            throw error
        }
        inviterCallsCount += 1
        if let inviterClosure = inviterClosure {
            return try await inviterClosure()
        } else {
            return inviterReturnValue
        }
    }

    //MARK: - isDirect

    var isDirectUnderlyingCallsCount = 0
    open var isDirectCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isDirectUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isDirectUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isDirectUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isDirectUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isDirectCalled: Bool {
        return isDirectCallsCount > 0
    }

    var isDirectUnderlyingReturnValue: Bool!
    open var isDirectReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isDirectUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isDirectUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isDirectUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isDirectUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isDirectClosure: (() async -> Bool)?

    open override func isDirect() async -> Bool {
        isDirectCallsCount += 1
        if let isDirectClosure = isDirectClosure {
            return await isDirectClosure()
        } else {
            return isDirectReturnValue
        }
    }

    //MARK: - isEncrypted

    var isEncryptedUnderlyingCallsCount = 0
    open var isEncryptedCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isEncryptedUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isEncryptedUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isEncryptedUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isEncryptedUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isEncryptedCalled: Bool {
        return isEncryptedCallsCount > 0
    }

    var isEncryptedUnderlyingReturnValue: Bool!
    open var isEncryptedReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isEncryptedUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isEncryptedUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isEncryptedUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isEncryptedUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isEncryptedClosure: (() async -> Bool)?

    open override func isEncrypted() async -> Bool {
        isEncryptedCallsCount += 1
        if let isEncryptedClosure = isEncryptedClosure {
            return await isEncryptedClosure()
        } else {
            return isEncryptedReturnValue
        }
    }

    //MARK: - isPublic

    var isPublicUnderlyingCallsCount = 0
    open var isPublicCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isPublicUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isPublicUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isPublicUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isPublicUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isPublicCalled: Bool {
        return isPublicCallsCount > 0
    }

    var isPublicUnderlyingReturnValue: Bool?
    open var isPublicReturnValue: Bool? {
        get {
            if Thread.isMainThread {
                return isPublicUnderlyingReturnValue
            } else {
                var returnValue: Bool?? = nil
                DispatchQueue.main.sync {
                    returnValue = isPublicUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isPublicUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isPublicUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isPublicClosure: (() -> Bool?)?

    open override func isPublic() -> Bool? {
        isPublicCallsCount += 1
        if let isPublicClosure = isPublicClosure {
            return isPublicClosure()
        } else {
            return isPublicReturnValue
        }
    }

    //MARK: - isSendQueueEnabled

    var isSendQueueEnabledUnderlyingCallsCount = 0
    open var isSendQueueEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isSendQueueEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isSendQueueEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isSendQueueEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isSendQueueEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isSendQueueEnabledCalled: Bool {
        return isSendQueueEnabledCallsCount > 0
    }

    var isSendQueueEnabledUnderlyingReturnValue: Bool!
    open var isSendQueueEnabledReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isSendQueueEnabledUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isSendQueueEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isSendQueueEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isSendQueueEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isSendQueueEnabledClosure: (() -> Bool)?

    open override func isSendQueueEnabled() -> Bool {
        isSendQueueEnabledCallsCount += 1
        if let isSendQueueEnabledClosure = isSendQueueEnabledClosure {
            return isSendQueueEnabledClosure()
        } else {
            return isSendQueueEnabledReturnValue
        }
    }

    //MARK: - isSpace

    var isSpaceUnderlyingCallsCount = 0
    open var isSpaceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isSpaceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isSpaceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isSpaceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isSpaceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isSpaceCalled: Bool {
        return isSpaceCallsCount > 0
    }

    var isSpaceUnderlyingReturnValue: Bool!
    open var isSpaceReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isSpaceUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isSpaceUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isSpaceUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isSpaceUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isSpaceClosure: (() -> Bool)?

    open override func isSpace() -> Bool {
        isSpaceCallsCount += 1
        if let isSpaceClosure = isSpaceClosure {
            return isSpaceClosure()
        } else {
            return isSpaceReturnValue
        }
    }

    //MARK: - join

    open var joinThrowableError: Error?
    var joinUnderlyingCallsCount = 0
    open var joinCallsCount: Int {
        get {
            if Thread.isMainThread {
                return joinUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = joinUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    joinUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var joinCalled: Bool {
        return joinCallsCount > 0
    }
    open var joinClosure: (() async throws -> Void)?

    open override func join() async throws {
        if let error = joinThrowableError {
            throw error
        }
        joinCallsCount += 1
        try await joinClosure?()
    }

    //MARK: - joinedMembersCount

    var joinedMembersCountUnderlyingCallsCount = 0
    open var joinedMembersCountCallsCount: Int {
        get {
            if Thread.isMainThread {
                return joinedMembersCountUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = joinedMembersCountUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinedMembersCountUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    joinedMembersCountUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var joinedMembersCountCalled: Bool {
        return joinedMembersCountCallsCount > 0
    }

    var joinedMembersCountUnderlyingReturnValue: UInt64!
    open var joinedMembersCountReturnValue: UInt64! {
        get {
            if Thread.isMainThread {
                return joinedMembersCountUnderlyingReturnValue
            } else {
                var returnValue: UInt64? = nil
                DispatchQueue.main.sync {
                    returnValue = joinedMembersCountUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinedMembersCountUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    joinedMembersCountUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var joinedMembersCountClosure: (() -> UInt64)?

    open override func joinedMembersCount() -> UInt64 {
        joinedMembersCountCallsCount += 1
        if let joinedMembersCountClosure = joinedMembersCountClosure {
            return joinedMembersCountClosure()
        } else {
            return joinedMembersCountReturnValue
        }
    }

    //MARK: - kickUser

    open var kickUserUserIdReasonThrowableError: Error?
    var kickUserUserIdReasonUnderlyingCallsCount = 0
    open var kickUserUserIdReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return kickUserUserIdReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = kickUserUserIdReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                kickUserUserIdReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    kickUserUserIdReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var kickUserUserIdReasonCalled: Bool {
        return kickUserUserIdReasonCallsCount > 0
    }
    open var kickUserUserIdReasonReceivedArguments: (userId: String, reason: String?)?
    open var kickUserUserIdReasonReceivedInvocations: [(userId: String, reason: String?)] = []
    open var kickUserUserIdReasonClosure: ((String, String?) async throws -> Void)?

    open override func kickUser(userId: String, reason: String?) async throws {
        if let error = kickUserUserIdReasonThrowableError {
            throw error
        }
        kickUserUserIdReasonCallsCount += 1
        kickUserUserIdReasonReceivedArguments = (userId: userId, reason: reason)
        DispatchQueue.main.async {
            self.kickUserUserIdReasonReceivedInvocations.append((userId: userId, reason: reason))
        }
        try await kickUserUserIdReasonClosure?(userId, reason)
    }

    //MARK: - latestEncryptionState

    open var latestEncryptionStateThrowableError: Error?
    var latestEncryptionStateUnderlyingCallsCount = 0
    open var latestEncryptionStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return latestEncryptionStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = latestEncryptionStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                latestEncryptionStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    latestEncryptionStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var latestEncryptionStateCalled: Bool {
        return latestEncryptionStateCallsCount > 0
    }

    var latestEncryptionStateUnderlyingReturnValue: EncryptionState!
    open var latestEncryptionStateReturnValue: EncryptionState! {
        get {
            if Thread.isMainThread {
                return latestEncryptionStateUnderlyingReturnValue
            } else {
                var returnValue: EncryptionState? = nil
                DispatchQueue.main.sync {
                    returnValue = latestEncryptionStateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                latestEncryptionStateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    latestEncryptionStateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var latestEncryptionStateClosure: (() async throws -> EncryptionState)?

    open override func latestEncryptionState() async throws -> EncryptionState {
        if let error = latestEncryptionStateThrowableError {
            throw error
        }
        latestEncryptionStateCallsCount += 1
        if let latestEncryptionStateClosure = latestEncryptionStateClosure {
            return try await latestEncryptionStateClosure()
        } else {
            return latestEncryptionStateReturnValue
        }
    }

    //MARK: - latestEvent

    var latestEventUnderlyingCallsCount = 0
    open var latestEventCallsCount: Int {
        get {
            if Thread.isMainThread {
                return latestEventUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = latestEventUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                latestEventUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    latestEventUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var latestEventCalled: Bool {
        return latestEventCallsCount > 0
    }

    var latestEventUnderlyingReturnValue: EventTimelineItem?
    open var latestEventReturnValue: EventTimelineItem? {
        get {
            if Thread.isMainThread {
                return latestEventUnderlyingReturnValue
            } else {
                var returnValue: EventTimelineItem?? = nil
                DispatchQueue.main.sync {
                    returnValue = latestEventUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                latestEventUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    latestEventUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var latestEventClosure: (() async -> EventTimelineItem?)?

    open override func latestEvent() async -> EventTimelineItem? {
        latestEventCallsCount += 1
        if let latestEventClosure = latestEventClosure {
            return await latestEventClosure()
        } else {
            return latestEventReturnValue
        }
    }

    //MARK: - leave

    open var leaveThrowableError: Error?
    var leaveUnderlyingCallsCount = 0
    open var leaveCallsCount: Int {
        get {
            if Thread.isMainThread {
                return leaveUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = leaveUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                leaveUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    leaveUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var leaveCalled: Bool {
        return leaveCallsCount > 0
    }
    open var leaveClosure: (() async throws -> Void)?

    open override func leave() async throws {
        if let error = leaveThrowableError {
            throw error
        }
        leaveCallsCount += 1
        try await leaveClosure?()
    }

    //MARK: - loadComposerDraft

    open var loadComposerDraftThreadRootThrowableError: Error?
    var loadComposerDraftThreadRootUnderlyingCallsCount = 0
    open var loadComposerDraftThreadRootCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadComposerDraftThreadRootUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadComposerDraftThreadRootUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadComposerDraftThreadRootUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadComposerDraftThreadRootUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var loadComposerDraftThreadRootCalled: Bool {
        return loadComposerDraftThreadRootCallsCount > 0
    }
    open var loadComposerDraftThreadRootReceivedThreadRoot: String?
    open var loadComposerDraftThreadRootReceivedInvocations: [String?] = []

    var loadComposerDraftThreadRootUnderlyingReturnValue: ComposerDraft?
    open var loadComposerDraftThreadRootReturnValue: ComposerDraft? {
        get {
            if Thread.isMainThread {
                return loadComposerDraftThreadRootUnderlyingReturnValue
            } else {
                var returnValue: ComposerDraft?? = nil
                DispatchQueue.main.sync {
                    returnValue = loadComposerDraftThreadRootUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadComposerDraftThreadRootUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadComposerDraftThreadRootUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var loadComposerDraftThreadRootClosure: ((String?) async throws -> ComposerDraft?)?

    open override func loadComposerDraft(threadRoot: String?) async throws -> ComposerDraft? {
        if let error = loadComposerDraftThreadRootThrowableError {
            throw error
        }
        loadComposerDraftThreadRootCallsCount += 1
        loadComposerDraftThreadRootReceivedThreadRoot = threadRoot
        DispatchQueue.main.async {
            self.loadComposerDraftThreadRootReceivedInvocations.append(threadRoot)
        }
        if let loadComposerDraftThreadRootClosure = loadComposerDraftThreadRootClosure {
            return try await loadComposerDraftThreadRootClosure(threadRoot)
        } else {
            return loadComposerDraftThreadRootReturnValue
        }
    }

    //MARK: - markAsRead

    open var markAsReadReceiptTypeThrowableError: Error?
    var markAsReadReceiptTypeUnderlyingCallsCount = 0
    open var markAsReadReceiptTypeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return markAsReadReceiptTypeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = markAsReadReceiptTypeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                markAsReadReceiptTypeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    markAsReadReceiptTypeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var markAsReadReceiptTypeCalled: Bool {
        return markAsReadReceiptTypeCallsCount > 0
    }
    open var markAsReadReceiptTypeReceivedReceiptType: ReceiptType?
    open var markAsReadReceiptTypeReceivedInvocations: [ReceiptType] = []
    open var markAsReadReceiptTypeClosure: ((ReceiptType) async throws -> Void)?

    open override func markAsRead(receiptType: ReceiptType) async throws {
        if let error = markAsReadReceiptTypeThrowableError {
            throw error
        }
        markAsReadReceiptTypeCallsCount += 1
        markAsReadReceiptTypeReceivedReceiptType = receiptType
        DispatchQueue.main.async {
            self.markAsReadReceiptTypeReceivedInvocations.append(receiptType)
        }
        try await markAsReadReceiptTypeClosure?(receiptType)
    }

    //MARK: - matrixToEventPermalink

    open var matrixToEventPermalinkEventIdThrowableError: Error?
    var matrixToEventPermalinkEventIdUnderlyingCallsCount = 0
    open var matrixToEventPermalinkEventIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return matrixToEventPermalinkEventIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = matrixToEventPermalinkEventIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                matrixToEventPermalinkEventIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    matrixToEventPermalinkEventIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var matrixToEventPermalinkEventIdCalled: Bool {
        return matrixToEventPermalinkEventIdCallsCount > 0
    }
    open var matrixToEventPermalinkEventIdReceivedEventId: String?
    open var matrixToEventPermalinkEventIdReceivedInvocations: [String] = []

    var matrixToEventPermalinkEventIdUnderlyingReturnValue: String!
    open var matrixToEventPermalinkEventIdReturnValue: String! {
        get {
            if Thread.isMainThread {
                return matrixToEventPermalinkEventIdUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = matrixToEventPermalinkEventIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                matrixToEventPermalinkEventIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    matrixToEventPermalinkEventIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var matrixToEventPermalinkEventIdClosure: ((String) async throws -> String)?

    open override func matrixToEventPermalink(eventId: String) async throws -> String {
        if let error = matrixToEventPermalinkEventIdThrowableError {
            throw error
        }
        matrixToEventPermalinkEventIdCallsCount += 1
        matrixToEventPermalinkEventIdReceivedEventId = eventId
        DispatchQueue.main.async {
            self.matrixToEventPermalinkEventIdReceivedInvocations.append(eventId)
        }
        if let matrixToEventPermalinkEventIdClosure = matrixToEventPermalinkEventIdClosure {
            return try await matrixToEventPermalinkEventIdClosure(eventId)
        } else {
            return matrixToEventPermalinkEventIdReturnValue
        }
    }

    //MARK: - matrixToPermalink

    open var matrixToPermalinkThrowableError: Error?
    var matrixToPermalinkUnderlyingCallsCount = 0
    open var matrixToPermalinkCallsCount: Int {
        get {
            if Thread.isMainThread {
                return matrixToPermalinkUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = matrixToPermalinkUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                matrixToPermalinkUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    matrixToPermalinkUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var matrixToPermalinkCalled: Bool {
        return matrixToPermalinkCallsCount > 0
    }

    var matrixToPermalinkUnderlyingReturnValue: String!
    open var matrixToPermalinkReturnValue: String! {
        get {
            if Thread.isMainThread {
                return matrixToPermalinkUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = matrixToPermalinkUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                matrixToPermalinkUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    matrixToPermalinkUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var matrixToPermalinkClosure: (() async throws -> String)?

    open override func matrixToPermalink() async throws -> String {
        if let error = matrixToPermalinkThrowableError {
            throw error
        }
        matrixToPermalinkCallsCount += 1
        if let matrixToPermalinkClosure = matrixToPermalinkClosure {
            return try await matrixToPermalinkClosure()
        } else {
            return matrixToPermalinkReturnValue
        }
    }

    //MARK: - member

    open var memberUserIdThrowableError: Error?
    var memberUserIdUnderlyingCallsCount = 0
    open var memberUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return memberUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = memberUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                memberUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    memberUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var memberUserIdCalled: Bool {
        return memberUserIdCallsCount > 0
    }
    open var memberUserIdReceivedUserId: String?
    open var memberUserIdReceivedInvocations: [String] = []

    var memberUserIdUnderlyingReturnValue: RoomMember!
    open var memberUserIdReturnValue: RoomMember! {
        get {
            if Thread.isMainThread {
                return memberUserIdUnderlyingReturnValue
            } else {
                var returnValue: RoomMember? = nil
                DispatchQueue.main.sync {
                    returnValue = memberUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                memberUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    memberUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var memberUserIdClosure: ((String) async throws -> RoomMember)?

    open override func member(userId: String) async throws -> RoomMember {
        if let error = memberUserIdThrowableError {
            throw error
        }
        memberUserIdCallsCount += 1
        memberUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.memberUserIdReceivedInvocations.append(userId)
        }
        if let memberUserIdClosure = memberUserIdClosure {
            return try await memberUserIdClosure(userId)
        } else {
            return memberUserIdReturnValue
        }
    }

    //MARK: - memberAvatarUrl

    open var memberAvatarUrlUserIdThrowableError: Error?
    var memberAvatarUrlUserIdUnderlyingCallsCount = 0
    open var memberAvatarUrlUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return memberAvatarUrlUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = memberAvatarUrlUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                memberAvatarUrlUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    memberAvatarUrlUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var memberAvatarUrlUserIdCalled: Bool {
        return memberAvatarUrlUserIdCallsCount > 0
    }
    open var memberAvatarUrlUserIdReceivedUserId: String?
    open var memberAvatarUrlUserIdReceivedInvocations: [String] = []

    var memberAvatarUrlUserIdUnderlyingReturnValue: String?
    open var memberAvatarUrlUserIdReturnValue: String? {
        get {
            if Thread.isMainThread {
                return memberAvatarUrlUserIdUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = memberAvatarUrlUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                memberAvatarUrlUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    memberAvatarUrlUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var memberAvatarUrlUserIdClosure: ((String) async throws -> String?)?

    open override func memberAvatarUrl(userId: String) async throws -> String? {
        if let error = memberAvatarUrlUserIdThrowableError {
            throw error
        }
        memberAvatarUrlUserIdCallsCount += 1
        memberAvatarUrlUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.memberAvatarUrlUserIdReceivedInvocations.append(userId)
        }
        if let memberAvatarUrlUserIdClosure = memberAvatarUrlUserIdClosure {
            return try await memberAvatarUrlUserIdClosure(userId)
        } else {
            return memberAvatarUrlUserIdReturnValue
        }
    }

    //MARK: - memberDisplayName

    open var memberDisplayNameUserIdThrowableError: Error?
    var memberDisplayNameUserIdUnderlyingCallsCount = 0
    open var memberDisplayNameUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return memberDisplayNameUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = memberDisplayNameUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                memberDisplayNameUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    memberDisplayNameUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var memberDisplayNameUserIdCalled: Bool {
        return memberDisplayNameUserIdCallsCount > 0
    }
    open var memberDisplayNameUserIdReceivedUserId: String?
    open var memberDisplayNameUserIdReceivedInvocations: [String] = []

    var memberDisplayNameUserIdUnderlyingReturnValue: String?
    open var memberDisplayNameUserIdReturnValue: String? {
        get {
            if Thread.isMainThread {
                return memberDisplayNameUserIdUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = memberDisplayNameUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                memberDisplayNameUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    memberDisplayNameUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var memberDisplayNameUserIdClosure: ((String) async throws -> String?)?

    open override func memberDisplayName(userId: String) async throws -> String? {
        if let error = memberDisplayNameUserIdThrowableError {
            throw error
        }
        memberDisplayNameUserIdCallsCount += 1
        memberDisplayNameUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.memberDisplayNameUserIdReceivedInvocations.append(userId)
        }
        if let memberDisplayNameUserIdClosure = memberDisplayNameUserIdClosure {
            return try await memberDisplayNameUserIdClosure(userId)
        } else {
            return memberDisplayNameUserIdReturnValue
        }
    }

    //MARK: - memberWithSenderInfo

    open var memberWithSenderInfoUserIdThrowableError: Error?
    var memberWithSenderInfoUserIdUnderlyingCallsCount = 0
    open var memberWithSenderInfoUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return memberWithSenderInfoUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = memberWithSenderInfoUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                memberWithSenderInfoUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    memberWithSenderInfoUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var memberWithSenderInfoUserIdCalled: Bool {
        return memberWithSenderInfoUserIdCallsCount > 0
    }
    open var memberWithSenderInfoUserIdReceivedUserId: String?
    open var memberWithSenderInfoUserIdReceivedInvocations: [String] = []

    var memberWithSenderInfoUserIdUnderlyingReturnValue: RoomMemberWithSenderInfo!
    open var memberWithSenderInfoUserIdReturnValue: RoomMemberWithSenderInfo! {
        get {
            if Thread.isMainThread {
                return memberWithSenderInfoUserIdUnderlyingReturnValue
            } else {
                var returnValue: RoomMemberWithSenderInfo? = nil
                DispatchQueue.main.sync {
                    returnValue = memberWithSenderInfoUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                memberWithSenderInfoUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    memberWithSenderInfoUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var memberWithSenderInfoUserIdClosure: ((String) async throws -> RoomMemberWithSenderInfo)?

    open override func memberWithSenderInfo(userId: String) async throws -> RoomMemberWithSenderInfo {
        if let error = memberWithSenderInfoUserIdThrowableError {
            throw error
        }
        memberWithSenderInfoUserIdCallsCount += 1
        memberWithSenderInfoUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.memberWithSenderInfoUserIdReceivedInvocations.append(userId)
        }
        if let memberWithSenderInfoUserIdClosure = memberWithSenderInfoUserIdClosure {
            return try await memberWithSenderInfoUserIdClosure(userId)
        } else {
            return memberWithSenderInfoUserIdReturnValue
        }
    }

    //MARK: - members

    open var membersThrowableError: Error?
    var membersUnderlyingCallsCount = 0
    open var membersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return membersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = membersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                membersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    membersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var membersCalled: Bool {
        return membersCallsCount > 0
    }

    var membersUnderlyingReturnValue: RoomMembersIterator!
    open var membersReturnValue: RoomMembersIterator! {
        get {
            if Thread.isMainThread {
                return membersUnderlyingReturnValue
            } else {
                var returnValue: RoomMembersIterator? = nil
                DispatchQueue.main.sync {
                    returnValue = membersUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                membersUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    membersUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var membersClosure: (() async throws -> RoomMembersIterator)?

    open override func members() async throws -> RoomMembersIterator {
        if let error = membersThrowableError {
            throw error
        }
        membersCallsCount += 1
        if let membersClosure = membersClosure {
            return try await membersClosure()
        } else {
            return membersReturnValue
        }
    }

    //MARK: - membersNoSync

    open var membersNoSyncThrowableError: Error?
    var membersNoSyncUnderlyingCallsCount = 0
    open var membersNoSyncCallsCount: Int {
        get {
            if Thread.isMainThread {
                return membersNoSyncUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = membersNoSyncUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                membersNoSyncUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    membersNoSyncUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var membersNoSyncCalled: Bool {
        return membersNoSyncCallsCount > 0
    }

    var membersNoSyncUnderlyingReturnValue: RoomMembersIterator!
    open var membersNoSyncReturnValue: RoomMembersIterator! {
        get {
            if Thread.isMainThread {
                return membersNoSyncUnderlyingReturnValue
            } else {
                var returnValue: RoomMembersIterator? = nil
                DispatchQueue.main.sync {
                    returnValue = membersNoSyncUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                membersNoSyncUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    membersNoSyncUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var membersNoSyncClosure: (() async throws -> RoomMembersIterator)?

    open override func membersNoSync() async throws -> RoomMembersIterator {
        if let error = membersNoSyncThrowableError {
            throw error
        }
        membersNoSyncCallsCount += 1
        if let membersNoSyncClosure = membersNoSyncClosure {
            return try await membersNoSyncClosure()
        } else {
            return membersNoSyncReturnValue
        }
    }

    //MARK: - membership

    var membershipUnderlyingCallsCount = 0
    open var membershipCallsCount: Int {
        get {
            if Thread.isMainThread {
                return membershipUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = membershipUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                membershipUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    membershipUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var membershipCalled: Bool {
        return membershipCallsCount > 0
    }

    var membershipUnderlyingReturnValue: Membership!
    open var membershipReturnValue: Membership! {
        get {
            if Thread.isMainThread {
                return membershipUnderlyingReturnValue
            } else {
                var returnValue: Membership? = nil
                DispatchQueue.main.sync {
                    returnValue = membershipUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                membershipUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    membershipUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var membershipClosure: (() -> Membership)?

    open override func membership() -> Membership {
        membershipCallsCount += 1
        if let membershipClosure = membershipClosure {
            return membershipClosure()
        } else {
            return membershipReturnValue
        }
    }

    //MARK: - ownUserId

    var ownUserIdUnderlyingCallsCount = 0
    open var ownUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return ownUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = ownUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ownUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    ownUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var ownUserIdCalled: Bool {
        return ownUserIdCallsCount > 0
    }

    var ownUserIdUnderlyingReturnValue: String!
    open var ownUserIdReturnValue: String! {
        get {
            if Thread.isMainThread {
                return ownUserIdUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = ownUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ownUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    ownUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var ownUserIdClosure: (() -> String)?

    open override func ownUserId() -> String {
        ownUserIdCallsCount += 1
        if let ownUserIdClosure = ownUserIdClosure {
            return ownUserIdClosure()
        } else {
            return ownUserIdReturnValue
        }
    }

    //MARK: - predecessorRoom

    var predecessorRoomUnderlyingCallsCount = 0
    open var predecessorRoomCallsCount: Int {
        get {
            if Thread.isMainThread {
                return predecessorRoomUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = predecessorRoomUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                predecessorRoomUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    predecessorRoomUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var predecessorRoomCalled: Bool {
        return predecessorRoomCallsCount > 0
    }

    var predecessorRoomUnderlyingReturnValue: PredecessorRoom?
    open var predecessorRoomReturnValue: PredecessorRoom? {
        get {
            if Thread.isMainThread {
                return predecessorRoomUnderlyingReturnValue
            } else {
                var returnValue: PredecessorRoom?? = nil
                DispatchQueue.main.sync {
                    returnValue = predecessorRoomUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                predecessorRoomUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    predecessorRoomUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var predecessorRoomClosure: (() -> PredecessorRoom?)?

    open override func predecessorRoom() -> PredecessorRoom? {
        predecessorRoomCallsCount += 1
        if let predecessorRoomClosure = predecessorRoomClosure {
            return predecessorRoomClosure()
        } else {
            return predecessorRoomReturnValue
        }
    }

    //MARK: - previewRoom

    open var previewRoomViaThrowableError: Error?
    var previewRoomViaUnderlyingCallsCount = 0
    open var previewRoomViaCallsCount: Int {
        get {
            if Thread.isMainThread {
                return previewRoomViaUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = previewRoomViaUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                previewRoomViaUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    previewRoomViaUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var previewRoomViaCalled: Bool {
        return previewRoomViaCallsCount > 0
    }
    open var previewRoomViaReceivedVia: [String]?
    open var previewRoomViaReceivedInvocations: [[String]] = []

    var previewRoomViaUnderlyingReturnValue: RoomPreview!
    open var previewRoomViaReturnValue: RoomPreview! {
        get {
            if Thread.isMainThread {
                return previewRoomViaUnderlyingReturnValue
            } else {
                var returnValue: RoomPreview? = nil
                DispatchQueue.main.sync {
                    returnValue = previewRoomViaUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                previewRoomViaUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    previewRoomViaUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var previewRoomViaClosure: (([String]) async throws -> RoomPreview)?

    open override func previewRoom(via: [String]) async throws -> RoomPreview {
        if let error = previewRoomViaThrowableError {
            throw error
        }
        previewRoomViaCallsCount += 1
        previewRoomViaReceivedVia = via
        DispatchQueue.main.async {
            self.previewRoomViaReceivedInvocations.append(via)
        }
        if let previewRoomViaClosure = previewRoomViaClosure {
            return try await previewRoomViaClosure(via)
        } else {
            return previewRoomViaReturnValue
        }
    }

    //MARK: - publishRoomAliasInRoomDirectory

    open var publishRoomAliasInRoomDirectoryAliasThrowableError: Error?
    var publishRoomAliasInRoomDirectoryAliasUnderlyingCallsCount = 0
    open var publishRoomAliasInRoomDirectoryAliasCallsCount: Int {
        get {
            if Thread.isMainThread {
                return publishRoomAliasInRoomDirectoryAliasUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = publishRoomAliasInRoomDirectoryAliasUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                publishRoomAliasInRoomDirectoryAliasUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    publishRoomAliasInRoomDirectoryAliasUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var publishRoomAliasInRoomDirectoryAliasCalled: Bool {
        return publishRoomAliasInRoomDirectoryAliasCallsCount > 0
    }
    open var publishRoomAliasInRoomDirectoryAliasReceivedAlias: String?
    open var publishRoomAliasInRoomDirectoryAliasReceivedInvocations: [String] = []

    var publishRoomAliasInRoomDirectoryAliasUnderlyingReturnValue: Bool!
    open var publishRoomAliasInRoomDirectoryAliasReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return publishRoomAliasInRoomDirectoryAliasUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = publishRoomAliasInRoomDirectoryAliasUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                publishRoomAliasInRoomDirectoryAliasUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    publishRoomAliasInRoomDirectoryAliasUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var publishRoomAliasInRoomDirectoryAliasClosure: ((String) async throws -> Bool)?

    open override func publishRoomAliasInRoomDirectory(alias: String) async throws -> Bool {
        if let error = publishRoomAliasInRoomDirectoryAliasThrowableError {
            throw error
        }
        publishRoomAliasInRoomDirectoryAliasCallsCount += 1
        publishRoomAliasInRoomDirectoryAliasReceivedAlias = alias
        DispatchQueue.main.async {
            self.publishRoomAliasInRoomDirectoryAliasReceivedInvocations.append(alias)
        }
        if let publishRoomAliasInRoomDirectoryAliasClosure = publishRoomAliasInRoomDirectoryAliasClosure {
            return try await publishRoomAliasInRoomDirectoryAliasClosure(alias)
        } else {
            return publishRoomAliasInRoomDirectoryAliasReturnValue
        }
    }

    //MARK: - rawName

    var rawNameUnderlyingCallsCount = 0
    open var rawNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return rawNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = rawNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                rawNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    rawNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var rawNameCalled: Bool {
        return rawNameCallsCount > 0
    }

    var rawNameUnderlyingReturnValue: String?
    open var rawNameReturnValue: String? {
        get {
            if Thread.isMainThread {
                return rawNameUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = rawNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                rawNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    rawNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var rawNameClosure: (() -> String?)?

    open override func rawName() -> String? {
        rawNameCallsCount += 1
        if let rawNameClosure = rawNameClosure {
            return rawNameClosure()
        } else {
            return rawNameReturnValue
        }
    }

    //MARK: - redact

    open var redactEventIdReasonThrowableError: Error?
    var redactEventIdReasonUnderlyingCallsCount = 0
    open var redactEventIdReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return redactEventIdReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = redactEventIdReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                redactEventIdReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    redactEventIdReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var redactEventIdReasonCalled: Bool {
        return redactEventIdReasonCallsCount > 0
    }
    open var redactEventIdReasonReceivedArguments: (eventId: String, reason: String?)?
    open var redactEventIdReasonReceivedInvocations: [(eventId: String, reason: String?)] = []
    open var redactEventIdReasonClosure: ((String, String?) async throws -> Void)?

    open override func redact(eventId: String, reason: String?) async throws {
        if let error = redactEventIdReasonThrowableError {
            throw error
        }
        redactEventIdReasonCallsCount += 1
        redactEventIdReasonReceivedArguments = (eventId: eventId, reason: reason)
        DispatchQueue.main.async {
            self.redactEventIdReasonReceivedInvocations.append((eventId: eventId, reason: reason))
        }
        try await redactEventIdReasonClosure?(eventId, reason)
    }

    //MARK: - removeAvatar

    open var removeAvatarThrowableError: Error?
    var removeAvatarUnderlyingCallsCount = 0
    open var removeAvatarCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeAvatarUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeAvatarUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeAvatarUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeAvatarUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var removeAvatarCalled: Bool {
        return removeAvatarCallsCount > 0
    }
    open var removeAvatarClosure: (() async throws -> Void)?

    open override func removeAvatar() async throws {
        if let error = removeAvatarThrowableError {
            throw error
        }
        removeAvatarCallsCount += 1
        try await removeAvatarClosure?()
    }

    //MARK: - removeRoomAliasFromRoomDirectory

    open var removeRoomAliasFromRoomDirectoryAliasThrowableError: Error?
    var removeRoomAliasFromRoomDirectoryAliasUnderlyingCallsCount = 0
    open var removeRoomAliasFromRoomDirectoryAliasCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeRoomAliasFromRoomDirectoryAliasUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeRoomAliasFromRoomDirectoryAliasUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeRoomAliasFromRoomDirectoryAliasUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeRoomAliasFromRoomDirectoryAliasUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var removeRoomAliasFromRoomDirectoryAliasCalled: Bool {
        return removeRoomAliasFromRoomDirectoryAliasCallsCount > 0
    }
    open var removeRoomAliasFromRoomDirectoryAliasReceivedAlias: String?
    open var removeRoomAliasFromRoomDirectoryAliasReceivedInvocations: [String] = []

    var removeRoomAliasFromRoomDirectoryAliasUnderlyingReturnValue: Bool!
    open var removeRoomAliasFromRoomDirectoryAliasReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return removeRoomAliasFromRoomDirectoryAliasUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = removeRoomAliasFromRoomDirectoryAliasUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeRoomAliasFromRoomDirectoryAliasUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    removeRoomAliasFromRoomDirectoryAliasUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var removeRoomAliasFromRoomDirectoryAliasClosure: ((String) async throws -> Bool)?

    open override func removeRoomAliasFromRoomDirectory(alias: String) async throws -> Bool {
        if let error = removeRoomAliasFromRoomDirectoryAliasThrowableError {
            throw error
        }
        removeRoomAliasFromRoomDirectoryAliasCallsCount += 1
        removeRoomAliasFromRoomDirectoryAliasReceivedAlias = alias
        DispatchQueue.main.async {
            self.removeRoomAliasFromRoomDirectoryAliasReceivedInvocations.append(alias)
        }
        if let removeRoomAliasFromRoomDirectoryAliasClosure = removeRoomAliasFromRoomDirectoryAliasClosure {
            return try await removeRoomAliasFromRoomDirectoryAliasClosure(alias)
        } else {
            return removeRoomAliasFromRoomDirectoryAliasReturnValue
        }
    }

    //MARK: - reportContent

    open var reportContentEventIdScoreReasonThrowableError: Error?
    var reportContentEventIdScoreReasonUnderlyingCallsCount = 0
    open var reportContentEventIdScoreReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return reportContentEventIdScoreReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = reportContentEventIdScoreReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                reportContentEventIdScoreReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    reportContentEventIdScoreReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var reportContentEventIdScoreReasonCalled: Bool {
        return reportContentEventIdScoreReasonCallsCount > 0
    }
    open var reportContentEventIdScoreReasonReceivedArguments: (eventId: String, score: Int32?, reason: String?)?
    open var reportContentEventIdScoreReasonReceivedInvocations: [(eventId: String, score: Int32?, reason: String?)] = []
    open var reportContentEventIdScoreReasonClosure: ((String, Int32?, String?) async throws -> Void)?

    open override func reportContent(eventId: String, score: Int32?, reason: String?) async throws {
        if let error = reportContentEventIdScoreReasonThrowableError {
            throw error
        }
        reportContentEventIdScoreReasonCallsCount += 1
        reportContentEventIdScoreReasonReceivedArguments = (eventId: eventId, score: score, reason: reason)
        DispatchQueue.main.async {
            self.reportContentEventIdScoreReasonReceivedInvocations.append((eventId: eventId, score: score, reason: reason))
        }
        try await reportContentEventIdScoreReasonClosure?(eventId, score, reason)
    }

    //MARK: - reportRoom

    open var reportRoomReasonThrowableError: Error?
    var reportRoomReasonUnderlyingCallsCount = 0
    open var reportRoomReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return reportRoomReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = reportRoomReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                reportRoomReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    reportRoomReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var reportRoomReasonCalled: Bool {
        return reportRoomReasonCallsCount > 0
    }
    open var reportRoomReasonReceivedReason: String?
    open var reportRoomReasonReceivedInvocations: [String?] = []
    open var reportRoomReasonClosure: ((String?) async throws -> Void)?

    open override func reportRoom(reason: String?) async throws {
        if let error = reportRoomReasonThrowableError {
            throw error
        }
        reportRoomReasonCallsCount += 1
        reportRoomReasonReceivedReason = reason
        DispatchQueue.main.async {
            self.reportRoomReasonReceivedInvocations.append(reason)
        }
        try await reportRoomReasonClosure?(reason)
    }

    //MARK: - resetPowerLevels

    open var resetPowerLevelsThrowableError: Error?
    var resetPowerLevelsUnderlyingCallsCount = 0
    open var resetPowerLevelsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetPowerLevelsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetPowerLevelsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetPowerLevelsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetPowerLevelsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var resetPowerLevelsCalled: Bool {
        return resetPowerLevelsCallsCount > 0
    }

    var resetPowerLevelsUnderlyingReturnValue: RoomPowerLevels!
    open var resetPowerLevelsReturnValue: RoomPowerLevels! {
        get {
            if Thread.isMainThread {
                return resetPowerLevelsUnderlyingReturnValue
            } else {
                var returnValue: RoomPowerLevels? = nil
                DispatchQueue.main.sync {
                    returnValue = resetPowerLevelsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetPowerLevelsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    resetPowerLevelsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var resetPowerLevelsClosure: (() async throws -> RoomPowerLevels)?

    open override func resetPowerLevels() async throws -> RoomPowerLevels {
        if let error = resetPowerLevelsThrowableError {
            throw error
        }
        resetPowerLevelsCallsCount += 1
        if let resetPowerLevelsClosure = resetPowerLevelsClosure {
            return try await resetPowerLevelsClosure()
        } else {
            return resetPowerLevelsReturnValue
        }
    }

    //MARK: - roomEventsDebugString

    open var roomEventsDebugStringThrowableError: Error?
    var roomEventsDebugStringUnderlyingCallsCount = 0
    open var roomEventsDebugStringCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomEventsDebugStringUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomEventsDebugStringUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomEventsDebugStringUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomEventsDebugStringUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var roomEventsDebugStringCalled: Bool {
        return roomEventsDebugStringCallsCount > 0
    }

    var roomEventsDebugStringUnderlyingReturnValue: [String]!
    open var roomEventsDebugStringReturnValue: [String]! {
        get {
            if Thread.isMainThread {
                return roomEventsDebugStringUnderlyingReturnValue
            } else {
                var returnValue: [String]? = nil
                DispatchQueue.main.sync {
                    returnValue = roomEventsDebugStringUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomEventsDebugStringUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomEventsDebugStringUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var roomEventsDebugStringClosure: (() async throws -> [String])?

    open override func roomEventsDebugString() async throws -> [String] {
        if let error = roomEventsDebugStringThrowableError {
            throw error
        }
        roomEventsDebugStringCallsCount += 1
        if let roomEventsDebugStringClosure = roomEventsDebugStringClosure {
            return try await roomEventsDebugStringClosure()
        } else {
            return roomEventsDebugStringReturnValue
        }
    }

    //MARK: - roomInfo

    open var roomInfoThrowableError: Error?
    var roomInfoUnderlyingCallsCount = 0
    open var roomInfoCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomInfoUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomInfoUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomInfoUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomInfoUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var roomInfoCalled: Bool {
        return roomInfoCallsCount > 0
    }

    var roomInfoUnderlyingReturnValue: RoomInfo!
    open var roomInfoReturnValue: RoomInfo! {
        get {
            if Thread.isMainThread {
                return roomInfoUnderlyingReturnValue
            } else {
                var returnValue: RoomInfo? = nil
                DispatchQueue.main.sync {
                    returnValue = roomInfoUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomInfoUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomInfoUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var roomInfoClosure: (() async throws -> RoomInfo)?

    open override func roomInfo() async throws -> RoomInfo {
        if let error = roomInfoThrowableError {
            throw error
        }
        roomInfoCallsCount += 1
        if let roomInfoClosure = roomInfoClosure {
            return try await roomInfoClosure()
        } else {
            return roomInfoReturnValue
        }
    }

    //MARK: - saveComposerDraft

    open var saveComposerDraftDraftThreadRootThrowableError: Error?
    var saveComposerDraftDraftThreadRootUnderlyingCallsCount = 0
    open var saveComposerDraftDraftThreadRootCallsCount: Int {
        get {
            if Thread.isMainThread {
                return saveComposerDraftDraftThreadRootUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = saveComposerDraftDraftThreadRootUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                saveComposerDraftDraftThreadRootUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    saveComposerDraftDraftThreadRootUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var saveComposerDraftDraftThreadRootCalled: Bool {
        return saveComposerDraftDraftThreadRootCallsCount > 0
    }
    open var saveComposerDraftDraftThreadRootReceivedArguments: (draft: ComposerDraft, threadRoot: String?)?
    open var saveComposerDraftDraftThreadRootReceivedInvocations: [(draft: ComposerDraft, threadRoot: String?)] = []
    open var saveComposerDraftDraftThreadRootClosure: ((ComposerDraft, String?) async throws -> Void)?

    open override func saveComposerDraft(draft: ComposerDraft, threadRoot: String?) async throws {
        if let error = saveComposerDraftDraftThreadRootThrowableError {
            throw error
        }
        saveComposerDraftDraftThreadRootCallsCount += 1
        saveComposerDraftDraftThreadRootReceivedArguments = (draft: draft, threadRoot: threadRoot)
        DispatchQueue.main.async {
            self.saveComposerDraftDraftThreadRootReceivedInvocations.append((draft: draft, threadRoot: threadRoot))
        }
        try await saveComposerDraftDraftThreadRootClosure?(draft, threadRoot)
    }

    //MARK: - sendCallNotification

    open var sendCallNotificationCallIdApplicationNotifyTypeMentionsThrowableError: Error?
    var sendCallNotificationCallIdApplicationNotifyTypeMentionsUnderlyingCallsCount = 0
    open var sendCallNotificationCallIdApplicationNotifyTypeMentionsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendCallNotificationCallIdApplicationNotifyTypeMentionsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendCallNotificationCallIdApplicationNotifyTypeMentionsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendCallNotificationCallIdApplicationNotifyTypeMentionsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendCallNotificationCallIdApplicationNotifyTypeMentionsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendCallNotificationCallIdApplicationNotifyTypeMentionsCalled: Bool {
        return sendCallNotificationCallIdApplicationNotifyTypeMentionsCallsCount > 0
    }
    open var sendCallNotificationCallIdApplicationNotifyTypeMentionsReceivedArguments: (callId: String, application: RtcApplicationType, notifyType: NotifyType, mentions: Mentions)?
    open var sendCallNotificationCallIdApplicationNotifyTypeMentionsReceivedInvocations: [(callId: String, application: RtcApplicationType, notifyType: NotifyType, mentions: Mentions)] = []
    open var sendCallNotificationCallIdApplicationNotifyTypeMentionsClosure: ((String, RtcApplicationType, NotifyType, Mentions) async throws -> Void)?

    open override func sendCallNotification(callId: String, application: RtcApplicationType, notifyType: NotifyType, mentions: Mentions) async throws {
        if let error = sendCallNotificationCallIdApplicationNotifyTypeMentionsThrowableError {
            throw error
        }
        sendCallNotificationCallIdApplicationNotifyTypeMentionsCallsCount += 1
        sendCallNotificationCallIdApplicationNotifyTypeMentionsReceivedArguments = (callId: callId, application: application, notifyType: notifyType, mentions: mentions)
        DispatchQueue.main.async {
            self.sendCallNotificationCallIdApplicationNotifyTypeMentionsReceivedInvocations.append((callId: callId, application: application, notifyType: notifyType, mentions: mentions))
        }
        try await sendCallNotificationCallIdApplicationNotifyTypeMentionsClosure?(callId, application, notifyType, mentions)
    }

    //MARK: - sendCallNotificationIfNeeded

    open var sendCallNotificationIfNeededThrowableError: Error?
    var sendCallNotificationIfNeededUnderlyingCallsCount = 0
    open var sendCallNotificationIfNeededCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendCallNotificationIfNeededUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendCallNotificationIfNeededUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendCallNotificationIfNeededUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendCallNotificationIfNeededUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendCallNotificationIfNeededCalled: Bool {
        return sendCallNotificationIfNeededCallsCount > 0
    }

    var sendCallNotificationIfNeededUnderlyingReturnValue: Bool!
    open var sendCallNotificationIfNeededReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return sendCallNotificationIfNeededUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = sendCallNotificationIfNeededUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendCallNotificationIfNeededUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendCallNotificationIfNeededUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sendCallNotificationIfNeededClosure: (() async throws -> Bool)?

    open override func sendCallNotificationIfNeeded() async throws -> Bool {
        if let error = sendCallNotificationIfNeededThrowableError {
            throw error
        }
        sendCallNotificationIfNeededCallsCount += 1
        if let sendCallNotificationIfNeededClosure = sendCallNotificationIfNeededClosure {
            return try await sendCallNotificationIfNeededClosure()
        } else {
            return sendCallNotificationIfNeededReturnValue
        }
    }

    //MARK: - sendLiveLocation

    open var sendLiveLocationGeoUriThrowableError: Error?
    var sendLiveLocationGeoUriUnderlyingCallsCount = 0
    open var sendLiveLocationGeoUriCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendLiveLocationGeoUriUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendLiveLocationGeoUriUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendLiveLocationGeoUriUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendLiveLocationGeoUriUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendLiveLocationGeoUriCalled: Bool {
        return sendLiveLocationGeoUriCallsCount > 0
    }
    open var sendLiveLocationGeoUriReceivedGeoUri: String?
    open var sendLiveLocationGeoUriReceivedInvocations: [String] = []
    open var sendLiveLocationGeoUriClosure: ((String) async throws -> Void)?

    open override func sendLiveLocation(geoUri: String) async throws {
        if let error = sendLiveLocationGeoUriThrowableError {
            throw error
        }
        sendLiveLocationGeoUriCallsCount += 1
        sendLiveLocationGeoUriReceivedGeoUri = geoUri
        DispatchQueue.main.async {
            self.sendLiveLocationGeoUriReceivedInvocations.append(geoUri)
        }
        try await sendLiveLocationGeoUriClosure?(geoUri)
    }

    //MARK: - sendRaw

    open var sendRawEventTypeContentThrowableError: Error?
    var sendRawEventTypeContentUnderlyingCallsCount = 0
    open var sendRawEventTypeContentCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendRawEventTypeContentUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendRawEventTypeContentUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendRawEventTypeContentUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendRawEventTypeContentUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendRawEventTypeContentCalled: Bool {
        return sendRawEventTypeContentCallsCount > 0
    }
    open var sendRawEventTypeContentReceivedArguments: (eventType: String, content: String)?
    open var sendRawEventTypeContentReceivedInvocations: [(eventType: String, content: String)] = []
    open var sendRawEventTypeContentClosure: ((String, String) async throws -> Void)?

    open override func sendRaw(eventType: String, content: String) async throws {
        if let error = sendRawEventTypeContentThrowableError {
            throw error
        }
        sendRawEventTypeContentCallsCount += 1
        sendRawEventTypeContentReceivedArguments = (eventType: eventType, content: content)
        DispatchQueue.main.async {
            self.sendRawEventTypeContentReceivedInvocations.append((eventType: eventType, content: content))
        }
        try await sendRawEventTypeContentClosure?(eventType, content)
    }

    //MARK: - setIsFavourite

    open var setIsFavouriteIsFavouriteTagOrderThrowableError: Error?
    var setIsFavouriteIsFavouriteTagOrderUnderlyingCallsCount = 0
    open var setIsFavouriteIsFavouriteTagOrderCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setIsFavouriteIsFavouriteTagOrderUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setIsFavouriteIsFavouriteTagOrderUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setIsFavouriteIsFavouriteTagOrderUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setIsFavouriteIsFavouriteTagOrderUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setIsFavouriteIsFavouriteTagOrderCalled: Bool {
        return setIsFavouriteIsFavouriteTagOrderCallsCount > 0
    }
    open var setIsFavouriteIsFavouriteTagOrderReceivedArguments: (isFavourite: Bool, tagOrder: Double?)?
    open var setIsFavouriteIsFavouriteTagOrderReceivedInvocations: [(isFavourite: Bool, tagOrder: Double?)] = []
    open var setIsFavouriteIsFavouriteTagOrderClosure: ((Bool, Double?) async throws -> Void)?

    open override func setIsFavourite(isFavourite: Bool, tagOrder: Double?) async throws {
        if let error = setIsFavouriteIsFavouriteTagOrderThrowableError {
            throw error
        }
        setIsFavouriteIsFavouriteTagOrderCallsCount += 1
        setIsFavouriteIsFavouriteTagOrderReceivedArguments = (isFavourite: isFavourite, tagOrder: tagOrder)
        DispatchQueue.main.async {
            self.setIsFavouriteIsFavouriteTagOrderReceivedInvocations.append((isFavourite: isFavourite, tagOrder: tagOrder))
        }
        try await setIsFavouriteIsFavouriteTagOrderClosure?(isFavourite, tagOrder)
    }

    //MARK: - setIsLowPriority

    open var setIsLowPriorityIsLowPriorityTagOrderThrowableError: Error?
    var setIsLowPriorityIsLowPriorityTagOrderUnderlyingCallsCount = 0
    open var setIsLowPriorityIsLowPriorityTagOrderCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setIsLowPriorityIsLowPriorityTagOrderUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setIsLowPriorityIsLowPriorityTagOrderUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setIsLowPriorityIsLowPriorityTagOrderUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setIsLowPriorityIsLowPriorityTagOrderUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setIsLowPriorityIsLowPriorityTagOrderCalled: Bool {
        return setIsLowPriorityIsLowPriorityTagOrderCallsCount > 0
    }
    open var setIsLowPriorityIsLowPriorityTagOrderReceivedArguments: (isLowPriority: Bool, tagOrder: Double?)?
    open var setIsLowPriorityIsLowPriorityTagOrderReceivedInvocations: [(isLowPriority: Bool, tagOrder: Double?)] = []
    open var setIsLowPriorityIsLowPriorityTagOrderClosure: ((Bool, Double?) async throws -> Void)?

    open override func setIsLowPriority(isLowPriority: Bool, tagOrder: Double?) async throws {
        if let error = setIsLowPriorityIsLowPriorityTagOrderThrowableError {
            throw error
        }
        setIsLowPriorityIsLowPriorityTagOrderCallsCount += 1
        setIsLowPriorityIsLowPriorityTagOrderReceivedArguments = (isLowPriority: isLowPriority, tagOrder: tagOrder)
        DispatchQueue.main.async {
            self.setIsLowPriorityIsLowPriorityTagOrderReceivedInvocations.append((isLowPriority: isLowPriority, tagOrder: tagOrder))
        }
        try await setIsLowPriorityIsLowPriorityTagOrderClosure?(isLowPriority, tagOrder)
    }

    //MARK: - setName

    open var setNameNameThrowableError: Error?
    var setNameNameUnderlyingCallsCount = 0
    open var setNameNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setNameNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setNameNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setNameNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setNameNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setNameNameCalled: Bool {
        return setNameNameCallsCount > 0
    }
    open var setNameNameReceivedName: String?
    open var setNameNameReceivedInvocations: [String] = []
    open var setNameNameClosure: ((String) async throws -> Void)?

    open override func setName(name: String) async throws {
        if let error = setNameNameThrowableError {
            throw error
        }
        setNameNameCallsCount += 1
        setNameNameReceivedName = name
        DispatchQueue.main.async {
            self.setNameNameReceivedInvocations.append(name)
        }
        try await setNameNameClosure?(name)
    }

    //MARK: - setTopic

    open var setTopicTopicThrowableError: Error?
    var setTopicTopicUnderlyingCallsCount = 0
    open var setTopicTopicCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setTopicTopicUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setTopicTopicUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setTopicTopicUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setTopicTopicUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setTopicTopicCalled: Bool {
        return setTopicTopicCallsCount > 0
    }
    open var setTopicTopicReceivedTopic: String?
    open var setTopicTopicReceivedInvocations: [String] = []
    open var setTopicTopicClosure: ((String) async throws -> Void)?

    open override func setTopic(topic: String) async throws {
        if let error = setTopicTopicThrowableError {
            throw error
        }
        setTopicTopicCallsCount += 1
        setTopicTopicReceivedTopic = topic
        DispatchQueue.main.async {
            self.setTopicTopicReceivedInvocations.append(topic)
        }
        try await setTopicTopicClosure?(topic)
    }

    //MARK: - setUnreadFlag

    open var setUnreadFlagNewValueThrowableError: Error?
    var setUnreadFlagNewValueUnderlyingCallsCount = 0
    open var setUnreadFlagNewValueCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setUnreadFlagNewValueUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setUnreadFlagNewValueUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUnreadFlagNewValueUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setUnreadFlagNewValueUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setUnreadFlagNewValueCalled: Bool {
        return setUnreadFlagNewValueCallsCount > 0
    }
    open var setUnreadFlagNewValueReceivedNewValue: Bool?
    open var setUnreadFlagNewValueReceivedInvocations: [Bool] = []
    open var setUnreadFlagNewValueClosure: ((Bool) async throws -> Void)?

    open override func setUnreadFlag(newValue: Bool) async throws {
        if let error = setUnreadFlagNewValueThrowableError {
            throw error
        }
        setUnreadFlagNewValueCallsCount += 1
        setUnreadFlagNewValueReceivedNewValue = newValue
        DispatchQueue.main.async {
            self.setUnreadFlagNewValueReceivedInvocations.append(newValue)
        }
        try await setUnreadFlagNewValueClosure?(newValue)
    }

    //MARK: - startLiveLocationShare

    open var startLiveLocationShareDurationMillisThrowableError: Error?
    var startLiveLocationShareDurationMillisUnderlyingCallsCount = 0
    open var startLiveLocationShareDurationMillisCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startLiveLocationShareDurationMillisUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startLiveLocationShareDurationMillisUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startLiveLocationShareDurationMillisUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startLiveLocationShareDurationMillisUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var startLiveLocationShareDurationMillisCalled: Bool {
        return startLiveLocationShareDurationMillisCallsCount > 0
    }
    open var startLiveLocationShareDurationMillisReceivedDurationMillis: UInt64?
    open var startLiveLocationShareDurationMillisReceivedInvocations: [UInt64] = []
    open var startLiveLocationShareDurationMillisClosure: ((UInt64) async throws -> Void)?

    open override func startLiveLocationShare(durationMillis: UInt64) async throws {
        if let error = startLiveLocationShareDurationMillisThrowableError {
            throw error
        }
        startLiveLocationShareDurationMillisCallsCount += 1
        startLiveLocationShareDurationMillisReceivedDurationMillis = durationMillis
        DispatchQueue.main.async {
            self.startLiveLocationShareDurationMillisReceivedInvocations.append(durationMillis)
        }
        try await startLiveLocationShareDurationMillisClosure?(durationMillis)
    }

    //MARK: - stopLiveLocationShare

    open var stopLiveLocationShareThrowableError: Error?
    var stopLiveLocationShareUnderlyingCallsCount = 0
    open var stopLiveLocationShareCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopLiveLocationShareUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopLiveLocationShareUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopLiveLocationShareUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopLiveLocationShareUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var stopLiveLocationShareCalled: Bool {
        return stopLiveLocationShareCallsCount > 0
    }
    open var stopLiveLocationShareClosure: (() async throws -> Void)?

    open override func stopLiveLocationShare() async throws {
        if let error = stopLiveLocationShareThrowableError {
            throw error
        }
        stopLiveLocationShareCallsCount += 1
        try await stopLiveLocationShareClosure?()
    }

    //MARK: - subscribeToIdentityStatusChanges

    open var subscribeToIdentityStatusChangesListenerThrowableError: Error?
    var subscribeToIdentityStatusChangesListenerUnderlyingCallsCount = 0
    open var subscribeToIdentityStatusChangesListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToIdentityStatusChangesListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToIdentityStatusChangesListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToIdentityStatusChangesListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToIdentityStatusChangesListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToIdentityStatusChangesListenerCalled: Bool {
        return subscribeToIdentityStatusChangesListenerCallsCount > 0
    }
    open var subscribeToIdentityStatusChangesListenerReceivedListener: IdentityStatusChangeListener?
    open var subscribeToIdentityStatusChangesListenerReceivedInvocations: [IdentityStatusChangeListener] = []

    var subscribeToIdentityStatusChangesListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToIdentityStatusChangesListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToIdentityStatusChangesListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToIdentityStatusChangesListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToIdentityStatusChangesListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToIdentityStatusChangesListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToIdentityStatusChangesListenerClosure: ((IdentityStatusChangeListener) async throws -> TaskHandle)?

    open override func subscribeToIdentityStatusChanges(listener: IdentityStatusChangeListener) async throws -> TaskHandle {
        if let error = subscribeToIdentityStatusChangesListenerThrowableError {
            throw error
        }
        subscribeToIdentityStatusChangesListenerCallsCount += 1
        subscribeToIdentityStatusChangesListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.subscribeToIdentityStatusChangesListenerReceivedInvocations.append(listener)
        }
        if let subscribeToIdentityStatusChangesListenerClosure = subscribeToIdentityStatusChangesListenerClosure {
            return try await subscribeToIdentityStatusChangesListenerClosure(listener)
        } else {
            return subscribeToIdentityStatusChangesListenerReturnValue
        }
    }

    //MARK: - subscribeToKnockRequests

    open var subscribeToKnockRequestsListenerThrowableError: Error?
    var subscribeToKnockRequestsListenerUnderlyingCallsCount = 0
    open var subscribeToKnockRequestsListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToKnockRequestsListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToKnockRequestsListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToKnockRequestsListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToKnockRequestsListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToKnockRequestsListenerCalled: Bool {
        return subscribeToKnockRequestsListenerCallsCount > 0
    }
    open var subscribeToKnockRequestsListenerReceivedListener: KnockRequestsListener?
    open var subscribeToKnockRequestsListenerReceivedInvocations: [KnockRequestsListener] = []

    var subscribeToKnockRequestsListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToKnockRequestsListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToKnockRequestsListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToKnockRequestsListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToKnockRequestsListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToKnockRequestsListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToKnockRequestsListenerClosure: ((KnockRequestsListener) async throws -> TaskHandle)?

    open override func subscribeToKnockRequests(listener: KnockRequestsListener) async throws -> TaskHandle {
        if let error = subscribeToKnockRequestsListenerThrowableError {
            throw error
        }
        subscribeToKnockRequestsListenerCallsCount += 1
        subscribeToKnockRequestsListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.subscribeToKnockRequestsListenerReceivedInvocations.append(listener)
        }
        if let subscribeToKnockRequestsListenerClosure = subscribeToKnockRequestsListenerClosure {
            return try await subscribeToKnockRequestsListenerClosure(listener)
        } else {
            return subscribeToKnockRequestsListenerReturnValue
        }
    }

    //MARK: - subscribeToLiveLocationShares

    var subscribeToLiveLocationSharesListenerUnderlyingCallsCount = 0
    open var subscribeToLiveLocationSharesListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToLiveLocationSharesListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToLiveLocationSharesListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToLiveLocationSharesListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToLiveLocationSharesListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToLiveLocationSharesListenerCalled: Bool {
        return subscribeToLiveLocationSharesListenerCallsCount > 0
    }
    open var subscribeToLiveLocationSharesListenerReceivedListener: LiveLocationShareListener?
    open var subscribeToLiveLocationSharesListenerReceivedInvocations: [LiveLocationShareListener] = []

    var subscribeToLiveLocationSharesListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToLiveLocationSharesListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToLiveLocationSharesListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToLiveLocationSharesListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToLiveLocationSharesListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToLiveLocationSharesListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToLiveLocationSharesListenerClosure: ((LiveLocationShareListener) -> TaskHandle)?

    open override func subscribeToLiveLocationShares(listener: LiveLocationShareListener) -> TaskHandle {
        subscribeToLiveLocationSharesListenerCallsCount += 1
        subscribeToLiveLocationSharesListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.subscribeToLiveLocationSharesListenerReceivedInvocations.append(listener)
        }
        if let subscribeToLiveLocationSharesListenerClosure = subscribeToLiveLocationSharesListenerClosure {
            return subscribeToLiveLocationSharesListenerClosure(listener)
        } else {
            return subscribeToLiveLocationSharesListenerReturnValue
        }
    }

    //MARK: - subscribeToRoomInfoUpdates

    var subscribeToRoomInfoUpdatesListenerUnderlyingCallsCount = 0
    open var subscribeToRoomInfoUpdatesListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToRoomInfoUpdatesListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToRoomInfoUpdatesListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToRoomInfoUpdatesListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToRoomInfoUpdatesListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToRoomInfoUpdatesListenerCalled: Bool {
        return subscribeToRoomInfoUpdatesListenerCallsCount > 0
    }
    open var subscribeToRoomInfoUpdatesListenerReceivedListener: RoomInfoListener?
    open var subscribeToRoomInfoUpdatesListenerReceivedInvocations: [RoomInfoListener] = []

    var subscribeToRoomInfoUpdatesListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToRoomInfoUpdatesListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToRoomInfoUpdatesListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToRoomInfoUpdatesListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToRoomInfoUpdatesListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToRoomInfoUpdatesListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToRoomInfoUpdatesListenerClosure: ((RoomInfoListener) -> TaskHandle)?

    open override func subscribeToRoomInfoUpdates(listener: RoomInfoListener) -> TaskHandle {
        subscribeToRoomInfoUpdatesListenerCallsCount += 1
        subscribeToRoomInfoUpdatesListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.subscribeToRoomInfoUpdatesListenerReceivedInvocations.append(listener)
        }
        if let subscribeToRoomInfoUpdatesListenerClosure = subscribeToRoomInfoUpdatesListenerClosure {
            return subscribeToRoomInfoUpdatesListenerClosure(listener)
        } else {
            return subscribeToRoomInfoUpdatesListenerReturnValue
        }
    }

    //MARK: - subscribeToTypingNotifications

    var subscribeToTypingNotificationsListenerUnderlyingCallsCount = 0
    open var subscribeToTypingNotificationsListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToTypingNotificationsListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToTypingNotificationsListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToTypingNotificationsListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToTypingNotificationsListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToTypingNotificationsListenerCalled: Bool {
        return subscribeToTypingNotificationsListenerCallsCount > 0
    }
    open var subscribeToTypingNotificationsListenerReceivedListener: TypingNotificationsListener?
    open var subscribeToTypingNotificationsListenerReceivedInvocations: [TypingNotificationsListener] = []

    var subscribeToTypingNotificationsListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToTypingNotificationsListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToTypingNotificationsListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToTypingNotificationsListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToTypingNotificationsListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToTypingNotificationsListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToTypingNotificationsListenerClosure: ((TypingNotificationsListener) -> TaskHandle)?

    open override func subscribeToTypingNotifications(listener: TypingNotificationsListener) -> TaskHandle {
        subscribeToTypingNotificationsListenerCallsCount += 1
        subscribeToTypingNotificationsListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.subscribeToTypingNotificationsListenerReceivedInvocations.append(listener)
        }
        if let subscribeToTypingNotificationsListenerClosure = subscribeToTypingNotificationsListenerClosure {
            return subscribeToTypingNotificationsListenerClosure(listener)
        } else {
            return subscribeToTypingNotificationsListenerReturnValue
        }
    }

    //MARK: - successorRoom

    var successorRoomUnderlyingCallsCount = 0
    open var successorRoomCallsCount: Int {
        get {
            if Thread.isMainThread {
                return successorRoomUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = successorRoomUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                successorRoomUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    successorRoomUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var successorRoomCalled: Bool {
        return successorRoomCallsCount > 0
    }

    var successorRoomUnderlyingReturnValue: SuccessorRoom?
    open var successorRoomReturnValue: SuccessorRoom? {
        get {
            if Thread.isMainThread {
                return successorRoomUnderlyingReturnValue
            } else {
                var returnValue: SuccessorRoom?? = nil
                DispatchQueue.main.sync {
                    returnValue = successorRoomUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                successorRoomUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    successorRoomUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var successorRoomClosure: (() -> SuccessorRoom?)?

    open override func successorRoom() -> SuccessorRoom? {
        successorRoomCallsCount += 1
        if let successorRoomClosure = successorRoomClosure {
            return successorRoomClosure()
        } else {
            return successorRoomReturnValue
        }
    }

    //MARK: - suggestedRoleForUser

    open var suggestedRoleForUserUserIdThrowableError: Error?
    var suggestedRoleForUserUserIdUnderlyingCallsCount = 0
    open var suggestedRoleForUserUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return suggestedRoleForUserUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = suggestedRoleForUserUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                suggestedRoleForUserUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    suggestedRoleForUserUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var suggestedRoleForUserUserIdCalled: Bool {
        return suggestedRoleForUserUserIdCallsCount > 0
    }
    open var suggestedRoleForUserUserIdReceivedUserId: String?
    open var suggestedRoleForUserUserIdReceivedInvocations: [String] = []

    var suggestedRoleForUserUserIdUnderlyingReturnValue: RoomMemberRole!
    open var suggestedRoleForUserUserIdReturnValue: RoomMemberRole! {
        get {
            if Thread.isMainThread {
                return suggestedRoleForUserUserIdUnderlyingReturnValue
            } else {
                var returnValue: RoomMemberRole? = nil
                DispatchQueue.main.sync {
                    returnValue = suggestedRoleForUserUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                suggestedRoleForUserUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    suggestedRoleForUserUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var suggestedRoleForUserUserIdClosure: ((String) async throws -> RoomMemberRole)?

    open override func suggestedRoleForUser(userId: String) async throws -> RoomMemberRole {
        if let error = suggestedRoleForUserUserIdThrowableError {
            throw error
        }
        suggestedRoleForUserUserIdCallsCount += 1
        suggestedRoleForUserUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.suggestedRoleForUserUserIdReceivedInvocations.append(userId)
        }
        if let suggestedRoleForUserUserIdClosure = suggestedRoleForUserUserIdClosure {
            return try await suggestedRoleForUserUserIdClosure(userId)
        } else {
            return suggestedRoleForUserUserIdReturnValue
        }
    }

    //MARK: - timeline

    open var timelineThrowableError: Error?
    var timelineUnderlyingCallsCount = 0
    open var timelineCallsCount: Int {
        get {
            if Thread.isMainThread {
                return timelineUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = timelineUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                timelineUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    timelineUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var timelineCalled: Bool {
        return timelineCallsCount > 0
    }

    var timelineUnderlyingReturnValue: Timeline!
    open var timelineReturnValue: Timeline! {
        get {
            if Thread.isMainThread {
                return timelineUnderlyingReturnValue
            } else {
                var returnValue: Timeline? = nil
                DispatchQueue.main.sync {
                    returnValue = timelineUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                timelineUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    timelineUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var timelineClosure: (() async throws -> Timeline)?

    open override func timeline() async throws -> Timeline {
        if let error = timelineThrowableError {
            throw error
        }
        timelineCallsCount += 1
        if let timelineClosure = timelineClosure {
            return try await timelineClosure()
        } else {
            return timelineReturnValue
        }
    }

    //MARK: - timelineWithConfiguration

    open var timelineWithConfigurationConfigurationThrowableError: Error?
    var timelineWithConfigurationConfigurationUnderlyingCallsCount = 0
    open var timelineWithConfigurationConfigurationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return timelineWithConfigurationConfigurationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = timelineWithConfigurationConfigurationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                timelineWithConfigurationConfigurationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    timelineWithConfigurationConfigurationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var timelineWithConfigurationConfigurationCalled: Bool {
        return timelineWithConfigurationConfigurationCallsCount > 0
    }
    open var timelineWithConfigurationConfigurationReceivedConfiguration: TimelineConfiguration?
    open var timelineWithConfigurationConfigurationReceivedInvocations: [TimelineConfiguration] = []

    var timelineWithConfigurationConfigurationUnderlyingReturnValue: Timeline!
    open var timelineWithConfigurationConfigurationReturnValue: Timeline! {
        get {
            if Thread.isMainThread {
                return timelineWithConfigurationConfigurationUnderlyingReturnValue
            } else {
                var returnValue: Timeline? = nil
                DispatchQueue.main.sync {
                    returnValue = timelineWithConfigurationConfigurationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                timelineWithConfigurationConfigurationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    timelineWithConfigurationConfigurationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var timelineWithConfigurationConfigurationClosure: ((TimelineConfiguration) async throws -> Timeline)?

    open override func timelineWithConfiguration(configuration: TimelineConfiguration) async throws -> Timeline {
        if let error = timelineWithConfigurationConfigurationThrowableError {
            throw error
        }
        timelineWithConfigurationConfigurationCallsCount += 1
        timelineWithConfigurationConfigurationReceivedConfiguration = configuration
        DispatchQueue.main.async {
            self.timelineWithConfigurationConfigurationReceivedInvocations.append(configuration)
        }
        if let timelineWithConfigurationConfigurationClosure = timelineWithConfigurationConfigurationClosure {
            return try await timelineWithConfigurationConfigurationClosure(configuration)
        } else {
            return timelineWithConfigurationConfigurationReturnValue
        }
    }

    //MARK: - topic

    var topicUnderlyingCallsCount = 0
    open var topicCallsCount: Int {
        get {
            if Thread.isMainThread {
                return topicUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = topicUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                topicUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    topicUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var topicCalled: Bool {
        return topicCallsCount > 0
    }

    var topicUnderlyingReturnValue: String?
    open var topicReturnValue: String? {
        get {
            if Thread.isMainThread {
                return topicUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = topicUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                topicUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    topicUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var topicClosure: (() -> String?)?

    open override func topic() -> String? {
        topicCallsCount += 1
        if let topicClosure = topicClosure {
            return topicClosure()
        } else {
            return topicReturnValue
        }
    }

    //MARK: - typingNotice

    open var typingNoticeIsTypingThrowableError: Error?
    var typingNoticeIsTypingUnderlyingCallsCount = 0
    open var typingNoticeIsTypingCallsCount: Int {
        get {
            if Thread.isMainThread {
                return typingNoticeIsTypingUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = typingNoticeIsTypingUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                typingNoticeIsTypingUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    typingNoticeIsTypingUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var typingNoticeIsTypingCalled: Bool {
        return typingNoticeIsTypingCallsCount > 0
    }
    open var typingNoticeIsTypingReceivedIsTyping: Bool?
    open var typingNoticeIsTypingReceivedInvocations: [Bool] = []
    open var typingNoticeIsTypingClosure: ((Bool) async throws -> Void)?

    open override func typingNotice(isTyping: Bool) async throws {
        if let error = typingNoticeIsTypingThrowableError {
            throw error
        }
        typingNoticeIsTypingCallsCount += 1
        typingNoticeIsTypingReceivedIsTyping = isTyping
        DispatchQueue.main.async {
            self.typingNoticeIsTypingReceivedInvocations.append(isTyping)
        }
        try await typingNoticeIsTypingClosure?(isTyping)
    }

    //MARK: - unbanUser

    open var unbanUserUserIdReasonThrowableError: Error?
    var unbanUserUserIdReasonUnderlyingCallsCount = 0
    open var unbanUserUserIdReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unbanUserUserIdReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unbanUserUserIdReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unbanUserUserIdReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unbanUserUserIdReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var unbanUserUserIdReasonCalled: Bool {
        return unbanUserUserIdReasonCallsCount > 0
    }
    open var unbanUserUserIdReasonReceivedArguments: (userId: String, reason: String?)?
    open var unbanUserUserIdReasonReceivedInvocations: [(userId: String, reason: String?)] = []
    open var unbanUserUserIdReasonClosure: ((String, String?) async throws -> Void)?

    open override func unbanUser(userId: String, reason: String?) async throws {
        if let error = unbanUserUserIdReasonThrowableError {
            throw error
        }
        unbanUserUserIdReasonCallsCount += 1
        unbanUserUserIdReasonReceivedArguments = (userId: userId, reason: reason)
        DispatchQueue.main.async {
            self.unbanUserUserIdReasonReceivedInvocations.append((userId: userId, reason: reason))
        }
        try await unbanUserUserIdReasonClosure?(userId, reason)
    }

    //MARK: - updateCanonicalAlias

    open var updateCanonicalAliasAliasAltAliasesThrowableError: Error?
    var updateCanonicalAliasAliasAltAliasesUnderlyingCallsCount = 0
    open var updateCanonicalAliasAliasAltAliasesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return updateCanonicalAliasAliasAltAliasesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = updateCanonicalAliasAliasAltAliasesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                updateCanonicalAliasAliasAltAliasesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    updateCanonicalAliasAliasAltAliasesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var updateCanonicalAliasAliasAltAliasesCalled: Bool {
        return updateCanonicalAliasAliasAltAliasesCallsCount > 0
    }
    open var updateCanonicalAliasAliasAltAliasesReceivedArguments: (alias: String?, altAliases: [String])?
    open var updateCanonicalAliasAliasAltAliasesReceivedInvocations: [(alias: String?, altAliases: [String])] = []
    open var updateCanonicalAliasAliasAltAliasesClosure: ((String?, [String]) async throws -> Void)?

    open override func updateCanonicalAlias(alias: String?, altAliases: [String]) async throws {
        if let error = updateCanonicalAliasAliasAltAliasesThrowableError {
            throw error
        }
        updateCanonicalAliasAliasAltAliasesCallsCount += 1
        updateCanonicalAliasAliasAltAliasesReceivedArguments = (alias: alias, altAliases: altAliases)
        DispatchQueue.main.async {
            self.updateCanonicalAliasAliasAltAliasesReceivedInvocations.append((alias: alias, altAliases: altAliases))
        }
        try await updateCanonicalAliasAliasAltAliasesClosure?(alias, altAliases)
    }

    //MARK: - updateHistoryVisibility

    open var updateHistoryVisibilityVisibilityThrowableError: Error?
    var updateHistoryVisibilityVisibilityUnderlyingCallsCount = 0
    open var updateHistoryVisibilityVisibilityCallsCount: Int {
        get {
            if Thread.isMainThread {
                return updateHistoryVisibilityVisibilityUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = updateHistoryVisibilityVisibilityUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                updateHistoryVisibilityVisibilityUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    updateHistoryVisibilityVisibilityUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var updateHistoryVisibilityVisibilityCalled: Bool {
        return updateHistoryVisibilityVisibilityCallsCount > 0
    }
    open var updateHistoryVisibilityVisibilityReceivedVisibility: RoomHistoryVisibility?
    open var updateHistoryVisibilityVisibilityReceivedInvocations: [RoomHistoryVisibility] = []
    open var updateHistoryVisibilityVisibilityClosure: ((RoomHistoryVisibility) async throws -> Void)?

    open override func updateHistoryVisibility(visibility: RoomHistoryVisibility) async throws {
        if let error = updateHistoryVisibilityVisibilityThrowableError {
            throw error
        }
        updateHistoryVisibilityVisibilityCallsCount += 1
        updateHistoryVisibilityVisibilityReceivedVisibility = visibility
        DispatchQueue.main.async {
            self.updateHistoryVisibilityVisibilityReceivedInvocations.append(visibility)
        }
        try await updateHistoryVisibilityVisibilityClosure?(visibility)
    }

    //MARK: - updateJoinRules

    open var updateJoinRulesNewRuleThrowableError: Error?
    var updateJoinRulesNewRuleUnderlyingCallsCount = 0
    open var updateJoinRulesNewRuleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return updateJoinRulesNewRuleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = updateJoinRulesNewRuleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                updateJoinRulesNewRuleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    updateJoinRulesNewRuleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var updateJoinRulesNewRuleCalled: Bool {
        return updateJoinRulesNewRuleCallsCount > 0
    }
    open var updateJoinRulesNewRuleReceivedNewRule: JoinRule?
    open var updateJoinRulesNewRuleReceivedInvocations: [JoinRule] = []
    open var updateJoinRulesNewRuleClosure: ((JoinRule) async throws -> Void)?

    open override func updateJoinRules(newRule: JoinRule) async throws {
        if let error = updateJoinRulesNewRuleThrowableError {
            throw error
        }
        updateJoinRulesNewRuleCallsCount += 1
        updateJoinRulesNewRuleReceivedNewRule = newRule
        DispatchQueue.main.async {
            self.updateJoinRulesNewRuleReceivedInvocations.append(newRule)
        }
        try await updateJoinRulesNewRuleClosure?(newRule)
    }

    //MARK: - updatePowerLevelsForUsers

    open var updatePowerLevelsForUsersUpdatesThrowableError: Error?
    var updatePowerLevelsForUsersUpdatesUnderlyingCallsCount = 0
    open var updatePowerLevelsForUsersUpdatesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return updatePowerLevelsForUsersUpdatesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = updatePowerLevelsForUsersUpdatesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                updatePowerLevelsForUsersUpdatesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    updatePowerLevelsForUsersUpdatesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var updatePowerLevelsForUsersUpdatesCalled: Bool {
        return updatePowerLevelsForUsersUpdatesCallsCount > 0
    }
    open var updatePowerLevelsForUsersUpdatesReceivedUpdates: [UserPowerLevelUpdate]?
    open var updatePowerLevelsForUsersUpdatesReceivedInvocations: [[UserPowerLevelUpdate]] = []
    open var updatePowerLevelsForUsersUpdatesClosure: (([UserPowerLevelUpdate]) async throws -> Void)?

    open override func updatePowerLevelsForUsers(updates: [UserPowerLevelUpdate]) async throws {
        if let error = updatePowerLevelsForUsersUpdatesThrowableError {
            throw error
        }
        updatePowerLevelsForUsersUpdatesCallsCount += 1
        updatePowerLevelsForUsersUpdatesReceivedUpdates = updates
        DispatchQueue.main.async {
            self.updatePowerLevelsForUsersUpdatesReceivedInvocations.append(updates)
        }
        try await updatePowerLevelsForUsersUpdatesClosure?(updates)
    }

    //MARK: - updateRoomVisibility

    open var updateRoomVisibilityVisibilityThrowableError: Error?
    var updateRoomVisibilityVisibilityUnderlyingCallsCount = 0
    open var updateRoomVisibilityVisibilityCallsCount: Int {
        get {
            if Thread.isMainThread {
                return updateRoomVisibilityVisibilityUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = updateRoomVisibilityVisibilityUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                updateRoomVisibilityVisibilityUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    updateRoomVisibilityVisibilityUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var updateRoomVisibilityVisibilityCalled: Bool {
        return updateRoomVisibilityVisibilityCallsCount > 0
    }
    open var updateRoomVisibilityVisibilityReceivedVisibility: RoomVisibility?
    open var updateRoomVisibilityVisibilityReceivedInvocations: [RoomVisibility] = []
    open var updateRoomVisibilityVisibilityClosure: ((RoomVisibility) async throws -> Void)?

    open override func updateRoomVisibility(visibility: RoomVisibility) async throws {
        if let error = updateRoomVisibilityVisibilityThrowableError {
            throw error
        }
        updateRoomVisibilityVisibilityCallsCount += 1
        updateRoomVisibilityVisibilityReceivedVisibility = visibility
        DispatchQueue.main.async {
            self.updateRoomVisibilityVisibilityReceivedInvocations.append(visibility)
        }
        try await updateRoomVisibilityVisibilityClosure?(visibility)
    }

    //MARK: - uploadAvatar

    open var uploadAvatarMimeTypeDataMediaInfoThrowableError: Error?
    var uploadAvatarMimeTypeDataMediaInfoUnderlyingCallsCount = 0
    open var uploadAvatarMimeTypeDataMediaInfoCallsCount: Int {
        get {
            if Thread.isMainThread {
                return uploadAvatarMimeTypeDataMediaInfoUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = uploadAvatarMimeTypeDataMediaInfoUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uploadAvatarMimeTypeDataMediaInfoUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    uploadAvatarMimeTypeDataMediaInfoUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var uploadAvatarMimeTypeDataMediaInfoCalled: Bool {
        return uploadAvatarMimeTypeDataMediaInfoCallsCount > 0
    }
    open var uploadAvatarMimeTypeDataMediaInfoReceivedArguments: (mimeType: String, data: Data, mediaInfo: ImageInfo?)?
    open var uploadAvatarMimeTypeDataMediaInfoReceivedInvocations: [(mimeType: String, data: Data, mediaInfo: ImageInfo?)] = []
    open var uploadAvatarMimeTypeDataMediaInfoClosure: ((String, Data, ImageInfo?) async throws -> Void)?

    open override func uploadAvatar(mimeType: String, data: Data, mediaInfo: ImageInfo?) async throws {
        if let error = uploadAvatarMimeTypeDataMediaInfoThrowableError {
            throw error
        }
        uploadAvatarMimeTypeDataMediaInfoCallsCount += 1
        uploadAvatarMimeTypeDataMediaInfoReceivedArguments = (mimeType: mimeType, data: data, mediaInfo: mediaInfo)
        DispatchQueue.main.async {
            self.uploadAvatarMimeTypeDataMediaInfoReceivedInvocations.append((mimeType: mimeType, data: data, mediaInfo: mediaInfo))
        }
        try await uploadAvatarMimeTypeDataMediaInfoClosure?(mimeType, data, mediaInfo)
    }

    //MARK: - withdrawVerificationAndResend

    open var withdrawVerificationAndResendUserIdsSendHandleThrowableError: Error?
    var withdrawVerificationAndResendUserIdsSendHandleUnderlyingCallsCount = 0
    open var withdrawVerificationAndResendUserIdsSendHandleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return withdrawVerificationAndResendUserIdsSendHandleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = withdrawVerificationAndResendUserIdsSendHandleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withdrawVerificationAndResendUserIdsSendHandleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    withdrawVerificationAndResendUserIdsSendHandleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var withdrawVerificationAndResendUserIdsSendHandleCalled: Bool {
        return withdrawVerificationAndResendUserIdsSendHandleCallsCount > 0
    }
    open var withdrawVerificationAndResendUserIdsSendHandleReceivedArguments: (userIds: [String], sendHandle: SendHandle)?
    open var withdrawVerificationAndResendUserIdsSendHandleReceivedInvocations: [(userIds: [String], sendHandle: SendHandle)] = []
    open var withdrawVerificationAndResendUserIdsSendHandleClosure: (([String], SendHandle) async throws -> Void)?

    open override func withdrawVerificationAndResend(userIds: [String], sendHandle: SendHandle) async throws {
        if let error = withdrawVerificationAndResendUserIdsSendHandleThrowableError {
            throw error
        }
        withdrawVerificationAndResendUserIdsSendHandleCallsCount += 1
        withdrawVerificationAndResendUserIdsSendHandleReceivedArguments = (userIds: userIds, sendHandle: sendHandle)
        DispatchQueue.main.async {
            self.withdrawVerificationAndResendUserIdsSendHandleReceivedInvocations.append((userIds: userIds, sendHandle: sendHandle))
        }
        try await withdrawVerificationAndResendUserIdsSendHandleClosure?(userIds, sendHandle)
    }
}
open class RoomDirectorySearchSDKMock: MatrixRustSDK.RoomDirectorySearch, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - isAtLastPage

    open var isAtLastPageThrowableError: Error?
    var isAtLastPageUnderlyingCallsCount = 0
    open var isAtLastPageCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isAtLastPageUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isAtLastPageUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isAtLastPageUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isAtLastPageUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isAtLastPageCalled: Bool {
        return isAtLastPageCallsCount > 0
    }

    var isAtLastPageUnderlyingReturnValue: Bool!
    open var isAtLastPageReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isAtLastPageUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isAtLastPageUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isAtLastPageUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isAtLastPageUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isAtLastPageClosure: (() async throws -> Bool)?

    open override func isAtLastPage() async throws -> Bool {
        if let error = isAtLastPageThrowableError {
            throw error
        }
        isAtLastPageCallsCount += 1
        if let isAtLastPageClosure = isAtLastPageClosure {
            return try await isAtLastPageClosure()
        } else {
            return isAtLastPageReturnValue
        }
    }

    //MARK: - loadedPages

    open var loadedPagesThrowableError: Error?
    var loadedPagesUnderlyingCallsCount = 0
    open var loadedPagesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadedPagesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadedPagesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadedPagesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadedPagesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var loadedPagesCalled: Bool {
        return loadedPagesCallsCount > 0
    }

    var loadedPagesUnderlyingReturnValue: UInt32!
    open var loadedPagesReturnValue: UInt32! {
        get {
            if Thread.isMainThread {
                return loadedPagesUnderlyingReturnValue
            } else {
                var returnValue: UInt32? = nil
                DispatchQueue.main.sync {
                    returnValue = loadedPagesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadedPagesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadedPagesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var loadedPagesClosure: (() async throws -> UInt32)?

    open override func loadedPages() async throws -> UInt32 {
        if let error = loadedPagesThrowableError {
            throw error
        }
        loadedPagesCallsCount += 1
        if let loadedPagesClosure = loadedPagesClosure {
            return try await loadedPagesClosure()
        } else {
            return loadedPagesReturnValue
        }
    }

    //MARK: - nextPage

    open var nextPageThrowableError: Error?
    var nextPageUnderlyingCallsCount = 0
    open var nextPageCallsCount: Int {
        get {
            if Thread.isMainThread {
                return nextPageUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = nextPageUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                nextPageUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    nextPageUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var nextPageCalled: Bool {
        return nextPageCallsCount > 0
    }
    open var nextPageClosure: (() async throws -> Void)?

    open override func nextPage() async throws {
        if let error = nextPageThrowableError {
            throw error
        }
        nextPageCallsCount += 1
        try await nextPageClosure?()
    }

    //MARK: - results

    var resultsListenerUnderlyingCallsCount = 0
    open var resultsListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resultsListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resultsListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resultsListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resultsListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var resultsListenerCalled: Bool {
        return resultsListenerCallsCount > 0
    }
    open var resultsListenerReceivedListener: RoomDirectorySearchEntriesListener?
    open var resultsListenerReceivedInvocations: [RoomDirectorySearchEntriesListener] = []

    var resultsListenerUnderlyingReturnValue: TaskHandle!
    open var resultsListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return resultsListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = resultsListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resultsListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    resultsListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var resultsListenerClosure: ((RoomDirectorySearchEntriesListener) async -> TaskHandle)?

    open override func results(listener: RoomDirectorySearchEntriesListener) async -> TaskHandle {
        resultsListenerCallsCount += 1
        resultsListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.resultsListenerReceivedInvocations.append(listener)
        }
        if let resultsListenerClosure = resultsListenerClosure {
            return await resultsListenerClosure(listener)
        } else {
            return resultsListenerReturnValue
        }
    }

    //MARK: - search

    open var searchFilterBatchSizeViaServerNameThrowableError: Error?
    var searchFilterBatchSizeViaServerNameUnderlyingCallsCount = 0
    open var searchFilterBatchSizeViaServerNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return searchFilterBatchSizeViaServerNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = searchFilterBatchSizeViaServerNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                searchFilterBatchSizeViaServerNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    searchFilterBatchSizeViaServerNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var searchFilterBatchSizeViaServerNameCalled: Bool {
        return searchFilterBatchSizeViaServerNameCallsCount > 0
    }
    open var searchFilterBatchSizeViaServerNameReceivedArguments: (filter: String?, batchSize: UInt32, viaServerName: String?)?
    open var searchFilterBatchSizeViaServerNameReceivedInvocations: [(filter: String?, batchSize: UInt32, viaServerName: String?)] = []
    open var searchFilterBatchSizeViaServerNameClosure: ((String?, UInt32, String?) async throws -> Void)?

    open override func search(filter: String?, batchSize: UInt32, viaServerName: String?) async throws {
        if let error = searchFilterBatchSizeViaServerNameThrowableError {
            throw error
        }
        searchFilterBatchSizeViaServerNameCallsCount += 1
        searchFilterBatchSizeViaServerNameReceivedArguments = (filter: filter, batchSize: batchSize, viaServerName: viaServerName)
        DispatchQueue.main.async {
            self.searchFilterBatchSizeViaServerNameReceivedInvocations.append((filter: filter, batchSize: batchSize, viaServerName: viaServerName))
        }
        try await searchFilterBatchSizeViaServerNameClosure?(filter, batchSize, viaServerName)
    }
}
open class RoomListSDKMock: MatrixRustSDK.RoomList, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - entriesWithDynamicAdapters

    var entriesWithDynamicAdaptersPageSizeListenerUnderlyingCallsCount = 0
    open var entriesWithDynamicAdaptersPageSizeListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return entriesWithDynamicAdaptersPageSizeListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = entriesWithDynamicAdaptersPageSizeListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                entriesWithDynamicAdaptersPageSizeListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    entriesWithDynamicAdaptersPageSizeListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var entriesWithDynamicAdaptersPageSizeListenerCalled: Bool {
        return entriesWithDynamicAdaptersPageSizeListenerCallsCount > 0
    }
    open var entriesWithDynamicAdaptersPageSizeListenerReceivedArguments: (pageSize: UInt32, listener: RoomListEntriesListener)?
    open var entriesWithDynamicAdaptersPageSizeListenerReceivedInvocations: [(pageSize: UInt32, listener: RoomListEntriesListener)] = []

    var entriesWithDynamicAdaptersPageSizeListenerUnderlyingReturnValue: RoomListEntriesWithDynamicAdaptersResult!
    open var entriesWithDynamicAdaptersPageSizeListenerReturnValue: RoomListEntriesWithDynamicAdaptersResult! {
        get {
            if Thread.isMainThread {
                return entriesWithDynamicAdaptersPageSizeListenerUnderlyingReturnValue
            } else {
                var returnValue: RoomListEntriesWithDynamicAdaptersResult? = nil
                DispatchQueue.main.sync {
                    returnValue = entriesWithDynamicAdaptersPageSizeListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                entriesWithDynamicAdaptersPageSizeListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    entriesWithDynamicAdaptersPageSizeListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var entriesWithDynamicAdaptersPageSizeListenerClosure: ((UInt32, RoomListEntriesListener) -> RoomListEntriesWithDynamicAdaptersResult)?

    open override func entriesWithDynamicAdapters(pageSize: UInt32, listener: RoomListEntriesListener) -> RoomListEntriesWithDynamicAdaptersResult {
        entriesWithDynamicAdaptersPageSizeListenerCallsCount += 1
        entriesWithDynamicAdaptersPageSizeListenerReceivedArguments = (pageSize: pageSize, listener: listener)
        DispatchQueue.main.async {
            self.entriesWithDynamicAdaptersPageSizeListenerReceivedInvocations.append((pageSize: pageSize, listener: listener))
        }
        if let entriesWithDynamicAdaptersPageSizeListenerClosure = entriesWithDynamicAdaptersPageSizeListenerClosure {
            return entriesWithDynamicAdaptersPageSizeListenerClosure(pageSize, listener)
        } else {
            return entriesWithDynamicAdaptersPageSizeListenerReturnValue
        }
    }

    //MARK: - loadingState

    open var loadingStateListenerThrowableError: Error?
    var loadingStateListenerUnderlyingCallsCount = 0
    open var loadingStateListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadingStateListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadingStateListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadingStateListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadingStateListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var loadingStateListenerCalled: Bool {
        return loadingStateListenerCallsCount > 0
    }
    open var loadingStateListenerReceivedListener: RoomListLoadingStateListener?
    open var loadingStateListenerReceivedInvocations: [RoomListLoadingStateListener] = []

    var loadingStateListenerUnderlyingReturnValue: RoomListLoadingStateResult!
    open var loadingStateListenerReturnValue: RoomListLoadingStateResult! {
        get {
            if Thread.isMainThread {
                return loadingStateListenerUnderlyingReturnValue
            } else {
                var returnValue: RoomListLoadingStateResult? = nil
                DispatchQueue.main.sync {
                    returnValue = loadingStateListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadingStateListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadingStateListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var loadingStateListenerClosure: ((RoomListLoadingStateListener) throws -> RoomListLoadingStateResult)?

    open override func loadingState(listener: RoomListLoadingStateListener) throws -> RoomListLoadingStateResult {
        if let error = loadingStateListenerThrowableError {
            throw error
        }
        loadingStateListenerCallsCount += 1
        loadingStateListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.loadingStateListenerReceivedInvocations.append(listener)
        }
        if let loadingStateListenerClosure = loadingStateListenerClosure {
            return try loadingStateListenerClosure(listener)
        } else {
            return loadingStateListenerReturnValue
        }
    }

    //MARK: - room

    open var roomRoomIdThrowableError: Error?
    var roomRoomIdUnderlyingCallsCount = 0
    open var roomRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var roomRoomIdCalled: Bool {
        return roomRoomIdCallsCount > 0
    }
    open var roomRoomIdReceivedRoomId: String?
    open var roomRoomIdReceivedInvocations: [String] = []

    var roomRoomIdUnderlyingReturnValue: Room!
    open var roomRoomIdReturnValue: Room! {
        get {
            if Thread.isMainThread {
                return roomRoomIdUnderlyingReturnValue
            } else {
                var returnValue: Room? = nil
                DispatchQueue.main.sync {
                    returnValue = roomRoomIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomRoomIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomRoomIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var roomRoomIdClosure: ((String) throws -> Room)?

    open override func room(roomId: String) throws -> Room {
        if let error = roomRoomIdThrowableError {
            throw error
        }
        roomRoomIdCallsCount += 1
        roomRoomIdReceivedRoomId = roomId
        DispatchQueue.main.async {
            self.roomRoomIdReceivedInvocations.append(roomId)
        }
        if let roomRoomIdClosure = roomRoomIdClosure {
            return try roomRoomIdClosure(roomId)
        } else {
            return roomRoomIdReturnValue
        }
    }
}
open class RoomListDynamicEntriesControllerSDKMock: MatrixRustSDK.RoomListDynamicEntriesController, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - addOnePage

    var addOnePageUnderlyingCallsCount = 0
    open var addOnePageCallsCount: Int {
        get {
            if Thread.isMainThread {
                return addOnePageUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = addOnePageUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                addOnePageUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    addOnePageUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var addOnePageCalled: Bool {
        return addOnePageCallsCount > 0
    }
    open var addOnePageClosure: (() -> Void)?

    open override func addOnePage() {
        addOnePageCallsCount += 1
        addOnePageClosure?()
    }

    //MARK: - resetToOnePage

    var resetToOnePageUnderlyingCallsCount = 0
    open var resetToOnePageCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetToOnePageUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetToOnePageUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetToOnePageUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetToOnePageUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var resetToOnePageCalled: Bool {
        return resetToOnePageCallsCount > 0
    }
    open var resetToOnePageClosure: (() -> Void)?

    open override func resetToOnePage() {
        resetToOnePageCallsCount += 1
        resetToOnePageClosure?()
    }

    //MARK: - setFilter

    var setFilterKindUnderlyingCallsCount = 0
    open var setFilterKindCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setFilterKindUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setFilterKindUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setFilterKindUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setFilterKindUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setFilterKindCalled: Bool {
        return setFilterKindCallsCount > 0
    }
    open var setFilterKindReceivedKind: RoomListEntriesDynamicFilterKind?
    open var setFilterKindReceivedInvocations: [RoomListEntriesDynamicFilterKind] = []

    var setFilterKindUnderlyingReturnValue: Bool!
    open var setFilterKindReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return setFilterKindUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = setFilterKindUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setFilterKindUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    setFilterKindUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var setFilterKindClosure: ((RoomListEntriesDynamicFilterKind) -> Bool)?

    open override func setFilter(kind: RoomListEntriesDynamicFilterKind) -> Bool {
        setFilterKindCallsCount += 1
        setFilterKindReceivedKind = kind
        DispatchQueue.main.async {
            self.setFilterKindReceivedInvocations.append(kind)
        }
        if let setFilterKindClosure = setFilterKindClosure {
            return setFilterKindClosure(kind)
        } else {
            return setFilterKindReturnValue
        }
    }
}
open class RoomListEntriesWithDynamicAdaptersResultSDKMock: MatrixRustSDK.RoomListEntriesWithDynamicAdaptersResult, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - controller

    var controllerUnderlyingCallsCount = 0
    open var controllerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return controllerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = controllerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                controllerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    controllerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var controllerCalled: Bool {
        return controllerCallsCount > 0
    }

    var controllerUnderlyingReturnValue: RoomListDynamicEntriesController!
    open var controllerReturnValue: RoomListDynamicEntriesController! {
        get {
            if Thread.isMainThread {
                return controllerUnderlyingReturnValue
            } else {
                var returnValue: RoomListDynamicEntriesController? = nil
                DispatchQueue.main.sync {
                    returnValue = controllerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                controllerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    controllerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var controllerClosure: (() -> RoomListDynamicEntriesController)?

    open override func controller() -> RoomListDynamicEntriesController {
        controllerCallsCount += 1
        if let controllerClosure = controllerClosure {
            return controllerClosure()
        } else {
            return controllerReturnValue
        }
    }

    //MARK: - entriesStream

    var entriesStreamUnderlyingCallsCount = 0
    open var entriesStreamCallsCount: Int {
        get {
            if Thread.isMainThread {
                return entriesStreamUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = entriesStreamUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                entriesStreamUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    entriesStreamUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var entriesStreamCalled: Bool {
        return entriesStreamCallsCount > 0
    }

    var entriesStreamUnderlyingReturnValue: TaskHandle!
    open var entriesStreamReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return entriesStreamUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = entriesStreamUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                entriesStreamUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    entriesStreamUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var entriesStreamClosure: (() -> TaskHandle)?

    open override func entriesStream() -> TaskHandle {
        entriesStreamCallsCount += 1
        if let entriesStreamClosure = entriesStreamClosure {
            return entriesStreamClosure()
        } else {
            return entriesStreamReturnValue
        }
    }
}
open class RoomListServiceSDKMock: MatrixRustSDK.RoomListService, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - allRooms

    open var allRoomsThrowableError: Error?
    var allRoomsUnderlyingCallsCount = 0
    open var allRoomsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return allRoomsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = allRoomsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                allRoomsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    allRoomsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var allRoomsCalled: Bool {
        return allRoomsCallsCount > 0
    }

    var allRoomsUnderlyingReturnValue: RoomList!
    open var allRoomsReturnValue: RoomList! {
        get {
            if Thread.isMainThread {
                return allRoomsUnderlyingReturnValue
            } else {
                var returnValue: RoomList? = nil
                DispatchQueue.main.sync {
                    returnValue = allRoomsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                allRoomsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    allRoomsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var allRoomsClosure: (() async throws -> RoomList)?

    open override func allRooms() async throws -> RoomList {
        if let error = allRoomsThrowableError {
            throw error
        }
        allRoomsCallsCount += 1
        if let allRoomsClosure = allRoomsClosure {
            return try await allRoomsClosure()
        } else {
            return allRoomsReturnValue
        }
    }

    //MARK: - room

    open var roomRoomIdThrowableError: Error?
    var roomRoomIdUnderlyingCallsCount = 0
    open var roomRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var roomRoomIdCalled: Bool {
        return roomRoomIdCallsCount > 0
    }
    open var roomRoomIdReceivedRoomId: String?
    open var roomRoomIdReceivedInvocations: [String] = []

    var roomRoomIdUnderlyingReturnValue: Room!
    open var roomRoomIdReturnValue: Room! {
        get {
            if Thread.isMainThread {
                return roomRoomIdUnderlyingReturnValue
            } else {
                var returnValue: Room? = nil
                DispatchQueue.main.sync {
                    returnValue = roomRoomIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomRoomIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomRoomIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var roomRoomIdClosure: ((String) throws -> Room)?

    open override func room(roomId: String) throws -> Room {
        if let error = roomRoomIdThrowableError {
            throw error
        }
        roomRoomIdCallsCount += 1
        roomRoomIdReceivedRoomId = roomId
        DispatchQueue.main.async {
            self.roomRoomIdReceivedInvocations.append(roomId)
        }
        if let roomRoomIdClosure = roomRoomIdClosure {
            return try roomRoomIdClosure(roomId)
        } else {
            return roomRoomIdReturnValue
        }
    }

    //MARK: - state

    var stateListenerUnderlyingCallsCount = 0
    open var stateListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stateListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stateListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stateListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stateListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var stateListenerCalled: Bool {
        return stateListenerCallsCount > 0
    }
    open var stateListenerReceivedListener: RoomListServiceStateListener?
    open var stateListenerReceivedInvocations: [RoomListServiceStateListener] = []

    var stateListenerUnderlyingReturnValue: TaskHandle!
    open var stateListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return stateListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = stateListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stateListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    stateListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var stateListenerClosure: ((RoomListServiceStateListener) -> TaskHandle)?

    open override func state(listener: RoomListServiceStateListener) -> TaskHandle {
        stateListenerCallsCount += 1
        stateListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.stateListenerReceivedInvocations.append(listener)
        }
        if let stateListenerClosure = stateListenerClosure {
            return stateListenerClosure(listener)
        } else {
            return stateListenerReturnValue
        }
    }

    //MARK: - subscribeToRooms

    open var subscribeToRoomsRoomIdsThrowableError: Error?
    var subscribeToRoomsRoomIdsUnderlyingCallsCount = 0
    open var subscribeToRoomsRoomIdsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToRoomsRoomIdsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToRoomsRoomIdsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToRoomsRoomIdsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToRoomsRoomIdsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToRoomsRoomIdsCalled: Bool {
        return subscribeToRoomsRoomIdsCallsCount > 0
    }
    open var subscribeToRoomsRoomIdsReceivedRoomIds: [String]?
    open var subscribeToRoomsRoomIdsReceivedInvocations: [[String]] = []
    open var subscribeToRoomsRoomIdsClosure: (([String]) async throws -> Void)?

    open override func subscribeToRooms(roomIds: [String]) async throws {
        if let error = subscribeToRoomsRoomIdsThrowableError {
            throw error
        }
        subscribeToRoomsRoomIdsCallsCount += 1
        subscribeToRoomsRoomIdsReceivedRoomIds = roomIds
        DispatchQueue.main.async {
            self.subscribeToRoomsRoomIdsReceivedInvocations.append(roomIds)
        }
        try await subscribeToRoomsRoomIdsClosure?(roomIds)
    }

    //MARK: - syncIndicator

    var syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingCallsCount = 0
    open var syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerCalled: Bool {
        return syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerCallsCount > 0
    }
    open var syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerReceivedArguments: (delayBeforeShowingInMs: UInt32, delayBeforeHidingInMs: UInt32, listener: RoomListServiceSyncIndicatorListener)?
    open var syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerReceivedInvocations: [(delayBeforeShowingInMs: UInt32, delayBeforeHidingInMs: UInt32, listener: RoomListServiceSyncIndicatorListener)] = []

    var syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingReturnValue: TaskHandle!
    open var syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerClosure: ((UInt32, UInt32, RoomListServiceSyncIndicatorListener) -> TaskHandle)?

    open override func syncIndicator(delayBeforeShowingInMs: UInt32, delayBeforeHidingInMs: UInt32, listener: RoomListServiceSyncIndicatorListener) -> TaskHandle {
        syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerCallsCount += 1
        syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerReceivedArguments = (delayBeforeShowingInMs: delayBeforeShowingInMs, delayBeforeHidingInMs: delayBeforeHidingInMs, listener: listener)
        DispatchQueue.main.async {
            self.syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerReceivedInvocations.append((delayBeforeShowingInMs: delayBeforeShowingInMs, delayBeforeHidingInMs: delayBeforeHidingInMs, listener: listener))
        }
        if let syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerClosure = syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerClosure {
            return syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerClosure(delayBeforeShowingInMs, delayBeforeHidingInMs, listener)
        } else {
            return syncIndicatorDelayBeforeShowingInMsDelayBeforeHidingInMsListenerReturnValue
        }
    }
}
open class RoomMembersIteratorSDKMock: MatrixRustSDK.RoomMembersIterator, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - len

    var lenUnderlyingCallsCount = 0
    open var lenCallsCount: Int {
        get {
            if Thread.isMainThread {
                return lenUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = lenUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                lenUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    lenUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var lenCalled: Bool {
        return lenCallsCount > 0
    }

    var lenUnderlyingReturnValue: UInt32!
    open var lenReturnValue: UInt32! {
        get {
            if Thread.isMainThread {
                return lenUnderlyingReturnValue
            } else {
                var returnValue: UInt32? = nil
                DispatchQueue.main.sync {
                    returnValue = lenUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                lenUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    lenUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var lenClosure: (() -> UInt32)?

    open override func len() -> UInt32 {
        lenCallsCount += 1
        if let lenClosure = lenClosure {
            return lenClosure()
        } else {
            return lenReturnValue
        }
    }

    //MARK: - nextChunk

    var nextChunkChunkSizeUnderlyingCallsCount = 0
    open var nextChunkChunkSizeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return nextChunkChunkSizeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = nextChunkChunkSizeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                nextChunkChunkSizeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    nextChunkChunkSizeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var nextChunkChunkSizeCalled: Bool {
        return nextChunkChunkSizeCallsCount > 0
    }
    open var nextChunkChunkSizeReceivedChunkSize: UInt32?
    open var nextChunkChunkSizeReceivedInvocations: [UInt32] = []

    var nextChunkChunkSizeUnderlyingReturnValue: [RoomMember]?
    open var nextChunkChunkSizeReturnValue: [RoomMember]? {
        get {
            if Thread.isMainThread {
                return nextChunkChunkSizeUnderlyingReturnValue
            } else {
                var returnValue: [RoomMember]?? = nil
                DispatchQueue.main.sync {
                    returnValue = nextChunkChunkSizeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                nextChunkChunkSizeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    nextChunkChunkSizeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var nextChunkChunkSizeClosure: ((UInt32) -> [RoomMember]?)?

    open override func nextChunk(chunkSize: UInt32) -> [RoomMember]? {
        nextChunkChunkSizeCallsCount += 1
        nextChunkChunkSizeReceivedChunkSize = chunkSize
        DispatchQueue.main.async {
            self.nextChunkChunkSizeReceivedInvocations.append(chunkSize)
        }
        if let nextChunkChunkSizeClosure = nextChunkChunkSizeClosure {
            return nextChunkChunkSizeClosure(chunkSize)
        } else {
            return nextChunkChunkSizeReturnValue
        }
    }
}
open class RoomMessageEventContentWithoutRelationSDKMock: MatrixRustSDK.RoomMessageEventContentWithoutRelation, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - withMentions

    var withMentionsMentionsUnderlyingCallsCount = 0
    open var withMentionsMentionsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return withMentionsMentionsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = withMentionsMentionsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withMentionsMentionsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    withMentionsMentionsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var withMentionsMentionsCalled: Bool {
        return withMentionsMentionsCallsCount > 0
    }
    open var withMentionsMentionsReceivedMentions: Mentions?
    open var withMentionsMentionsReceivedInvocations: [Mentions] = []

    var withMentionsMentionsUnderlyingReturnValue: RoomMessageEventContentWithoutRelation!
    open var withMentionsMentionsReturnValue: RoomMessageEventContentWithoutRelation! {
        get {
            if Thread.isMainThread {
                return withMentionsMentionsUnderlyingReturnValue
            } else {
                var returnValue: RoomMessageEventContentWithoutRelation? = nil
                DispatchQueue.main.sync {
                    returnValue = withMentionsMentionsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withMentionsMentionsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    withMentionsMentionsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var withMentionsMentionsClosure: ((Mentions) -> RoomMessageEventContentWithoutRelation)?

    open override func withMentions(mentions: Mentions) -> RoomMessageEventContentWithoutRelation {
        withMentionsMentionsCallsCount += 1
        withMentionsMentionsReceivedMentions = mentions
        DispatchQueue.main.async {
            self.withMentionsMentionsReceivedInvocations.append(mentions)
        }
        if let withMentionsMentionsClosure = withMentionsMentionsClosure {
            return withMentionsMentionsClosure(mentions)
        } else {
            return withMentionsMentionsReturnValue
        }
    }
}
open class RoomPowerLevelsSDKMock: MatrixRustSDK.RoomPowerLevels, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - canOwnUserBan

    var canOwnUserBanUnderlyingCallsCount = 0
    open var canOwnUserBanCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canOwnUserBanUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserBanUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserBanUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserBanUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canOwnUserBanCalled: Bool {
        return canOwnUserBanCallsCount > 0
    }

    var canOwnUserBanUnderlyingReturnValue: Bool!
    open var canOwnUserBanReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canOwnUserBanUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserBanUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserBanUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserBanUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canOwnUserBanClosure: (() -> Bool)?

    open override func canOwnUserBan() -> Bool {
        canOwnUserBanCallsCount += 1
        if let canOwnUserBanClosure = canOwnUserBanClosure {
            return canOwnUserBanClosure()
        } else {
            return canOwnUserBanReturnValue
        }
    }

    //MARK: - canOwnUserInvite

    var canOwnUserInviteUnderlyingCallsCount = 0
    open var canOwnUserInviteCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canOwnUserInviteUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserInviteUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserInviteUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserInviteUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canOwnUserInviteCalled: Bool {
        return canOwnUserInviteCallsCount > 0
    }

    var canOwnUserInviteUnderlyingReturnValue: Bool!
    open var canOwnUserInviteReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canOwnUserInviteUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserInviteUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserInviteUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserInviteUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canOwnUserInviteClosure: (() -> Bool)?

    open override func canOwnUserInvite() -> Bool {
        canOwnUserInviteCallsCount += 1
        if let canOwnUserInviteClosure = canOwnUserInviteClosure {
            return canOwnUserInviteClosure()
        } else {
            return canOwnUserInviteReturnValue
        }
    }

    //MARK: - canOwnUserKick

    var canOwnUserKickUnderlyingCallsCount = 0
    open var canOwnUserKickCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canOwnUserKickUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserKickUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserKickUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserKickUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canOwnUserKickCalled: Bool {
        return canOwnUserKickCallsCount > 0
    }

    var canOwnUserKickUnderlyingReturnValue: Bool!
    open var canOwnUserKickReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canOwnUserKickUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserKickUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserKickUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserKickUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canOwnUserKickClosure: (() -> Bool)?

    open override func canOwnUserKick() -> Bool {
        canOwnUserKickCallsCount += 1
        if let canOwnUserKickClosure = canOwnUserKickClosure {
            return canOwnUserKickClosure()
        } else {
            return canOwnUserKickReturnValue
        }
    }

    //MARK: - canOwnUserPinUnpin

    var canOwnUserPinUnpinUnderlyingCallsCount = 0
    open var canOwnUserPinUnpinCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canOwnUserPinUnpinUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserPinUnpinUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserPinUnpinUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserPinUnpinUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canOwnUserPinUnpinCalled: Bool {
        return canOwnUserPinUnpinCallsCount > 0
    }

    var canOwnUserPinUnpinUnderlyingReturnValue: Bool!
    open var canOwnUserPinUnpinReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canOwnUserPinUnpinUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserPinUnpinUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserPinUnpinUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserPinUnpinUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canOwnUserPinUnpinClosure: (() -> Bool)?

    open override func canOwnUserPinUnpin() -> Bool {
        canOwnUserPinUnpinCallsCount += 1
        if let canOwnUserPinUnpinClosure = canOwnUserPinUnpinClosure {
            return canOwnUserPinUnpinClosure()
        } else {
            return canOwnUserPinUnpinReturnValue
        }
    }

    //MARK: - canOwnUserRedactOther

    var canOwnUserRedactOtherUnderlyingCallsCount = 0
    open var canOwnUserRedactOtherCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canOwnUserRedactOtherUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserRedactOtherUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserRedactOtherUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserRedactOtherUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canOwnUserRedactOtherCalled: Bool {
        return canOwnUserRedactOtherCallsCount > 0
    }

    var canOwnUserRedactOtherUnderlyingReturnValue: Bool!
    open var canOwnUserRedactOtherReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canOwnUserRedactOtherUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserRedactOtherUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserRedactOtherUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserRedactOtherUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canOwnUserRedactOtherClosure: (() -> Bool)?

    open override func canOwnUserRedactOther() -> Bool {
        canOwnUserRedactOtherCallsCount += 1
        if let canOwnUserRedactOtherClosure = canOwnUserRedactOtherClosure {
            return canOwnUserRedactOtherClosure()
        } else {
            return canOwnUserRedactOtherReturnValue
        }
    }

    //MARK: - canOwnUserRedactOwn

    var canOwnUserRedactOwnUnderlyingCallsCount = 0
    open var canOwnUserRedactOwnCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canOwnUserRedactOwnUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserRedactOwnUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserRedactOwnUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserRedactOwnUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canOwnUserRedactOwnCalled: Bool {
        return canOwnUserRedactOwnCallsCount > 0
    }

    var canOwnUserRedactOwnUnderlyingReturnValue: Bool!
    open var canOwnUserRedactOwnReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canOwnUserRedactOwnUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserRedactOwnUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserRedactOwnUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserRedactOwnUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canOwnUserRedactOwnClosure: (() -> Bool)?

    open override func canOwnUserRedactOwn() -> Bool {
        canOwnUserRedactOwnCallsCount += 1
        if let canOwnUserRedactOwnClosure = canOwnUserRedactOwnClosure {
            return canOwnUserRedactOwnClosure()
        } else {
            return canOwnUserRedactOwnReturnValue
        }
    }

    //MARK: - canOwnUserSendMessage

    var canOwnUserSendMessageMessageUnderlyingCallsCount = 0
    open var canOwnUserSendMessageMessageCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canOwnUserSendMessageMessageUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserSendMessageMessageUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserSendMessageMessageUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserSendMessageMessageUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canOwnUserSendMessageMessageCalled: Bool {
        return canOwnUserSendMessageMessageCallsCount > 0
    }
    open var canOwnUserSendMessageMessageReceivedMessage: MessageLikeEventType?
    open var canOwnUserSendMessageMessageReceivedInvocations: [MessageLikeEventType] = []

    var canOwnUserSendMessageMessageUnderlyingReturnValue: Bool!
    open var canOwnUserSendMessageMessageReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canOwnUserSendMessageMessageUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserSendMessageMessageUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserSendMessageMessageUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserSendMessageMessageUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canOwnUserSendMessageMessageClosure: ((MessageLikeEventType) -> Bool)?

    open override func canOwnUserSendMessage(message: MessageLikeEventType) -> Bool {
        canOwnUserSendMessageMessageCallsCount += 1
        canOwnUserSendMessageMessageReceivedMessage = message
        DispatchQueue.main.async {
            self.canOwnUserSendMessageMessageReceivedInvocations.append(message)
        }
        if let canOwnUserSendMessageMessageClosure = canOwnUserSendMessageMessageClosure {
            return canOwnUserSendMessageMessageClosure(message)
        } else {
            return canOwnUserSendMessageMessageReturnValue
        }
    }

    //MARK: - canOwnUserSendState

    var canOwnUserSendStateStateEventUnderlyingCallsCount = 0
    open var canOwnUserSendStateStateEventCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canOwnUserSendStateStateEventUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserSendStateStateEventUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserSendStateStateEventUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserSendStateStateEventUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canOwnUserSendStateStateEventCalled: Bool {
        return canOwnUserSendStateStateEventCallsCount > 0
    }
    open var canOwnUserSendStateStateEventReceivedStateEvent: StateEventType?
    open var canOwnUserSendStateStateEventReceivedInvocations: [StateEventType] = []

    var canOwnUserSendStateStateEventUnderlyingReturnValue: Bool!
    open var canOwnUserSendStateStateEventReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canOwnUserSendStateStateEventUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserSendStateStateEventUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserSendStateStateEventUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserSendStateStateEventUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canOwnUserSendStateStateEventClosure: ((StateEventType) -> Bool)?

    open override func canOwnUserSendState(stateEvent: StateEventType) -> Bool {
        canOwnUserSendStateStateEventCallsCount += 1
        canOwnUserSendStateStateEventReceivedStateEvent = stateEvent
        DispatchQueue.main.async {
            self.canOwnUserSendStateStateEventReceivedInvocations.append(stateEvent)
        }
        if let canOwnUserSendStateStateEventClosure = canOwnUserSendStateStateEventClosure {
            return canOwnUserSendStateStateEventClosure(stateEvent)
        } else {
            return canOwnUserSendStateStateEventReturnValue
        }
    }

    //MARK: - canOwnUserTriggerRoomNotification

    var canOwnUserTriggerRoomNotificationUnderlyingCallsCount = 0
    open var canOwnUserTriggerRoomNotificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canOwnUserTriggerRoomNotificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserTriggerRoomNotificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserTriggerRoomNotificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserTriggerRoomNotificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canOwnUserTriggerRoomNotificationCalled: Bool {
        return canOwnUserTriggerRoomNotificationCallsCount > 0
    }

    var canOwnUserTriggerRoomNotificationUnderlyingReturnValue: Bool!
    open var canOwnUserTriggerRoomNotificationReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canOwnUserTriggerRoomNotificationUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canOwnUserTriggerRoomNotificationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canOwnUserTriggerRoomNotificationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canOwnUserTriggerRoomNotificationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canOwnUserTriggerRoomNotificationClosure: (() -> Bool)?

    open override func canOwnUserTriggerRoomNotification() -> Bool {
        canOwnUserTriggerRoomNotificationCallsCount += 1
        if let canOwnUserTriggerRoomNotificationClosure = canOwnUserTriggerRoomNotificationClosure {
            return canOwnUserTriggerRoomNotificationClosure()
        } else {
            return canOwnUserTriggerRoomNotificationReturnValue
        }
    }

    //MARK: - canUserBan

    open var canUserBanUserIdThrowableError: Error?
    var canUserBanUserIdUnderlyingCallsCount = 0
    open var canUserBanUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserBanUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserBanUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserBanUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserBanUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canUserBanUserIdCalled: Bool {
        return canUserBanUserIdCallsCount > 0
    }
    open var canUserBanUserIdReceivedUserId: String?
    open var canUserBanUserIdReceivedInvocations: [String] = []

    var canUserBanUserIdUnderlyingReturnValue: Bool!
    open var canUserBanUserIdReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canUserBanUserIdUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserBanUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserBanUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserBanUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canUserBanUserIdClosure: ((String) throws -> Bool)?

    open override func canUserBan(userId: String) throws -> Bool {
        if let error = canUserBanUserIdThrowableError {
            throw error
        }
        canUserBanUserIdCallsCount += 1
        canUserBanUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.canUserBanUserIdReceivedInvocations.append(userId)
        }
        if let canUserBanUserIdClosure = canUserBanUserIdClosure {
            return try canUserBanUserIdClosure(userId)
        } else {
            return canUserBanUserIdReturnValue
        }
    }

    //MARK: - canUserInvite

    open var canUserInviteUserIdThrowableError: Error?
    var canUserInviteUserIdUnderlyingCallsCount = 0
    open var canUserInviteUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserInviteUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserInviteUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserInviteUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserInviteUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canUserInviteUserIdCalled: Bool {
        return canUserInviteUserIdCallsCount > 0
    }
    open var canUserInviteUserIdReceivedUserId: String?
    open var canUserInviteUserIdReceivedInvocations: [String] = []

    var canUserInviteUserIdUnderlyingReturnValue: Bool!
    open var canUserInviteUserIdReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canUserInviteUserIdUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserInviteUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserInviteUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserInviteUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canUserInviteUserIdClosure: ((String) throws -> Bool)?

    open override func canUserInvite(userId: String) throws -> Bool {
        if let error = canUserInviteUserIdThrowableError {
            throw error
        }
        canUserInviteUserIdCallsCount += 1
        canUserInviteUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.canUserInviteUserIdReceivedInvocations.append(userId)
        }
        if let canUserInviteUserIdClosure = canUserInviteUserIdClosure {
            return try canUserInviteUserIdClosure(userId)
        } else {
            return canUserInviteUserIdReturnValue
        }
    }

    //MARK: - canUserKick

    open var canUserKickUserIdThrowableError: Error?
    var canUserKickUserIdUnderlyingCallsCount = 0
    open var canUserKickUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserKickUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserKickUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserKickUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserKickUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canUserKickUserIdCalled: Bool {
        return canUserKickUserIdCallsCount > 0
    }
    open var canUserKickUserIdReceivedUserId: String?
    open var canUserKickUserIdReceivedInvocations: [String] = []

    var canUserKickUserIdUnderlyingReturnValue: Bool!
    open var canUserKickUserIdReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canUserKickUserIdUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserKickUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserKickUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserKickUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canUserKickUserIdClosure: ((String) throws -> Bool)?

    open override func canUserKick(userId: String) throws -> Bool {
        if let error = canUserKickUserIdThrowableError {
            throw error
        }
        canUserKickUserIdCallsCount += 1
        canUserKickUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.canUserKickUserIdReceivedInvocations.append(userId)
        }
        if let canUserKickUserIdClosure = canUserKickUserIdClosure {
            return try canUserKickUserIdClosure(userId)
        } else {
            return canUserKickUserIdReturnValue
        }
    }

    //MARK: - canUserPinUnpin

    open var canUserPinUnpinUserIdThrowableError: Error?
    var canUserPinUnpinUserIdUnderlyingCallsCount = 0
    open var canUserPinUnpinUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserPinUnpinUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserPinUnpinUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserPinUnpinUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserPinUnpinUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canUserPinUnpinUserIdCalled: Bool {
        return canUserPinUnpinUserIdCallsCount > 0
    }
    open var canUserPinUnpinUserIdReceivedUserId: String?
    open var canUserPinUnpinUserIdReceivedInvocations: [String] = []

    var canUserPinUnpinUserIdUnderlyingReturnValue: Bool!
    open var canUserPinUnpinUserIdReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canUserPinUnpinUserIdUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserPinUnpinUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserPinUnpinUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserPinUnpinUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canUserPinUnpinUserIdClosure: ((String) throws -> Bool)?

    open override func canUserPinUnpin(userId: String) throws -> Bool {
        if let error = canUserPinUnpinUserIdThrowableError {
            throw error
        }
        canUserPinUnpinUserIdCallsCount += 1
        canUserPinUnpinUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.canUserPinUnpinUserIdReceivedInvocations.append(userId)
        }
        if let canUserPinUnpinUserIdClosure = canUserPinUnpinUserIdClosure {
            return try canUserPinUnpinUserIdClosure(userId)
        } else {
            return canUserPinUnpinUserIdReturnValue
        }
    }

    //MARK: - canUserRedactOther

    open var canUserRedactOtherUserIdThrowableError: Error?
    var canUserRedactOtherUserIdUnderlyingCallsCount = 0
    open var canUserRedactOtherUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserRedactOtherUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserRedactOtherUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserRedactOtherUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserRedactOtherUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canUserRedactOtherUserIdCalled: Bool {
        return canUserRedactOtherUserIdCallsCount > 0
    }
    open var canUserRedactOtherUserIdReceivedUserId: String?
    open var canUserRedactOtherUserIdReceivedInvocations: [String] = []

    var canUserRedactOtherUserIdUnderlyingReturnValue: Bool!
    open var canUserRedactOtherUserIdReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canUserRedactOtherUserIdUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserRedactOtherUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserRedactOtherUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserRedactOtherUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canUserRedactOtherUserIdClosure: ((String) throws -> Bool)?

    open override func canUserRedactOther(userId: String) throws -> Bool {
        if let error = canUserRedactOtherUserIdThrowableError {
            throw error
        }
        canUserRedactOtherUserIdCallsCount += 1
        canUserRedactOtherUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.canUserRedactOtherUserIdReceivedInvocations.append(userId)
        }
        if let canUserRedactOtherUserIdClosure = canUserRedactOtherUserIdClosure {
            return try canUserRedactOtherUserIdClosure(userId)
        } else {
            return canUserRedactOtherUserIdReturnValue
        }
    }

    //MARK: - canUserRedactOwn

    open var canUserRedactOwnUserIdThrowableError: Error?
    var canUserRedactOwnUserIdUnderlyingCallsCount = 0
    open var canUserRedactOwnUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserRedactOwnUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserRedactOwnUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserRedactOwnUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserRedactOwnUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canUserRedactOwnUserIdCalled: Bool {
        return canUserRedactOwnUserIdCallsCount > 0
    }
    open var canUserRedactOwnUserIdReceivedUserId: String?
    open var canUserRedactOwnUserIdReceivedInvocations: [String] = []

    var canUserRedactOwnUserIdUnderlyingReturnValue: Bool!
    open var canUserRedactOwnUserIdReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canUserRedactOwnUserIdUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserRedactOwnUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserRedactOwnUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserRedactOwnUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canUserRedactOwnUserIdClosure: ((String) throws -> Bool)?

    open override func canUserRedactOwn(userId: String) throws -> Bool {
        if let error = canUserRedactOwnUserIdThrowableError {
            throw error
        }
        canUserRedactOwnUserIdCallsCount += 1
        canUserRedactOwnUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.canUserRedactOwnUserIdReceivedInvocations.append(userId)
        }
        if let canUserRedactOwnUserIdClosure = canUserRedactOwnUserIdClosure {
            return try canUserRedactOwnUserIdClosure(userId)
        } else {
            return canUserRedactOwnUserIdReturnValue
        }
    }

    //MARK: - canUserSendMessage

    open var canUserSendMessageUserIdMessageThrowableError: Error?
    var canUserSendMessageUserIdMessageUnderlyingCallsCount = 0
    open var canUserSendMessageUserIdMessageCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserSendMessageUserIdMessageUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserSendMessageUserIdMessageUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserSendMessageUserIdMessageUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserSendMessageUserIdMessageUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canUserSendMessageUserIdMessageCalled: Bool {
        return canUserSendMessageUserIdMessageCallsCount > 0
    }
    open var canUserSendMessageUserIdMessageReceivedArguments: (userId: String, message: MessageLikeEventType)?
    open var canUserSendMessageUserIdMessageReceivedInvocations: [(userId: String, message: MessageLikeEventType)] = []

    var canUserSendMessageUserIdMessageUnderlyingReturnValue: Bool!
    open var canUserSendMessageUserIdMessageReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canUserSendMessageUserIdMessageUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserSendMessageUserIdMessageUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserSendMessageUserIdMessageUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserSendMessageUserIdMessageUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canUserSendMessageUserIdMessageClosure: ((String, MessageLikeEventType) throws -> Bool)?

    open override func canUserSendMessage(userId: String, message: MessageLikeEventType) throws -> Bool {
        if let error = canUserSendMessageUserIdMessageThrowableError {
            throw error
        }
        canUserSendMessageUserIdMessageCallsCount += 1
        canUserSendMessageUserIdMessageReceivedArguments = (userId: userId, message: message)
        DispatchQueue.main.async {
            self.canUserSendMessageUserIdMessageReceivedInvocations.append((userId: userId, message: message))
        }
        if let canUserSendMessageUserIdMessageClosure = canUserSendMessageUserIdMessageClosure {
            return try canUserSendMessageUserIdMessageClosure(userId, message)
        } else {
            return canUserSendMessageUserIdMessageReturnValue
        }
    }

    //MARK: - canUserSendState

    open var canUserSendStateUserIdStateEventThrowableError: Error?
    var canUserSendStateUserIdStateEventUnderlyingCallsCount = 0
    open var canUserSendStateUserIdStateEventCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserSendStateUserIdStateEventUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserSendStateUserIdStateEventUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserSendStateUserIdStateEventUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserSendStateUserIdStateEventUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canUserSendStateUserIdStateEventCalled: Bool {
        return canUserSendStateUserIdStateEventCallsCount > 0
    }
    open var canUserSendStateUserIdStateEventReceivedArguments: (userId: String, stateEvent: StateEventType)?
    open var canUserSendStateUserIdStateEventReceivedInvocations: [(userId: String, stateEvent: StateEventType)] = []

    var canUserSendStateUserIdStateEventUnderlyingReturnValue: Bool!
    open var canUserSendStateUserIdStateEventReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canUserSendStateUserIdStateEventUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserSendStateUserIdStateEventUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserSendStateUserIdStateEventUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserSendStateUserIdStateEventUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canUserSendStateUserIdStateEventClosure: ((String, StateEventType) throws -> Bool)?

    open override func canUserSendState(userId: String, stateEvent: StateEventType) throws -> Bool {
        if let error = canUserSendStateUserIdStateEventThrowableError {
            throw error
        }
        canUserSendStateUserIdStateEventCallsCount += 1
        canUserSendStateUserIdStateEventReceivedArguments = (userId: userId, stateEvent: stateEvent)
        DispatchQueue.main.async {
            self.canUserSendStateUserIdStateEventReceivedInvocations.append((userId: userId, stateEvent: stateEvent))
        }
        if let canUserSendStateUserIdStateEventClosure = canUserSendStateUserIdStateEventClosure {
            return try canUserSendStateUserIdStateEventClosure(userId, stateEvent)
        } else {
            return canUserSendStateUserIdStateEventReturnValue
        }
    }

    //MARK: - canUserTriggerRoomNotification

    open var canUserTriggerRoomNotificationUserIdThrowableError: Error?
    var canUserTriggerRoomNotificationUserIdUnderlyingCallsCount = 0
    open var canUserTriggerRoomNotificationUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserTriggerRoomNotificationUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserTriggerRoomNotificationUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserTriggerRoomNotificationUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserTriggerRoomNotificationUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var canUserTriggerRoomNotificationUserIdCalled: Bool {
        return canUserTriggerRoomNotificationUserIdCallsCount > 0
    }
    open var canUserTriggerRoomNotificationUserIdReceivedUserId: String?
    open var canUserTriggerRoomNotificationUserIdReceivedInvocations: [String] = []

    var canUserTriggerRoomNotificationUserIdUnderlyingReturnValue: Bool!
    open var canUserTriggerRoomNotificationUserIdReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canUserTriggerRoomNotificationUserIdUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserTriggerRoomNotificationUserIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserTriggerRoomNotificationUserIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserTriggerRoomNotificationUserIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var canUserTriggerRoomNotificationUserIdClosure: ((String) throws -> Bool)?

    open override func canUserTriggerRoomNotification(userId: String) throws -> Bool {
        if let error = canUserTriggerRoomNotificationUserIdThrowableError {
            throw error
        }
        canUserTriggerRoomNotificationUserIdCallsCount += 1
        canUserTriggerRoomNotificationUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.canUserTriggerRoomNotificationUserIdReceivedInvocations.append(userId)
        }
        if let canUserTriggerRoomNotificationUserIdClosure = canUserTriggerRoomNotificationUserIdClosure {
            return try canUserTriggerRoomNotificationUserIdClosure(userId)
        } else {
            return canUserTriggerRoomNotificationUserIdReturnValue
        }
    }

    //MARK: - userPowerLevels

    var userPowerLevelsUnderlyingCallsCount = 0
    open var userPowerLevelsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return userPowerLevelsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = userPowerLevelsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userPowerLevelsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    userPowerLevelsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var userPowerLevelsCalled: Bool {
        return userPowerLevelsCallsCount > 0
    }

    var userPowerLevelsUnderlyingReturnValue: [String: Int64]!
    open var userPowerLevelsReturnValue: [String: Int64]! {
        get {
            if Thread.isMainThread {
                return userPowerLevelsUnderlyingReturnValue
            } else {
                var returnValue: [String: Int64]? = nil
                DispatchQueue.main.sync {
                    returnValue = userPowerLevelsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                userPowerLevelsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    userPowerLevelsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var userPowerLevelsClosure: (() -> [String: Int64])?

    open override func userPowerLevels() -> [String: Int64] {
        userPowerLevelsCallsCount += 1
        if let userPowerLevelsClosure = userPowerLevelsClosure {
            return userPowerLevelsClosure()
        } else {
            return userPowerLevelsReturnValue
        }
    }

    //MARK: - values

    var valuesUnderlyingCallsCount = 0
    open var valuesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return valuesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = valuesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                valuesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    valuesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var valuesCalled: Bool {
        return valuesCallsCount > 0
    }

    var valuesUnderlyingReturnValue: RoomPowerLevelsValues!
    open var valuesReturnValue: RoomPowerLevelsValues! {
        get {
            if Thread.isMainThread {
                return valuesUnderlyingReturnValue
            } else {
                var returnValue: RoomPowerLevelsValues? = nil
                DispatchQueue.main.sync {
                    returnValue = valuesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                valuesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    valuesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var valuesClosure: (() -> RoomPowerLevelsValues)?

    open override func values() -> RoomPowerLevelsValues {
        valuesCallsCount += 1
        if let valuesClosure = valuesClosure {
            return valuesClosure()
        } else {
            return valuesReturnValue
        }
    }
}
open class RoomPreviewSDKMock: MatrixRustSDK.RoomPreview, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - forget

    open var forgetThrowableError: Error?
    var forgetUnderlyingCallsCount = 0
    open var forgetCallsCount: Int {
        get {
            if Thread.isMainThread {
                return forgetUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = forgetUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                forgetUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    forgetUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var forgetCalled: Bool {
        return forgetCallsCount > 0
    }
    open var forgetClosure: (() async throws -> Void)?

    open override func forget() async throws {
        if let error = forgetThrowableError {
            throw error
        }
        forgetCallsCount += 1
        try await forgetClosure?()
    }

    //MARK: - info

    open var infoThrowableError: Error?
    var infoUnderlyingCallsCount = 0
    open var infoCallsCount: Int {
        get {
            if Thread.isMainThread {
                return infoUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = infoUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                infoUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    infoUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var infoCalled: Bool {
        return infoCallsCount > 0
    }

    var infoUnderlyingReturnValue: RoomPreviewInfo!
    open var infoReturnValue: RoomPreviewInfo! {
        get {
            if Thread.isMainThread {
                return infoUnderlyingReturnValue
            } else {
                var returnValue: RoomPreviewInfo? = nil
                DispatchQueue.main.sync {
                    returnValue = infoUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                infoUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    infoUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var infoClosure: (() throws -> RoomPreviewInfo)?

    open override func info() throws -> RoomPreviewInfo {
        if let error = infoThrowableError {
            throw error
        }
        infoCallsCount += 1
        if let infoClosure = infoClosure {
            return try infoClosure()
        } else {
            return infoReturnValue
        }
    }

    //MARK: - inviter

    var inviterUnderlyingCallsCount = 0
    open var inviterCallsCount: Int {
        get {
            if Thread.isMainThread {
                return inviterUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = inviterUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                inviterUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    inviterUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var inviterCalled: Bool {
        return inviterCallsCount > 0
    }

    var inviterUnderlyingReturnValue: RoomMember?
    open var inviterReturnValue: RoomMember? {
        get {
            if Thread.isMainThread {
                return inviterUnderlyingReturnValue
            } else {
                var returnValue: RoomMember?? = nil
                DispatchQueue.main.sync {
                    returnValue = inviterUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                inviterUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    inviterUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var inviterClosure: (() async -> RoomMember?)?

    open override func inviter() async -> RoomMember? {
        inviterCallsCount += 1
        if let inviterClosure = inviterClosure {
            return await inviterClosure()
        } else {
            return inviterReturnValue
        }
    }

    //MARK: - leave

    open var leaveThrowableError: Error?
    var leaveUnderlyingCallsCount = 0
    open var leaveCallsCount: Int {
        get {
            if Thread.isMainThread {
                return leaveUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = leaveUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                leaveUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    leaveUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var leaveCalled: Bool {
        return leaveCallsCount > 0
    }
    open var leaveClosure: (() async throws -> Void)?

    open override func leave() async throws {
        if let error = leaveThrowableError {
            throw error
        }
        leaveCallsCount += 1
        try await leaveClosure?()
    }

    //MARK: - ownMembershipDetails

    var ownMembershipDetailsUnderlyingCallsCount = 0
    open var ownMembershipDetailsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return ownMembershipDetailsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = ownMembershipDetailsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ownMembershipDetailsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    ownMembershipDetailsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var ownMembershipDetailsCalled: Bool {
        return ownMembershipDetailsCallsCount > 0
    }

    var ownMembershipDetailsUnderlyingReturnValue: RoomMemberWithSenderInfo?
    open var ownMembershipDetailsReturnValue: RoomMemberWithSenderInfo? {
        get {
            if Thread.isMainThread {
                return ownMembershipDetailsUnderlyingReturnValue
            } else {
                var returnValue: RoomMemberWithSenderInfo?? = nil
                DispatchQueue.main.sync {
                    returnValue = ownMembershipDetailsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ownMembershipDetailsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    ownMembershipDetailsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var ownMembershipDetailsClosure: (() async -> RoomMemberWithSenderInfo?)?

    open override func ownMembershipDetails() async -> RoomMemberWithSenderInfo? {
        ownMembershipDetailsCallsCount += 1
        if let ownMembershipDetailsClosure = ownMembershipDetailsClosure {
            return await ownMembershipDetailsClosure()
        } else {
            return ownMembershipDetailsReturnValue
        }
    }
}
open class SendAttachmentJoinHandleSDKMock: MatrixRustSDK.SendAttachmentJoinHandle, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - cancel

    var cancelUnderlyingCallsCount = 0
    open var cancelCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cancelUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cancelUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cancelUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cancelUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var cancelCalled: Bool {
        return cancelCallsCount > 0
    }
    open var cancelClosure: (() -> Void)?

    open override func cancel() {
        cancelCallsCount += 1
        cancelClosure?()
    }

    //MARK: - join

    open var joinThrowableError: Error?
    var joinUnderlyingCallsCount = 0
    open var joinCallsCount: Int {
        get {
            if Thread.isMainThread {
                return joinUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = joinUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    joinUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var joinCalled: Bool {
        return joinCallsCount > 0
    }
    open var joinClosure: (() async throws -> Void)?

    open override func join() async throws {
        if let error = joinThrowableError {
            throw error
        }
        joinCallsCount += 1
        try await joinClosure?()
    }
}
open class SendGalleryJoinHandleSDKMock: MatrixRustSDK.SendGalleryJoinHandle, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - cancel

    var cancelUnderlyingCallsCount = 0
    open var cancelCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cancelUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cancelUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cancelUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cancelUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var cancelCalled: Bool {
        return cancelCallsCount > 0
    }
    open var cancelClosure: (() -> Void)?

    open override func cancel() {
        cancelCallsCount += 1
        cancelClosure?()
    }

    //MARK: - join

    open var joinThrowableError: Error?
    var joinUnderlyingCallsCount = 0
    open var joinCallsCount: Int {
        get {
            if Thread.isMainThread {
                return joinUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = joinUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    joinUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var joinCalled: Bool {
        return joinCallsCount > 0
    }
    open var joinClosure: (() async throws -> Void)?

    open override func join() async throws {
        if let error = joinThrowableError {
            throw error
        }
        joinCallsCount += 1
        try await joinClosure?()
    }
}
open class SendHandleSDKMock: MatrixRustSDK.SendHandle, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - abort

    open var abortThrowableError: Error?
    var abortUnderlyingCallsCount = 0
    open var abortCallsCount: Int {
        get {
            if Thread.isMainThread {
                return abortUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = abortUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                abortUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    abortUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var abortCalled: Bool {
        return abortCallsCount > 0
    }

    var abortUnderlyingReturnValue: Bool!
    open var abortReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return abortUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = abortUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                abortUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    abortUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var abortClosure: (() async throws -> Bool)?

    open override func abort() async throws -> Bool {
        if let error = abortThrowableError {
            throw error
        }
        abortCallsCount += 1
        if let abortClosure = abortClosure {
            return try await abortClosure()
        } else {
            return abortReturnValue
        }
    }

    //MARK: - tryResend

    open var tryResendThrowableError: Error?
    var tryResendUnderlyingCallsCount = 0
    open var tryResendCallsCount: Int {
        get {
            if Thread.isMainThread {
                return tryResendUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = tryResendUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                tryResendUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    tryResendUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var tryResendCalled: Bool {
        return tryResendCallsCount > 0
    }
    open var tryResendClosure: (() async throws -> Void)?

    open override func tryResend() async throws {
        if let error = tryResendThrowableError {
            throw error
        }
        tryResendCallsCount += 1
        try await tryResendClosure?()
    }
}
open class SessionVerificationControllerSDKMock: MatrixRustSDK.SessionVerificationController, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - acceptVerificationRequest

    open var acceptVerificationRequestThrowableError: Error?
    var acceptVerificationRequestUnderlyingCallsCount = 0
    open var acceptVerificationRequestCallsCount: Int {
        get {
            if Thread.isMainThread {
                return acceptVerificationRequestUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = acceptVerificationRequestUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                acceptVerificationRequestUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    acceptVerificationRequestUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var acceptVerificationRequestCalled: Bool {
        return acceptVerificationRequestCallsCount > 0
    }
    open var acceptVerificationRequestClosure: (() async throws -> Void)?

    open override func acceptVerificationRequest() async throws {
        if let error = acceptVerificationRequestThrowableError {
            throw error
        }
        acceptVerificationRequestCallsCount += 1
        try await acceptVerificationRequestClosure?()
    }

    //MARK: - acknowledgeVerificationRequest

    open var acknowledgeVerificationRequestSenderIdFlowIdThrowableError: Error?
    var acknowledgeVerificationRequestSenderIdFlowIdUnderlyingCallsCount = 0
    open var acknowledgeVerificationRequestSenderIdFlowIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return acknowledgeVerificationRequestSenderIdFlowIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = acknowledgeVerificationRequestSenderIdFlowIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                acknowledgeVerificationRequestSenderIdFlowIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    acknowledgeVerificationRequestSenderIdFlowIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var acknowledgeVerificationRequestSenderIdFlowIdCalled: Bool {
        return acknowledgeVerificationRequestSenderIdFlowIdCallsCount > 0
    }
    open var acknowledgeVerificationRequestSenderIdFlowIdReceivedArguments: (senderId: String, flowId: String)?
    open var acknowledgeVerificationRequestSenderIdFlowIdReceivedInvocations: [(senderId: String, flowId: String)] = []
    open var acknowledgeVerificationRequestSenderIdFlowIdClosure: ((String, String) async throws -> Void)?

    open override func acknowledgeVerificationRequest(senderId: String, flowId: String) async throws {
        if let error = acknowledgeVerificationRequestSenderIdFlowIdThrowableError {
            throw error
        }
        acknowledgeVerificationRequestSenderIdFlowIdCallsCount += 1
        acknowledgeVerificationRequestSenderIdFlowIdReceivedArguments = (senderId: senderId, flowId: flowId)
        DispatchQueue.main.async {
            self.acknowledgeVerificationRequestSenderIdFlowIdReceivedInvocations.append((senderId: senderId, flowId: flowId))
        }
        try await acknowledgeVerificationRequestSenderIdFlowIdClosure?(senderId, flowId)
    }

    //MARK: - approveVerification

    open var approveVerificationThrowableError: Error?
    var approveVerificationUnderlyingCallsCount = 0
    open var approveVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return approveVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = approveVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                approveVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    approveVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var approveVerificationCalled: Bool {
        return approveVerificationCallsCount > 0
    }
    open var approveVerificationClosure: (() async throws -> Void)?

    open override func approveVerification() async throws {
        if let error = approveVerificationThrowableError {
            throw error
        }
        approveVerificationCallsCount += 1
        try await approveVerificationClosure?()
    }

    //MARK: - cancelVerification

    open var cancelVerificationThrowableError: Error?
    var cancelVerificationUnderlyingCallsCount = 0
    open var cancelVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cancelVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cancelVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cancelVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cancelVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var cancelVerificationCalled: Bool {
        return cancelVerificationCallsCount > 0
    }
    open var cancelVerificationClosure: (() async throws -> Void)?

    open override func cancelVerification() async throws {
        if let error = cancelVerificationThrowableError {
            throw error
        }
        cancelVerificationCallsCount += 1
        try await cancelVerificationClosure?()
    }

    //MARK: - declineVerification

    open var declineVerificationThrowableError: Error?
    var declineVerificationUnderlyingCallsCount = 0
    open var declineVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return declineVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = declineVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                declineVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    declineVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var declineVerificationCalled: Bool {
        return declineVerificationCallsCount > 0
    }
    open var declineVerificationClosure: (() async throws -> Void)?

    open override func declineVerification() async throws {
        if let error = declineVerificationThrowableError {
            throw error
        }
        declineVerificationCallsCount += 1
        try await declineVerificationClosure?()
    }

    //MARK: - requestDeviceVerification

    open var requestDeviceVerificationThrowableError: Error?
    var requestDeviceVerificationUnderlyingCallsCount = 0
    open var requestDeviceVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return requestDeviceVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = requestDeviceVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestDeviceVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    requestDeviceVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var requestDeviceVerificationCalled: Bool {
        return requestDeviceVerificationCallsCount > 0
    }
    open var requestDeviceVerificationClosure: (() async throws -> Void)?

    open override func requestDeviceVerification() async throws {
        if let error = requestDeviceVerificationThrowableError {
            throw error
        }
        requestDeviceVerificationCallsCount += 1
        try await requestDeviceVerificationClosure?()
    }

    //MARK: - requestUserVerification

    open var requestUserVerificationUserIdThrowableError: Error?
    var requestUserVerificationUserIdUnderlyingCallsCount = 0
    open var requestUserVerificationUserIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return requestUserVerificationUserIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = requestUserVerificationUserIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestUserVerificationUserIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    requestUserVerificationUserIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var requestUserVerificationUserIdCalled: Bool {
        return requestUserVerificationUserIdCallsCount > 0
    }
    open var requestUserVerificationUserIdReceivedUserId: String?
    open var requestUserVerificationUserIdReceivedInvocations: [String] = []
    open var requestUserVerificationUserIdClosure: ((String) async throws -> Void)?

    open override func requestUserVerification(userId: String) async throws {
        if let error = requestUserVerificationUserIdThrowableError {
            throw error
        }
        requestUserVerificationUserIdCallsCount += 1
        requestUserVerificationUserIdReceivedUserId = userId
        DispatchQueue.main.async {
            self.requestUserVerificationUserIdReceivedInvocations.append(userId)
        }
        try await requestUserVerificationUserIdClosure?(userId)
    }

    //MARK: - setDelegate

    var setDelegateDelegateUnderlyingCallsCount = 0
    open var setDelegateDelegateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setDelegateDelegateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setDelegateDelegateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setDelegateDelegateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setDelegateDelegateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setDelegateDelegateCalled: Bool {
        return setDelegateDelegateCallsCount > 0
    }
    open var setDelegateDelegateReceivedDelegate: SessionVerificationControllerDelegate?
    open var setDelegateDelegateReceivedInvocations: [SessionVerificationControllerDelegate?] = []
    open var setDelegateDelegateClosure: ((SessionVerificationControllerDelegate?) -> Void)?

    open override func setDelegate(delegate: SessionVerificationControllerDelegate?) {
        setDelegateDelegateCallsCount += 1
        setDelegateDelegateReceivedDelegate = delegate
        DispatchQueue.main.async {
            self.setDelegateDelegateReceivedInvocations.append(delegate)
        }
        setDelegateDelegateClosure?(delegate)
    }

    //MARK: - startSasVerification

    open var startSasVerificationThrowableError: Error?
    var startSasVerificationUnderlyingCallsCount = 0
    open var startSasVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startSasVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startSasVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startSasVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startSasVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var startSasVerificationCalled: Bool {
        return startSasVerificationCallsCount > 0
    }
    open var startSasVerificationClosure: (() async throws -> Void)?

    open override func startSasVerification() async throws {
        if let error = startSasVerificationThrowableError {
            throw error
        }
        startSasVerificationCallsCount += 1
        try await startSasVerificationClosure?()
    }
}
open class SessionVerificationEmojiSDKMock: MatrixRustSDK.SessionVerificationEmoji, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - description

    var descriptionUnderlyingCallsCount = 0
    open var descriptionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return descriptionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = descriptionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                descriptionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    descriptionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var descriptionCalled: Bool {
        return descriptionCallsCount > 0
    }

    var descriptionUnderlyingReturnValue: String!
    open var descriptionReturnValue: String! {
        get {
            if Thread.isMainThread {
                return descriptionUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = descriptionUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                descriptionUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    descriptionUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var descriptionClosure: (() -> String)?

    open override func description() -> String {
        descriptionCallsCount += 1
        if let descriptionClosure = descriptionClosure {
            return descriptionClosure()
        } else {
            return descriptionReturnValue
        }
    }

    //MARK: - symbol

    var symbolUnderlyingCallsCount = 0
    open var symbolCallsCount: Int {
        get {
            if Thread.isMainThread {
                return symbolUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = symbolUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                symbolUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    symbolUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var symbolCalled: Bool {
        return symbolCallsCount > 0
    }

    var symbolUnderlyingReturnValue: String!
    open var symbolReturnValue: String! {
        get {
            if Thread.isMainThread {
                return symbolUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = symbolUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                symbolUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    symbolUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var symbolClosure: (() -> String)?

    open override func symbol() -> String {
        symbolCallsCount += 1
        if let symbolClosure = symbolClosure {
            return symbolClosure()
        } else {
            return symbolReturnValue
        }
    }
}
open class SpanSDKMock: MatrixRustSDK.Span, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!
    static func reset()
    {
    }

    //MARK: - enter

    var enterUnderlyingCallsCount = 0
    open var enterCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enterUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enterUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enterUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enterUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var enterCalled: Bool {
        return enterCallsCount > 0
    }
    open var enterClosure: (() -> Void)?

    open override func enter() {
        enterCallsCount += 1
        enterClosure?()
    }

    //MARK: - exit

    var exitUnderlyingCallsCount = 0
    open var exitCallsCount: Int {
        get {
            if Thread.isMainThread {
                return exitUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = exitUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                exitUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    exitUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var exitCalled: Bool {
        return exitCallsCount > 0
    }
    open var exitClosure: (() -> Void)?

    open override func exit() {
        exitCallsCount += 1
        exitClosure?()
    }

    //MARK: - isNone

    var isNoneUnderlyingCallsCount = 0
    open var isNoneCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isNoneUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isNoneUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isNoneUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isNoneUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isNoneCalled: Bool {
        return isNoneCallsCount > 0
    }

    var isNoneUnderlyingReturnValue: Bool!
    open var isNoneReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isNoneUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isNoneUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isNoneUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isNoneUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isNoneClosure: (() -> Bool)?

    open override func isNone() -> Bool {
        isNoneCallsCount += 1
        if let isNoneClosure = isNoneClosure {
            return isNoneClosure()
        } else {
            return isNoneReturnValue
        }
    }
}
open class SsoHandlerSDKMock: MatrixRustSDK.SsoHandler, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - finish

    open var finishCallbackUrlThrowableError: Error?
    var finishCallbackUrlUnderlyingCallsCount = 0
    open var finishCallbackUrlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return finishCallbackUrlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = finishCallbackUrlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                finishCallbackUrlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    finishCallbackUrlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var finishCallbackUrlCalled: Bool {
        return finishCallbackUrlCallsCount > 0
    }
    open var finishCallbackUrlReceivedCallbackUrl: String?
    open var finishCallbackUrlReceivedInvocations: [String] = []
    open var finishCallbackUrlClosure: ((String) async throws -> Void)?

    open override func finish(callbackUrl: String) async throws {
        if let error = finishCallbackUrlThrowableError {
            throw error
        }
        finishCallbackUrlCallsCount += 1
        finishCallbackUrlReceivedCallbackUrl = callbackUrl
        DispatchQueue.main.async {
            self.finishCallbackUrlReceivedInvocations.append(callbackUrl)
        }
        try await finishCallbackUrlClosure?(callbackUrl)
    }

    //MARK: - url

    var urlUnderlyingCallsCount = 0
    open var urlCallsCount: Int {
        get {
            if Thread.isMainThread {
                return urlUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = urlUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                urlUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    urlUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var urlCalled: Bool {
        return urlCallsCount > 0
    }

    var urlUnderlyingReturnValue: String!
    open var urlReturnValue: String! {
        get {
            if Thread.isMainThread {
                return urlUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = urlUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                urlUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    urlUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var urlClosure: (() -> String)?

    open override func url() -> String {
        urlCallsCount += 1
        if let urlClosure = urlClosure {
            return urlClosure()
        } else {
            return urlReturnValue
        }
    }
}
open class SyncServiceSDKMock: MatrixRustSDK.SyncService, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - roomListService

    var roomListServiceUnderlyingCallsCount = 0
    open var roomListServiceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomListServiceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomListServiceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomListServiceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomListServiceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var roomListServiceCalled: Bool {
        return roomListServiceCallsCount > 0
    }

    var roomListServiceUnderlyingReturnValue: RoomListService!
    open var roomListServiceReturnValue: RoomListService! {
        get {
            if Thread.isMainThread {
                return roomListServiceUnderlyingReturnValue
            } else {
                var returnValue: RoomListService? = nil
                DispatchQueue.main.sync {
                    returnValue = roomListServiceUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomListServiceUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomListServiceUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var roomListServiceClosure: (() -> RoomListService)?

    open override func roomListService() -> RoomListService {
        roomListServiceCallsCount += 1
        if let roomListServiceClosure = roomListServiceClosure {
            return roomListServiceClosure()
        } else {
            return roomListServiceReturnValue
        }
    }

    //MARK: - start

    var startUnderlyingCallsCount = 0
    open var startCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var startCalled: Bool {
        return startCallsCount > 0
    }
    open var startClosure: (() async -> Void)?

    open override func start() async {
        startCallsCount += 1
        await startClosure?()
    }

    //MARK: - state

    var stateListenerUnderlyingCallsCount = 0
    open var stateListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stateListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stateListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stateListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stateListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var stateListenerCalled: Bool {
        return stateListenerCallsCount > 0
    }
    open var stateListenerReceivedListener: SyncServiceStateObserver?
    open var stateListenerReceivedInvocations: [SyncServiceStateObserver] = []

    var stateListenerUnderlyingReturnValue: TaskHandle!
    open var stateListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return stateListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = stateListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stateListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    stateListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var stateListenerClosure: ((SyncServiceStateObserver) -> TaskHandle)?

    open override func state(listener: SyncServiceStateObserver) -> TaskHandle {
        stateListenerCallsCount += 1
        stateListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.stateListenerReceivedInvocations.append(listener)
        }
        if let stateListenerClosure = stateListenerClosure {
            return stateListenerClosure(listener)
        } else {
            return stateListenerReturnValue
        }
    }

    //MARK: - stop

    var stopUnderlyingCallsCount = 0
    open var stopCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var stopCalled: Bool {
        return stopCallsCount > 0
    }
    open var stopClosure: (() async -> Void)?

    open override func stop() async {
        stopCallsCount += 1
        await stopClosure?()
    }
}
open class SyncServiceBuilderSDKMock: MatrixRustSDK.SyncServiceBuilder, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - finish

    open var finishThrowableError: Error?
    var finishUnderlyingCallsCount = 0
    open var finishCallsCount: Int {
        get {
            if Thread.isMainThread {
                return finishUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = finishUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                finishUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    finishUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var finishCalled: Bool {
        return finishCallsCount > 0
    }

    var finishUnderlyingReturnValue: SyncService!
    open var finishReturnValue: SyncService! {
        get {
            if Thread.isMainThread {
                return finishUnderlyingReturnValue
            } else {
                var returnValue: SyncService? = nil
                DispatchQueue.main.sync {
                    returnValue = finishUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                finishUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    finishUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var finishClosure: (() async throws -> SyncService)?

    open override func finish() async throws -> SyncService {
        if let error = finishThrowableError {
            throw error
        }
        finishCallsCount += 1
        if let finishClosure = finishClosure {
            return try await finishClosure()
        } else {
            return finishReturnValue
        }
    }

    //MARK: - withCrossProcessLock

    var withCrossProcessLockUnderlyingCallsCount = 0
    open var withCrossProcessLockCallsCount: Int {
        get {
            if Thread.isMainThread {
                return withCrossProcessLockUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = withCrossProcessLockUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withCrossProcessLockUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    withCrossProcessLockUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var withCrossProcessLockCalled: Bool {
        return withCrossProcessLockCallsCount > 0
    }

    var withCrossProcessLockUnderlyingReturnValue: SyncServiceBuilder!
    open var withCrossProcessLockReturnValue: SyncServiceBuilder! {
        get {
            if Thread.isMainThread {
                return withCrossProcessLockUnderlyingReturnValue
            } else {
                var returnValue: SyncServiceBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = withCrossProcessLockUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withCrossProcessLockUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    withCrossProcessLockUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var withCrossProcessLockClosure: (() -> SyncServiceBuilder)?

    open override func withCrossProcessLock() -> SyncServiceBuilder {
        withCrossProcessLockCallsCount += 1
        if let withCrossProcessLockClosure = withCrossProcessLockClosure {
            return withCrossProcessLockClosure()
        } else {
            return withCrossProcessLockReturnValue
        }
    }

    //MARK: - withOfflineMode

    var withOfflineModeUnderlyingCallsCount = 0
    open var withOfflineModeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return withOfflineModeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = withOfflineModeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withOfflineModeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    withOfflineModeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var withOfflineModeCalled: Bool {
        return withOfflineModeCallsCount > 0
    }

    var withOfflineModeUnderlyingReturnValue: SyncServiceBuilder!
    open var withOfflineModeReturnValue: SyncServiceBuilder! {
        get {
            if Thread.isMainThread {
                return withOfflineModeUnderlyingReturnValue
            } else {
                var returnValue: SyncServiceBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = withOfflineModeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withOfflineModeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    withOfflineModeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var withOfflineModeClosure: (() -> SyncServiceBuilder)?

    open override func withOfflineMode() -> SyncServiceBuilder {
        withOfflineModeCallsCount += 1
        if let withOfflineModeClosure = withOfflineModeClosure {
            return withOfflineModeClosure()
        } else {
            return withOfflineModeReturnValue
        }
    }

    //MARK: - withSharePos

    var withSharePosEnableUnderlyingCallsCount = 0
    open var withSharePosEnableCallsCount: Int {
        get {
            if Thread.isMainThread {
                return withSharePosEnableUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = withSharePosEnableUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withSharePosEnableUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    withSharePosEnableUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var withSharePosEnableCalled: Bool {
        return withSharePosEnableCallsCount > 0
    }
    open var withSharePosEnableReceivedEnable: Bool?
    open var withSharePosEnableReceivedInvocations: [Bool] = []

    var withSharePosEnableUnderlyingReturnValue: SyncServiceBuilder!
    open var withSharePosEnableReturnValue: SyncServiceBuilder! {
        get {
            if Thread.isMainThread {
                return withSharePosEnableUnderlyingReturnValue
            } else {
                var returnValue: SyncServiceBuilder? = nil
                DispatchQueue.main.sync {
                    returnValue = withSharePosEnableUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withSharePosEnableUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    withSharePosEnableUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var withSharePosEnableClosure: ((Bool) -> SyncServiceBuilder)?

    open override func withSharePos(enable: Bool) -> SyncServiceBuilder {
        withSharePosEnableCallsCount += 1
        withSharePosEnableReceivedEnable = enable
        DispatchQueue.main.async {
            self.withSharePosEnableReceivedInvocations.append(enable)
        }
        if let withSharePosEnableClosure = withSharePosEnableClosure {
            return withSharePosEnableClosure(enable)
        } else {
            return withSharePosEnableReturnValue
        }
    }
}
open class TaskHandleSDKMock: MatrixRustSDK.TaskHandle, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - cancel

    var cancelUnderlyingCallsCount = 0
    open var cancelCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cancelUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cancelUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cancelUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cancelUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var cancelCalled: Bool {
        return cancelCallsCount > 0
    }
    open var cancelClosure: (() -> Void)?

    open override func cancel() {
        cancelCallsCount += 1
        cancelClosure?()
    }

    //MARK: - isFinished

    var isFinishedUnderlyingCallsCount = 0
    open var isFinishedCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isFinishedUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isFinishedUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isFinishedUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isFinishedUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isFinishedCalled: Bool {
        return isFinishedCallsCount > 0
    }

    var isFinishedUnderlyingReturnValue: Bool!
    open var isFinishedReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isFinishedUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isFinishedUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isFinishedUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isFinishedUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isFinishedClosure: (() -> Bool)?

    open override func isFinished() -> Bool {
        isFinishedCallsCount += 1
        if let isFinishedClosure = isFinishedClosure {
            return isFinishedClosure()
        } else {
            return isFinishedReturnValue
        }
    }
}
open class ThreadSummarySDKMock: MatrixRustSDK.ThreadSummary, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - latestEvent

    var latestEventUnderlyingCallsCount = 0
    open var latestEventCallsCount: Int {
        get {
            if Thread.isMainThread {
                return latestEventUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = latestEventUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                latestEventUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    latestEventUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var latestEventCalled: Bool {
        return latestEventCallsCount > 0
    }

    var latestEventUnderlyingReturnValue: EmbeddedEventDetails!
    open var latestEventReturnValue: EmbeddedEventDetails! {
        get {
            if Thread.isMainThread {
                return latestEventUnderlyingReturnValue
            } else {
                var returnValue: EmbeddedEventDetails? = nil
                DispatchQueue.main.sync {
                    returnValue = latestEventUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                latestEventUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    latestEventUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var latestEventClosure: (() -> EmbeddedEventDetails)?

    open override func latestEvent() -> EmbeddedEventDetails {
        latestEventCallsCount += 1
        if let latestEventClosure = latestEventClosure {
            return latestEventClosure()
        } else {
            return latestEventReturnValue
        }
    }

    //MARK: - numReplies

    var numRepliesUnderlyingCallsCount = 0
    open var numRepliesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return numRepliesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = numRepliesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                numRepliesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    numRepliesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var numRepliesCalled: Bool {
        return numRepliesCallsCount > 0
    }

    var numRepliesUnderlyingReturnValue: UInt64!
    open var numRepliesReturnValue: UInt64! {
        get {
            if Thread.isMainThread {
                return numRepliesUnderlyingReturnValue
            } else {
                var returnValue: UInt64? = nil
                DispatchQueue.main.sync {
                    returnValue = numRepliesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                numRepliesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    numRepliesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var numRepliesClosure: (() -> UInt64)?

    open override func numReplies() -> UInt64 {
        numRepliesCallsCount += 1
        if let numRepliesClosure = numRepliesClosure {
            return numRepliesClosure()
        } else {
            return numRepliesReturnValue
        }
    }
}
open class TimelineSDKMock: MatrixRustSDK.Timeline, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - addListener

    var addListenerListenerUnderlyingCallsCount = 0
    open var addListenerListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return addListenerListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = addListenerListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                addListenerListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    addListenerListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var addListenerListenerCalled: Bool {
        return addListenerListenerCallsCount > 0
    }
    open var addListenerListenerReceivedListener: TimelineListener?
    open var addListenerListenerReceivedInvocations: [TimelineListener] = []

    var addListenerListenerUnderlyingReturnValue: TaskHandle!
    open var addListenerListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return addListenerListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = addListenerListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                addListenerListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    addListenerListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var addListenerListenerClosure: ((TimelineListener) async -> TaskHandle)?

    open override func addListener(listener: TimelineListener) async -> TaskHandle {
        addListenerListenerCallsCount += 1
        addListenerListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.addListenerListenerReceivedInvocations.append(listener)
        }
        if let addListenerListenerClosure = addListenerListenerClosure {
            return await addListenerListenerClosure(listener)
        } else {
            return addListenerListenerReturnValue
        }
    }

    //MARK: - createMessageContent

    var createMessageContentMsgTypeUnderlyingCallsCount = 0
    open var createMessageContentMsgTypeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return createMessageContentMsgTypeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = createMessageContentMsgTypeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createMessageContentMsgTypeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    createMessageContentMsgTypeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var createMessageContentMsgTypeCalled: Bool {
        return createMessageContentMsgTypeCallsCount > 0
    }
    open var createMessageContentMsgTypeReceivedMsgType: MessageType?
    open var createMessageContentMsgTypeReceivedInvocations: [MessageType] = []

    var createMessageContentMsgTypeUnderlyingReturnValue: RoomMessageEventContentWithoutRelation?
    open var createMessageContentMsgTypeReturnValue: RoomMessageEventContentWithoutRelation? {
        get {
            if Thread.isMainThread {
                return createMessageContentMsgTypeUnderlyingReturnValue
            } else {
                var returnValue: RoomMessageEventContentWithoutRelation?? = nil
                DispatchQueue.main.sync {
                    returnValue = createMessageContentMsgTypeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createMessageContentMsgTypeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    createMessageContentMsgTypeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var createMessageContentMsgTypeClosure: ((MessageType) -> RoomMessageEventContentWithoutRelation?)?

    open override func createMessageContent(msgType: MessageType) -> RoomMessageEventContentWithoutRelation? {
        createMessageContentMsgTypeCallsCount += 1
        createMessageContentMsgTypeReceivedMsgType = msgType
        DispatchQueue.main.async {
            self.createMessageContentMsgTypeReceivedInvocations.append(msgType)
        }
        if let createMessageContentMsgTypeClosure = createMessageContentMsgTypeClosure {
            return createMessageContentMsgTypeClosure(msgType)
        } else {
            return createMessageContentMsgTypeReturnValue
        }
    }

    //MARK: - createPoll

    open var createPollQuestionAnswersMaxSelectionsPollKindThrowableError: Error?
    var createPollQuestionAnswersMaxSelectionsPollKindUnderlyingCallsCount = 0
    open var createPollQuestionAnswersMaxSelectionsPollKindCallsCount: Int {
        get {
            if Thread.isMainThread {
                return createPollQuestionAnswersMaxSelectionsPollKindUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = createPollQuestionAnswersMaxSelectionsPollKindUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createPollQuestionAnswersMaxSelectionsPollKindUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    createPollQuestionAnswersMaxSelectionsPollKindUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var createPollQuestionAnswersMaxSelectionsPollKindCalled: Bool {
        return createPollQuestionAnswersMaxSelectionsPollKindCallsCount > 0
    }
    open var createPollQuestionAnswersMaxSelectionsPollKindReceivedArguments: (question: String, answers: [String], maxSelections: UInt8, pollKind: PollKind)?
    open var createPollQuestionAnswersMaxSelectionsPollKindReceivedInvocations: [(question: String, answers: [String], maxSelections: UInt8, pollKind: PollKind)] = []
    open var createPollQuestionAnswersMaxSelectionsPollKindClosure: ((String, [String], UInt8, PollKind) async throws -> Void)?

    open override func createPoll(question: String, answers: [String], maxSelections: UInt8, pollKind: PollKind) async throws {
        if let error = createPollQuestionAnswersMaxSelectionsPollKindThrowableError {
            throw error
        }
        createPollQuestionAnswersMaxSelectionsPollKindCallsCount += 1
        createPollQuestionAnswersMaxSelectionsPollKindReceivedArguments = (question: question, answers: answers, maxSelections: maxSelections, pollKind: pollKind)
        DispatchQueue.main.async {
            self.createPollQuestionAnswersMaxSelectionsPollKindReceivedInvocations.append((question: question, answers: answers, maxSelections: maxSelections, pollKind: pollKind))
        }
        try await createPollQuestionAnswersMaxSelectionsPollKindClosure?(question, answers, maxSelections, pollKind)
    }

    //MARK: - edit

    open var editEventOrTransactionIdNewContentThrowableError: Error?
    var editEventOrTransactionIdNewContentUnderlyingCallsCount = 0
    open var editEventOrTransactionIdNewContentCallsCount: Int {
        get {
            if Thread.isMainThread {
                return editEventOrTransactionIdNewContentUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = editEventOrTransactionIdNewContentUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                editEventOrTransactionIdNewContentUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    editEventOrTransactionIdNewContentUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var editEventOrTransactionIdNewContentCalled: Bool {
        return editEventOrTransactionIdNewContentCallsCount > 0
    }
    open var editEventOrTransactionIdNewContentReceivedArguments: (eventOrTransactionId: EventOrTransactionId, newContent: EditedContent)?
    open var editEventOrTransactionIdNewContentReceivedInvocations: [(eventOrTransactionId: EventOrTransactionId, newContent: EditedContent)] = []
    open var editEventOrTransactionIdNewContentClosure: ((EventOrTransactionId, EditedContent) async throws -> Void)?

    open override func edit(eventOrTransactionId: EventOrTransactionId, newContent: EditedContent) async throws {
        if let error = editEventOrTransactionIdNewContentThrowableError {
            throw error
        }
        editEventOrTransactionIdNewContentCallsCount += 1
        editEventOrTransactionIdNewContentReceivedArguments = (eventOrTransactionId: eventOrTransactionId, newContent: newContent)
        DispatchQueue.main.async {
            self.editEventOrTransactionIdNewContentReceivedInvocations.append((eventOrTransactionId: eventOrTransactionId, newContent: newContent))
        }
        try await editEventOrTransactionIdNewContentClosure?(eventOrTransactionId, newContent)
    }

    //MARK: - endPoll

    open var endPollPollStartEventIdTextThrowableError: Error?
    var endPollPollStartEventIdTextUnderlyingCallsCount = 0
    open var endPollPollStartEventIdTextCallsCount: Int {
        get {
            if Thread.isMainThread {
                return endPollPollStartEventIdTextUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = endPollPollStartEventIdTextUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                endPollPollStartEventIdTextUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    endPollPollStartEventIdTextUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var endPollPollStartEventIdTextCalled: Bool {
        return endPollPollStartEventIdTextCallsCount > 0
    }
    open var endPollPollStartEventIdTextReceivedArguments: (pollStartEventId: String, text: String)?
    open var endPollPollStartEventIdTextReceivedInvocations: [(pollStartEventId: String, text: String)] = []
    open var endPollPollStartEventIdTextClosure: ((String, String) async throws -> Void)?

    open override func endPoll(pollStartEventId: String, text: String) async throws {
        if let error = endPollPollStartEventIdTextThrowableError {
            throw error
        }
        endPollPollStartEventIdTextCallsCount += 1
        endPollPollStartEventIdTextReceivedArguments = (pollStartEventId: pollStartEventId, text: text)
        DispatchQueue.main.async {
            self.endPollPollStartEventIdTextReceivedInvocations.append((pollStartEventId: pollStartEventId, text: text))
        }
        try await endPollPollStartEventIdTextClosure?(pollStartEventId, text)
    }

    //MARK: - fetchDetailsForEvent

    open var fetchDetailsForEventEventIdThrowableError: Error?
    var fetchDetailsForEventEventIdUnderlyingCallsCount = 0
    open var fetchDetailsForEventEventIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return fetchDetailsForEventEventIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = fetchDetailsForEventEventIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                fetchDetailsForEventEventIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    fetchDetailsForEventEventIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var fetchDetailsForEventEventIdCalled: Bool {
        return fetchDetailsForEventEventIdCallsCount > 0
    }
    open var fetchDetailsForEventEventIdReceivedEventId: String?
    open var fetchDetailsForEventEventIdReceivedInvocations: [String] = []
    open var fetchDetailsForEventEventIdClosure: ((String) async throws -> Void)?

    open override func fetchDetailsForEvent(eventId: String) async throws {
        if let error = fetchDetailsForEventEventIdThrowableError {
            throw error
        }
        fetchDetailsForEventEventIdCallsCount += 1
        fetchDetailsForEventEventIdReceivedEventId = eventId
        DispatchQueue.main.async {
            self.fetchDetailsForEventEventIdReceivedInvocations.append(eventId)
        }
        try await fetchDetailsForEventEventIdClosure?(eventId)
    }

    //MARK: - fetchMembers

    var fetchMembersUnderlyingCallsCount = 0
    open var fetchMembersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return fetchMembersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = fetchMembersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                fetchMembersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    fetchMembersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var fetchMembersCalled: Bool {
        return fetchMembersCallsCount > 0
    }
    open var fetchMembersClosure: (() async -> Void)?

    open override func fetchMembers() async {
        fetchMembersCallsCount += 1
        await fetchMembersClosure?()
    }

    //MARK: - getEventTimelineItemByEventId

    open var getEventTimelineItemByEventIdEventIdThrowableError: Error?
    var getEventTimelineItemByEventIdEventIdUnderlyingCallsCount = 0
    open var getEventTimelineItemByEventIdEventIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getEventTimelineItemByEventIdEventIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getEventTimelineItemByEventIdEventIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getEventTimelineItemByEventIdEventIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getEventTimelineItemByEventIdEventIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var getEventTimelineItemByEventIdEventIdCalled: Bool {
        return getEventTimelineItemByEventIdEventIdCallsCount > 0
    }
    open var getEventTimelineItemByEventIdEventIdReceivedEventId: String?
    open var getEventTimelineItemByEventIdEventIdReceivedInvocations: [String] = []

    var getEventTimelineItemByEventIdEventIdUnderlyingReturnValue: EventTimelineItem!
    open var getEventTimelineItemByEventIdEventIdReturnValue: EventTimelineItem! {
        get {
            if Thread.isMainThread {
                return getEventTimelineItemByEventIdEventIdUnderlyingReturnValue
            } else {
                var returnValue: EventTimelineItem? = nil
                DispatchQueue.main.sync {
                    returnValue = getEventTimelineItemByEventIdEventIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getEventTimelineItemByEventIdEventIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getEventTimelineItemByEventIdEventIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var getEventTimelineItemByEventIdEventIdClosure: ((String) async throws -> EventTimelineItem)?

    open override func getEventTimelineItemByEventId(eventId: String) async throws -> EventTimelineItem {
        if let error = getEventTimelineItemByEventIdEventIdThrowableError {
            throw error
        }
        getEventTimelineItemByEventIdEventIdCallsCount += 1
        getEventTimelineItemByEventIdEventIdReceivedEventId = eventId
        DispatchQueue.main.async {
            self.getEventTimelineItemByEventIdEventIdReceivedInvocations.append(eventId)
        }
        if let getEventTimelineItemByEventIdEventIdClosure = getEventTimelineItemByEventIdEventIdClosure {
            return try await getEventTimelineItemByEventIdEventIdClosure(eventId)
        } else {
            return getEventTimelineItemByEventIdEventIdReturnValue
        }
    }

    //MARK: - loadReplyDetails

    open var loadReplyDetailsEventIdStrThrowableError: Error?
    var loadReplyDetailsEventIdStrUnderlyingCallsCount = 0
    open var loadReplyDetailsEventIdStrCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadReplyDetailsEventIdStrUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadReplyDetailsEventIdStrUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadReplyDetailsEventIdStrUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadReplyDetailsEventIdStrUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var loadReplyDetailsEventIdStrCalled: Bool {
        return loadReplyDetailsEventIdStrCallsCount > 0
    }
    open var loadReplyDetailsEventIdStrReceivedEventIdStr: String?
    open var loadReplyDetailsEventIdStrReceivedInvocations: [String] = []

    var loadReplyDetailsEventIdStrUnderlyingReturnValue: InReplyToDetails!
    open var loadReplyDetailsEventIdStrReturnValue: InReplyToDetails! {
        get {
            if Thread.isMainThread {
                return loadReplyDetailsEventIdStrUnderlyingReturnValue
            } else {
                var returnValue: InReplyToDetails? = nil
                DispatchQueue.main.sync {
                    returnValue = loadReplyDetailsEventIdStrUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadReplyDetailsEventIdStrUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadReplyDetailsEventIdStrUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var loadReplyDetailsEventIdStrClosure: ((String) async throws -> InReplyToDetails)?

    open override func loadReplyDetails(eventIdStr: String) async throws -> InReplyToDetails {
        if let error = loadReplyDetailsEventIdStrThrowableError {
            throw error
        }
        loadReplyDetailsEventIdStrCallsCount += 1
        loadReplyDetailsEventIdStrReceivedEventIdStr = eventIdStr
        DispatchQueue.main.async {
            self.loadReplyDetailsEventIdStrReceivedInvocations.append(eventIdStr)
        }
        if let loadReplyDetailsEventIdStrClosure = loadReplyDetailsEventIdStrClosure {
            return try await loadReplyDetailsEventIdStrClosure(eventIdStr)
        } else {
            return loadReplyDetailsEventIdStrReturnValue
        }
    }

    //MARK: - markAsRead

    open var markAsReadReceiptTypeThrowableError: Error?
    var markAsReadReceiptTypeUnderlyingCallsCount = 0
    open var markAsReadReceiptTypeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return markAsReadReceiptTypeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = markAsReadReceiptTypeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                markAsReadReceiptTypeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    markAsReadReceiptTypeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var markAsReadReceiptTypeCalled: Bool {
        return markAsReadReceiptTypeCallsCount > 0
    }
    open var markAsReadReceiptTypeReceivedReceiptType: ReceiptType?
    open var markAsReadReceiptTypeReceivedInvocations: [ReceiptType] = []
    open var markAsReadReceiptTypeClosure: ((ReceiptType) async throws -> Void)?

    open override func markAsRead(receiptType: ReceiptType) async throws {
        if let error = markAsReadReceiptTypeThrowableError {
            throw error
        }
        markAsReadReceiptTypeCallsCount += 1
        markAsReadReceiptTypeReceivedReceiptType = receiptType
        DispatchQueue.main.async {
            self.markAsReadReceiptTypeReceivedInvocations.append(receiptType)
        }
        try await markAsReadReceiptTypeClosure?(receiptType)
    }

    //MARK: - paginateBackwards

    open var paginateBackwardsNumEventsThrowableError: Error?
    var paginateBackwardsNumEventsUnderlyingCallsCount = 0
    open var paginateBackwardsNumEventsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return paginateBackwardsNumEventsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = paginateBackwardsNumEventsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                paginateBackwardsNumEventsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    paginateBackwardsNumEventsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var paginateBackwardsNumEventsCalled: Bool {
        return paginateBackwardsNumEventsCallsCount > 0
    }
    open var paginateBackwardsNumEventsReceivedNumEvents: UInt16?
    open var paginateBackwardsNumEventsReceivedInvocations: [UInt16] = []

    var paginateBackwardsNumEventsUnderlyingReturnValue: Bool!
    open var paginateBackwardsNumEventsReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return paginateBackwardsNumEventsUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = paginateBackwardsNumEventsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                paginateBackwardsNumEventsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    paginateBackwardsNumEventsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var paginateBackwardsNumEventsClosure: ((UInt16) async throws -> Bool)?

    open override func paginateBackwards(numEvents: UInt16) async throws -> Bool {
        if let error = paginateBackwardsNumEventsThrowableError {
            throw error
        }
        paginateBackwardsNumEventsCallsCount += 1
        paginateBackwardsNumEventsReceivedNumEvents = numEvents
        DispatchQueue.main.async {
            self.paginateBackwardsNumEventsReceivedInvocations.append(numEvents)
        }
        if let paginateBackwardsNumEventsClosure = paginateBackwardsNumEventsClosure {
            return try await paginateBackwardsNumEventsClosure(numEvents)
        } else {
            return paginateBackwardsNumEventsReturnValue
        }
    }

    //MARK: - paginateForwards

    open var paginateForwardsNumEventsThrowableError: Error?
    var paginateForwardsNumEventsUnderlyingCallsCount = 0
    open var paginateForwardsNumEventsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return paginateForwardsNumEventsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = paginateForwardsNumEventsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                paginateForwardsNumEventsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    paginateForwardsNumEventsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var paginateForwardsNumEventsCalled: Bool {
        return paginateForwardsNumEventsCallsCount > 0
    }
    open var paginateForwardsNumEventsReceivedNumEvents: UInt16?
    open var paginateForwardsNumEventsReceivedInvocations: [UInt16] = []

    var paginateForwardsNumEventsUnderlyingReturnValue: Bool!
    open var paginateForwardsNumEventsReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return paginateForwardsNumEventsUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = paginateForwardsNumEventsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                paginateForwardsNumEventsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    paginateForwardsNumEventsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var paginateForwardsNumEventsClosure: ((UInt16) async throws -> Bool)?

    open override func paginateForwards(numEvents: UInt16) async throws -> Bool {
        if let error = paginateForwardsNumEventsThrowableError {
            throw error
        }
        paginateForwardsNumEventsCallsCount += 1
        paginateForwardsNumEventsReceivedNumEvents = numEvents
        DispatchQueue.main.async {
            self.paginateForwardsNumEventsReceivedInvocations.append(numEvents)
        }
        if let paginateForwardsNumEventsClosure = paginateForwardsNumEventsClosure {
            return try await paginateForwardsNumEventsClosure(numEvents)
        } else {
            return paginateForwardsNumEventsReturnValue
        }
    }

    //MARK: - pinEvent

    open var pinEventEventIdThrowableError: Error?
    var pinEventEventIdUnderlyingCallsCount = 0
    open var pinEventEventIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pinEventEventIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pinEventEventIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pinEventEventIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pinEventEventIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var pinEventEventIdCalled: Bool {
        return pinEventEventIdCallsCount > 0
    }
    open var pinEventEventIdReceivedEventId: String?
    open var pinEventEventIdReceivedInvocations: [String] = []

    var pinEventEventIdUnderlyingReturnValue: Bool!
    open var pinEventEventIdReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return pinEventEventIdUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = pinEventEventIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pinEventEventIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    pinEventEventIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var pinEventEventIdClosure: ((String) async throws -> Bool)?

    open override func pinEvent(eventId: String) async throws -> Bool {
        if let error = pinEventEventIdThrowableError {
            throw error
        }
        pinEventEventIdCallsCount += 1
        pinEventEventIdReceivedEventId = eventId
        DispatchQueue.main.async {
            self.pinEventEventIdReceivedInvocations.append(eventId)
        }
        if let pinEventEventIdClosure = pinEventEventIdClosure {
            return try await pinEventEventIdClosure(eventId)
        } else {
            return pinEventEventIdReturnValue
        }
    }

    //MARK: - redactEvent

    open var redactEventEventOrTransactionIdReasonThrowableError: Error?
    var redactEventEventOrTransactionIdReasonUnderlyingCallsCount = 0
    open var redactEventEventOrTransactionIdReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return redactEventEventOrTransactionIdReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = redactEventEventOrTransactionIdReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                redactEventEventOrTransactionIdReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    redactEventEventOrTransactionIdReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var redactEventEventOrTransactionIdReasonCalled: Bool {
        return redactEventEventOrTransactionIdReasonCallsCount > 0
    }
    open var redactEventEventOrTransactionIdReasonReceivedArguments: (eventOrTransactionId: EventOrTransactionId, reason: String?)?
    open var redactEventEventOrTransactionIdReasonReceivedInvocations: [(eventOrTransactionId: EventOrTransactionId, reason: String?)] = []
    open var redactEventEventOrTransactionIdReasonClosure: ((EventOrTransactionId, String?) async throws -> Void)?

    open override func redactEvent(eventOrTransactionId: EventOrTransactionId, reason: String?) async throws {
        if let error = redactEventEventOrTransactionIdReasonThrowableError {
            throw error
        }
        redactEventEventOrTransactionIdReasonCallsCount += 1
        redactEventEventOrTransactionIdReasonReceivedArguments = (eventOrTransactionId: eventOrTransactionId, reason: reason)
        DispatchQueue.main.async {
            self.redactEventEventOrTransactionIdReasonReceivedInvocations.append((eventOrTransactionId: eventOrTransactionId, reason: reason))
        }
        try await redactEventEventOrTransactionIdReasonClosure?(eventOrTransactionId, reason)
    }

    //MARK: - retryDecryption

    var retryDecryptionSessionIdsUnderlyingCallsCount = 0
    open var retryDecryptionSessionIdsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return retryDecryptionSessionIdsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = retryDecryptionSessionIdsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                retryDecryptionSessionIdsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    retryDecryptionSessionIdsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var retryDecryptionSessionIdsCalled: Bool {
        return retryDecryptionSessionIdsCallsCount > 0
    }
    open var retryDecryptionSessionIdsReceivedSessionIds: [String]?
    open var retryDecryptionSessionIdsReceivedInvocations: [[String]] = []
    open var retryDecryptionSessionIdsClosure: (([String]) -> Void)?

    open override func retryDecryption(sessionIds: [String]) {
        retryDecryptionSessionIdsCallsCount += 1
        retryDecryptionSessionIdsReceivedSessionIds = sessionIds
        DispatchQueue.main.async {
            self.retryDecryptionSessionIdsReceivedInvocations.append(sessionIds)
        }
        retryDecryptionSessionIdsClosure?(sessionIds)
    }

    //MARK: - send

    open var sendMsgThrowableError: Error?
    var sendMsgUnderlyingCallsCount = 0
    open var sendMsgCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendMsgUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMsgUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMsgUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMsgUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendMsgCalled: Bool {
        return sendMsgCallsCount > 0
    }
    open var sendMsgReceivedMsg: RoomMessageEventContentWithoutRelation?
    open var sendMsgReceivedInvocations: [RoomMessageEventContentWithoutRelation] = []

    var sendMsgUnderlyingReturnValue: SendHandle!
    open var sendMsgReturnValue: SendHandle! {
        get {
            if Thread.isMainThread {
                return sendMsgUnderlyingReturnValue
            } else {
                var returnValue: SendHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMsgUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMsgUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMsgUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sendMsgClosure: ((RoomMessageEventContentWithoutRelation) async throws -> SendHandle)?

    open override func send(msg: RoomMessageEventContentWithoutRelation) async throws -> SendHandle {
        if let error = sendMsgThrowableError {
            throw error
        }
        sendMsgCallsCount += 1
        sendMsgReceivedMsg = msg
        DispatchQueue.main.async {
            self.sendMsgReceivedInvocations.append(msg)
        }
        if let sendMsgClosure = sendMsgClosure {
            return try await sendMsgClosure(msg)
        } else {
            return sendMsgReturnValue
        }
    }

    //MARK: - sendAudio

    open var sendAudioParamsAudioInfoProgressWatcherThrowableError: Error?
    var sendAudioParamsAudioInfoProgressWatcherUnderlyingCallsCount = 0
    open var sendAudioParamsAudioInfoProgressWatcherCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendAudioParamsAudioInfoProgressWatcherUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendAudioParamsAudioInfoProgressWatcherUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendAudioParamsAudioInfoProgressWatcherUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendAudioParamsAudioInfoProgressWatcherUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendAudioParamsAudioInfoProgressWatcherCalled: Bool {
        return sendAudioParamsAudioInfoProgressWatcherCallsCount > 0
    }
    open var sendAudioParamsAudioInfoProgressWatcherReceivedArguments: (params: UploadParameters, audioInfo: AudioInfo, progressWatcher: ProgressWatcher?)?
    open var sendAudioParamsAudioInfoProgressWatcherReceivedInvocations: [(params: UploadParameters, audioInfo: AudioInfo, progressWatcher: ProgressWatcher?)] = []

    var sendAudioParamsAudioInfoProgressWatcherUnderlyingReturnValue: SendAttachmentJoinHandle!
    open var sendAudioParamsAudioInfoProgressWatcherReturnValue: SendAttachmentJoinHandle! {
        get {
            if Thread.isMainThread {
                return sendAudioParamsAudioInfoProgressWatcherUnderlyingReturnValue
            } else {
                var returnValue: SendAttachmentJoinHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = sendAudioParamsAudioInfoProgressWatcherUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendAudioParamsAudioInfoProgressWatcherUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendAudioParamsAudioInfoProgressWatcherUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sendAudioParamsAudioInfoProgressWatcherClosure: ((UploadParameters, AudioInfo, ProgressWatcher?) throws -> SendAttachmentJoinHandle)?

    open override func sendAudio(params: UploadParameters, audioInfo: AudioInfo, progressWatcher: ProgressWatcher?) throws -> SendAttachmentJoinHandle {
        if let error = sendAudioParamsAudioInfoProgressWatcherThrowableError {
            throw error
        }
        sendAudioParamsAudioInfoProgressWatcherCallsCount += 1
        sendAudioParamsAudioInfoProgressWatcherReceivedArguments = (params: params, audioInfo: audioInfo, progressWatcher: progressWatcher)
        DispatchQueue.main.async {
            self.sendAudioParamsAudioInfoProgressWatcherReceivedInvocations.append((params: params, audioInfo: audioInfo, progressWatcher: progressWatcher))
        }
        if let sendAudioParamsAudioInfoProgressWatcherClosure = sendAudioParamsAudioInfoProgressWatcherClosure {
            return try sendAudioParamsAudioInfoProgressWatcherClosure(params, audioInfo, progressWatcher)
        } else {
            return sendAudioParamsAudioInfoProgressWatcherReturnValue
        }
    }

    //MARK: - sendFile

    open var sendFileParamsFileInfoProgressWatcherThrowableError: Error?
    var sendFileParamsFileInfoProgressWatcherUnderlyingCallsCount = 0
    open var sendFileParamsFileInfoProgressWatcherCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendFileParamsFileInfoProgressWatcherUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendFileParamsFileInfoProgressWatcherUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendFileParamsFileInfoProgressWatcherUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendFileParamsFileInfoProgressWatcherUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendFileParamsFileInfoProgressWatcherCalled: Bool {
        return sendFileParamsFileInfoProgressWatcherCallsCount > 0
    }
    open var sendFileParamsFileInfoProgressWatcherReceivedArguments: (params: UploadParameters, fileInfo: FileInfo, progressWatcher: ProgressWatcher?)?
    open var sendFileParamsFileInfoProgressWatcherReceivedInvocations: [(params: UploadParameters, fileInfo: FileInfo, progressWatcher: ProgressWatcher?)] = []

    var sendFileParamsFileInfoProgressWatcherUnderlyingReturnValue: SendAttachmentJoinHandle!
    open var sendFileParamsFileInfoProgressWatcherReturnValue: SendAttachmentJoinHandle! {
        get {
            if Thread.isMainThread {
                return sendFileParamsFileInfoProgressWatcherUnderlyingReturnValue
            } else {
                var returnValue: SendAttachmentJoinHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = sendFileParamsFileInfoProgressWatcherUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendFileParamsFileInfoProgressWatcherUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendFileParamsFileInfoProgressWatcherUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sendFileParamsFileInfoProgressWatcherClosure: ((UploadParameters, FileInfo, ProgressWatcher?) throws -> SendAttachmentJoinHandle)?

    open override func sendFile(params: UploadParameters, fileInfo: FileInfo, progressWatcher: ProgressWatcher?) throws -> SendAttachmentJoinHandle {
        if let error = sendFileParamsFileInfoProgressWatcherThrowableError {
            throw error
        }
        sendFileParamsFileInfoProgressWatcherCallsCount += 1
        sendFileParamsFileInfoProgressWatcherReceivedArguments = (params: params, fileInfo: fileInfo, progressWatcher: progressWatcher)
        DispatchQueue.main.async {
            self.sendFileParamsFileInfoProgressWatcherReceivedInvocations.append((params: params, fileInfo: fileInfo, progressWatcher: progressWatcher))
        }
        if let sendFileParamsFileInfoProgressWatcherClosure = sendFileParamsFileInfoProgressWatcherClosure {
            return try sendFileParamsFileInfoProgressWatcherClosure(params, fileInfo, progressWatcher)
        } else {
            return sendFileParamsFileInfoProgressWatcherReturnValue
        }
    }

    //MARK: - sendGallery

    open var sendGalleryParamsItemInfosThrowableError: Error?
    var sendGalleryParamsItemInfosUnderlyingCallsCount = 0
    open var sendGalleryParamsItemInfosCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendGalleryParamsItemInfosUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendGalleryParamsItemInfosUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendGalleryParamsItemInfosUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendGalleryParamsItemInfosUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendGalleryParamsItemInfosCalled: Bool {
        return sendGalleryParamsItemInfosCallsCount > 0
    }
    open var sendGalleryParamsItemInfosReceivedArguments: (params: GalleryUploadParameters, itemInfos: [GalleryItemInfo])?
    open var sendGalleryParamsItemInfosReceivedInvocations: [(params: GalleryUploadParameters, itemInfos: [GalleryItemInfo])] = []

    var sendGalleryParamsItemInfosUnderlyingReturnValue: SendGalleryJoinHandle!
    open var sendGalleryParamsItemInfosReturnValue: SendGalleryJoinHandle! {
        get {
            if Thread.isMainThread {
                return sendGalleryParamsItemInfosUnderlyingReturnValue
            } else {
                var returnValue: SendGalleryJoinHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = sendGalleryParamsItemInfosUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendGalleryParamsItemInfosUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendGalleryParamsItemInfosUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sendGalleryParamsItemInfosClosure: ((GalleryUploadParameters, [GalleryItemInfo]) throws -> SendGalleryJoinHandle)?

    open override func sendGallery(params: GalleryUploadParameters, itemInfos: [GalleryItemInfo]) throws -> SendGalleryJoinHandle {
        if let error = sendGalleryParamsItemInfosThrowableError {
            throw error
        }
        sendGalleryParamsItemInfosCallsCount += 1
        sendGalleryParamsItemInfosReceivedArguments = (params: params, itemInfos: itemInfos)
        DispatchQueue.main.async {
            self.sendGalleryParamsItemInfosReceivedInvocations.append((params: params, itemInfos: itemInfos))
        }
        if let sendGalleryParamsItemInfosClosure = sendGalleryParamsItemInfosClosure {
            return try sendGalleryParamsItemInfosClosure(params, itemInfos)
        } else {
            return sendGalleryParamsItemInfosReturnValue
        }
    }

    //MARK: - sendImage

    open var sendImageParamsThumbnailPathImageInfoProgressWatcherThrowableError: Error?
    var sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingCallsCount = 0
    open var sendImageParamsThumbnailPathImageInfoProgressWatcherCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendImageParamsThumbnailPathImageInfoProgressWatcherCalled: Bool {
        return sendImageParamsThumbnailPathImageInfoProgressWatcherCallsCount > 0
    }
    open var sendImageParamsThumbnailPathImageInfoProgressWatcherReceivedArguments: (params: UploadParameters, thumbnailPath: String?, imageInfo: ImageInfo, progressWatcher: ProgressWatcher?)?
    open var sendImageParamsThumbnailPathImageInfoProgressWatcherReceivedInvocations: [(params: UploadParameters, thumbnailPath: String?, imageInfo: ImageInfo, progressWatcher: ProgressWatcher?)] = []

    var sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingReturnValue: SendAttachmentJoinHandle!
    open var sendImageParamsThumbnailPathImageInfoProgressWatcherReturnValue: SendAttachmentJoinHandle! {
        get {
            if Thread.isMainThread {
                return sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingReturnValue
            } else {
                var returnValue: SendAttachmentJoinHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendImageParamsThumbnailPathImageInfoProgressWatcherUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sendImageParamsThumbnailPathImageInfoProgressWatcherClosure: ((UploadParameters, String?, ImageInfo, ProgressWatcher?) throws -> SendAttachmentJoinHandle)?

    open override func sendImage(params: UploadParameters, thumbnailPath: String?, imageInfo: ImageInfo, progressWatcher: ProgressWatcher?) throws -> SendAttachmentJoinHandle {
        if let error = sendImageParamsThumbnailPathImageInfoProgressWatcherThrowableError {
            throw error
        }
        sendImageParamsThumbnailPathImageInfoProgressWatcherCallsCount += 1
        sendImageParamsThumbnailPathImageInfoProgressWatcherReceivedArguments = (params: params, thumbnailPath: thumbnailPath, imageInfo: imageInfo, progressWatcher: progressWatcher)
        DispatchQueue.main.async {
            self.sendImageParamsThumbnailPathImageInfoProgressWatcherReceivedInvocations.append((params: params, thumbnailPath: thumbnailPath, imageInfo: imageInfo, progressWatcher: progressWatcher))
        }
        if let sendImageParamsThumbnailPathImageInfoProgressWatcherClosure = sendImageParamsThumbnailPathImageInfoProgressWatcherClosure {
            return try sendImageParamsThumbnailPathImageInfoProgressWatcherClosure(params, thumbnailPath, imageInfo, progressWatcher)
        } else {
            return sendImageParamsThumbnailPathImageInfoProgressWatcherReturnValue
        }
    }

    //MARK: - sendLocation

    open var sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsThrowableError: Error?
    var sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsUnderlyingCallsCount = 0
    open var sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsCalled: Bool {
        return sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsCallsCount > 0
    }
    open var sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsReceivedArguments: (body: String, geoUri: String, description: String?, zoomLevel: UInt8?, assetType: AssetType?, replyParams: ReplyParameters?)?
    open var sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsReceivedInvocations: [(body: String, geoUri: String, description: String?, zoomLevel: UInt8?, assetType: AssetType?, replyParams: ReplyParameters?)] = []
    open var sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsClosure: ((String, String, String?, UInt8?, AssetType?, ReplyParameters?) async throws -> Void)?

    open override func sendLocation(body: String, geoUri: String, description: String?, zoomLevel: UInt8?, assetType: AssetType?, replyParams: ReplyParameters?) async throws {
        if let error = sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsThrowableError {
            throw error
        }
        sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsCallsCount += 1
        sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsReceivedArguments = (body: body, geoUri: geoUri, description: description, zoomLevel: zoomLevel, assetType: assetType, replyParams: replyParams)
        DispatchQueue.main.async {
            self.sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsReceivedInvocations.append((body: body, geoUri: geoUri, description: description, zoomLevel: zoomLevel, assetType: assetType, replyParams: replyParams))
        }
        try await sendLocationBodyGeoUriDescriptionZoomLevelAssetTypeReplyParamsClosure?(body, geoUri, description, zoomLevel, assetType, replyParams)
    }

    //MARK: - sendPollResponse

    open var sendPollResponsePollStartEventIdAnswersThrowableError: Error?
    var sendPollResponsePollStartEventIdAnswersUnderlyingCallsCount = 0
    open var sendPollResponsePollStartEventIdAnswersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendPollResponsePollStartEventIdAnswersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendPollResponsePollStartEventIdAnswersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendPollResponsePollStartEventIdAnswersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendPollResponsePollStartEventIdAnswersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendPollResponsePollStartEventIdAnswersCalled: Bool {
        return sendPollResponsePollStartEventIdAnswersCallsCount > 0
    }
    open var sendPollResponsePollStartEventIdAnswersReceivedArguments: (pollStartEventId: String, answers: [String])?
    open var sendPollResponsePollStartEventIdAnswersReceivedInvocations: [(pollStartEventId: String, answers: [String])] = []
    open var sendPollResponsePollStartEventIdAnswersClosure: ((String, [String]) async throws -> Void)?

    open override func sendPollResponse(pollStartEventId: String, answers: [String]) async throws {
        if let error = sendPollResponsePollStartEventIdAnswersThrowableError {
            throw error
        }
        sendPollResponsePollStartEventIdAnswersCallsCount += 1
        sendPollResponsePollStartEventIdAnswersReceivedArguments = (pollStartEventId: pollStartEventId, answers: answers)
        DispatchQueue.main.async {
            self.sendPollResponsePollStartEventIdAnswersReceivedInvocations.append((pollStartEventId: pollStartEventId, answers: answers))
        }
        try await sendPollResponsePollStartEventIdAnswersClosure?(pollStartEventId, answers)
    }

    //MARK: - sendReadReceipt

    open var sendReadReceiptReceiptTypeEventIdThrowableError: Error?
    var sendReadReceiptReceiptTypeEventIdUnderlyingCallsCount = 0
    open var sendReadReceiptReceiptTypeEventIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendReadReceiptReceiptTypeEventIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendReadReceiptReceiptTypeEventIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendReadReceiptReceiptTypeEventIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendReadReceiptReceiptTypeEventIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendReadReceiptReceiptTypeEventIdCalled: Bool {
        return sendReadReceiptReceiptTypeEventIdCallsCount > 0
    }
    open var sendReadReceiptReceiptTypeEventIdReceivedArguments: (receiptType: ReceiptType, eventId: String)?
    open var sendReadReceiptReceiptTypeEventIdReceivedInvocations: [(receiptType: ReceiptType, eventId: String)] = []
    open var sendReadReceiptReceiptTypeEventIdClosure: ((ReceiptType, String) async throws -> Void)?

    open override func sendReadReceipt(receiptType: ReceiptType, eventId: String) async throws {
        if let error = sendReadReceiptReceiptTypeEventIdThrowableError {
            throw error
        }
        sendReadReceiptReceiptTypeEventIdCallsCount += 1
        sendReadReceiptReceiptTypeEventIdReceivedArguments = (receiptType: receiptType, eventId: eventId)
        DispatchQueue.main.async {
            self.sendReadReceiptReceiptTypeEventIdReceivedInvocations.append((receiptType: receiptType, eventId: eventId))
        }
        try await sendReadReceiptReceiptTypeEventIdClosure?(receiptType, eventId)
    }

    //MARK: - sendReply

    open var sendReplyMsgReplyParamsThrowableError: Error?
    var sendReplyMsgReplyParamsUnderlyingCallsCount = 0
    open var sendReplyMsgReplyParamsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendReplyMsgReplyParamsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendReplyMsgReplyParamsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendReplyMsgReplyParamsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendReplyMsgReplyParamsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendReplyMsgReplyParamsCalled: Bool {
        return sendReplyMsgReplyParamsCallsCount > 0
    }
    open var sendReplyMsgReplyParamsReceivedArguments: (msg: RoomMessageEventContentWithoutRelation, replyParams: ReplyParameters)?
    open var sendReplyMsgReplyParamsReceivedInvocations: [(msg: RoomMessageEventContentWithoutRelation, replyParams: ReplyParameters)] = []
    open var sendReplyMsgReplyParamsClosure: ((RoomMessageEventContentWithoutRelation, ReplyParameters) async throws -> Void)?

    open override func sendReply(msg: RoomMessageEventContentWithoutRelation, replyParams: ReplyParameters) async throws {
        if let error = sendReplyMsgReplyParamsThrowableError {
            throw error
        }
        sendReplyMsgReplyParamsCallsCount += 1
        sendReplyMsgReplyParamsReceivedArguments = (msg: msg, replyParams: replyParams)
        DispatchQueue.main.async {
            self.sendReplyMsgReplyParamsReceivedInvocations.append((msg: msg, replyParams: replyParams))
        }
        try await sendReplyMsgReplyParamsClosure?(msg, replyParams)
    }

    //MARK: - sendVideo

    open var sendVideoParamsThumbnailPathVideoInfoProgressWatcherThrowableError: Error?
    var sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingCallsCount = 0
    open var sendVideoParamsThumbnailPathVideoInfoProgressWatcherCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendVideoParamsThumbnailPathVideoInfoProgressWatcherCalled: Bool {
        return sendVideoParamsThumbnailPathVideoInfoProgressWatcherCallsCount > 0
    }
    open var sendVideoParamsThumbnailPathVideoInfoProgressWatcherReceivedArguments: (params: UploadParameters, thumbnailPath: String?, videoInfo: VideoInfo, progressWatcher: ProgressWatcher?)?
    open var sendVideoParamsThumbnailPathVideoInfoProgressWatcherReceivedInvocations: [(params: UploadParameters, thumbnailPath: String?, videoInfo: VideoInfo, progressWatcher: ProgressWatcher?)] = []

    var sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingReturnValue: SendAttachmentJoinHandle!
    open var sendVideoParamsThumbnailPathVideoInfoProgressWatcherReturnValue: SendAttachmentJoinHandle! {
        get {
            if Thread.isMainThread {
                return sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingReturnValue
            } else {
                var returnValue: SendAttachmentJoinHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVideoParamsThumbnailPathVideoInfoProgressWatcherUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sendVideoParamsThumbnailPathVideoInfoProgressWatcherClosure: ((UploadParameters, String?, VideoInfo, ProgressWatcher?) throws -> SendAttachmentJoinHandle)?

    open override func sendVideo(params: UploadParameters, thumbnailPath: String?, videoInfo: VideoInfo, progressWatcher: ProgressWatcher?) throws -> SendAttachmentJoinHandle {
        if let error = sendVideoParamsThumbnailPathVideoInfoProgressWatcherThrowableError {
            throw error
        }
        sendVideoParamsThumbnailPathVideoInfoProgressWatcherCallsCount += 1
        sendVideoParamsThumbnailPathVideoInfoProgressWatcherReceivedArguments = (params: params, thumbnailPath: thumbnailPath, videoInfo: videoInfo, progressWatcher: progressWatcher)
        DispatchQueue.main.async {
            self.sendVideoParamsThumbnailPathVideoInfoProgressWatcherReceivedInvocations.append((params: params, thumbnailPath: thumbnailPath, videoInfo: videoInfo, progressWatcher: progressWatcher))
        }
        if let sendVideoParamsThumbnailPathVideoInfoProgressWatcherClosure = sendVideoParamsThumbnailPathVideoInfoProgressWatcherClosure {
            return try sendVideoParamsThumbnailPathVideoInfoProgressWatcherClosure(params, thumbnailPath, videoInfo, progressWatcher)
        } else {
            return sendVideoParamsThumbnailPathVideoInfoProgressWatcherReturnValue
        }
    }

    //MARK: - sendVoiceMessage

    open var sendVoiceMessageParamsAudioInfoWaveformProgressWatcherThrowableError: Error?
    var sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingCallsCount = 0
    open var sendVoiceMessageParamsAudioInfoWaveformProgressWatcherCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendVoiceMessageParamsAudioInfoWaveformProgressWatcherCalled: Bool {
        return sendVoiceMessageParamsAudioInfoWaveformProgressWatcherCallsCount > 0
    }
    open var sendVoiceMessageParamsAudioInfoWaveformProgressWatcherReceivedArguments: (params: UploadParameters, audioInfo: AudioInfo, waveform: [UInt16], progressWatcher: ProgressWatcher?)?
    open var sendVoiceMessageParamsAudioInfoWaveformProgressWatcherReceivedInvocations: [(params: UploadParameters, audioInfo: AudioInfo, waveform: [UInt16], progressWatcher: ProgressWatcher?)] = []

    var sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingReturnValue: SendAttachmentJoinHandle!
    open var sendVoiceMessageParamsAudioInfoWaveformProgressWatcherReturnValue: SendAttachmentJoinHandle! {
        get {
            if Thread.isMainThread {
                return sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingReturnValue
            } else {
                var returnValue: SendAttachmentJoinHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVoiceMessageParamsAudioInfoWaveformProgressWatcherUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sendVoiceMessageParamsAudioInfoWaveformProgressWatcherClosure: ((UploadParameters, AudioInfo, [UInt16], ProgressWatcher?) throws -> SendAttachmentJoinHandle)?

    open override func sendVoiceMessage(params: UploadParameters, audioInfo: AudioInfo, waveform: [UInt16], progressWatcher: ProgressWatcher?) throws -> SendAttachmentJoinHandle {
        if let error = sendVoiceMessageParamsAudioInfoWaveformProgressWatcherThrowableError {
            throw error
        }
        sendVoiceMessageParamsAudioInfoWaveformProgressWatcherCallsCount += 1
        sendVoiceMessageParamsAudioInfoWaveformProgressWatcherReceivedArguments = (params: params, audioInfo: audioInfo, waveform: waveform, progressWatcher: progressWatcher)
        DispatchQueue.main.async {
            self.sendVoiceMessageParamsAudioInfoWaveformProgressWatcherReceivedInvocations.append((params: params, audioInfo: audioInfo, waveform: waveform, progressWatcher: progressWatcher))
        }
        if let sendVoiceMessageParamsAudioInfoWaveformProgressWatcherClosure = sendVoiceMessageParamsAudioInfoWaveformProgressWatcherClosure {
            return try sendVoiceMessageParamsAudioInfoWaveformProgressWatcherClosure(params, audioInfo, waveform, progressWatcher)
        } else {
            return sendVoiceMessageParamsAudioInfoWaveformProgressWatcherReturnValue
        }
    }

    //MARK: - subscribeToBackPaginationStatus

    open var subscribeToBackPaginationStatusListenerThrowableError: Error?
    var subscribeToBackPaginationStatusListenerUnderlyingCallsCount = 0
    open var subscribeToBackPaginationStatusListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeToBackPaginationStatusListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToBackPaginationStatusListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToBackPaginationStatusListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToBackPaginationStatusListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var subscribeToBackPaginationStatusListenerCalled: Bool {
        return subscribeToBackPaginationStatusListenerCallsCount > 0
    }
    open var subscribeToBackPaginationStatusListenerReceivedListener: PaginationStatusListener?
    open var subscribeToBackPaginationStatusListenerReceivedInvocations: [PaginationStatusListener] = []

    var subscribeToBackPaginationStatusListenerUnderlyingReturnValue: TaskHandle!
    open var subscribeToBackPaginationStatusListenerReturnValue: TaskHandle! {
        get {
            if Thread.isMainThread {
                return subscribeToBackPaginationStatusListenerUnderlyingReturnValue
            } else {
                var returnValue: TaskHandle? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeToBackPaginationStatusListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeToBackPaginationStatusListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeToBackPaginationStatusListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var subscribeToBackPaginationStatusListenerClosure: ((PaginationStatusListener) async throws -> TaskHandle)?

    open override func subscribeToBackPaginationStatus(listener: PaginationStatusListener) async throws -> TaskHandle {
        if let error = subscribeToBackPaginationStatusListenerThrowableError {
            throw error
        }
        subscribeToBackPaginationStatusListenerCallsCount += 1
        subscribeToBackPaginationStatusListenerReceivedListener = listener
        DispatchQueue.main.async {
            self.subscribeToBackPaginationStatusListenerReceivedInvocations.append(listener)
        }
        if let subscribeToBackPaginationStatusListenerClosure = subscribeToBackPaginationStatusListenerClosure {
            return try await subscribeToBackPaginationStatusListenerClosure(listener)
        } else {
            return subscribeToBackPaginationStatusListenerReturnValue
        }
    }

    //MARK: - toggleReaction

    open var toggleReactionItemIdKeyThrowableError: Error?
    var toggleReactionItemIdKeyUnderlyingCallsCount = 0
    open var toggleReactionItemIdKeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return toggleReactionItemIdKeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = toggleReactionItemIdKeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                toggleReactionItemIdKeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    toggleReactionItemIdKeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var toggleReactionItemIdKeyCalled: Bool {
        return toggleReactionItemIdKeyCallsCount > 0
    }
    open var toggleReactionItemIdKeyReceivedArguments: (itemId: EventOrTransactionId, key: String)?
    open var toggleReactionItemIdKeyReceivedInvocations: [(itemId: EventOrTransactionId, key: String)] = []
    open var toggleReactionItemIdKeyClosure: ((EventOrTransactionId, String) async throws -> Void)?

    open override func toggleReaction(itemId: EventOrTransactionId, key: String) async throws {
        if let error = toggleReactionItemIdKeyThrowableError {
            throw error
        }
        toggleReactionItemIdKeyCallsCount += 1
        toggleReactionItemIdKeyReceivedArguments = (itemId: itemId, key: key)
        DispatchQueue.main.async {
            self.toggleReactionItemIdKeyReceivedInvocations.append((itemId: itemId, key: key))
        }
        try await toggleReactionItemIdKeyClosure?(itemId, key)
    }

    //MARK: - unpinEvent

    open var unpinEventEventIdThrowableError: Error?
    var unpinEventEventIdUnderlyingCallsCount = 0
    open var unpinEventEventIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unpinEventEventIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unpinEventEventIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unpinEventEventIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unpinEventEventIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var unpinEventEventIdCalled: Bool {
        return unpinEventEventIdCallsCount > 0
    }
    open var unpinEventEventIdReceivedEventId: String?
    open var unpinEventEventIdReceivedInvocations: [String] = []

    var unpinEventEventIdUnderlyingReturnValue: Bool!
    open var unpinEventEventIdReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return unpinEventEventIdUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = unpinEventEventIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unpinEventEventIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    unpinEventEventIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var unpinEventEventIdClosure: ((String) async throws -> Bool)?

    open override func unpinEvent(eventId: String) async throws -> Bool {
        if let error = unpinEventEventIdThrowableError {
            throw error
        }
        unpinEventEventIdCallsCount += 1
        unpinEventEventIdReceivedEventId = eventId
        DispatchQueue.main.async {
            self.unpinEventEventIdReceivedInvocations.append(eventId)
        }
        if let unpinEventEventIdClosure = unpinEventEventIdClosure {
            return try await unpinEventEventIdClosure(eventId)
        } else {
            return unpinEventEventIdReturnValue
        }
    }
}
open class TimelineDiffSDKMock: MatrixRustSDK.TimelineDiff, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - append

    var appendUnderlyingCallsCount = 0
    open var appendCallsCount: Int {
        get {
            if Thread.isMainThread {
                return appendUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = appendUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                appendUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    appendUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var appendCalled: Bool {
        return appendCallsCount > 0
    }

    var appendUnderlyingReturnValue: [TimelineItem]?
    open var appendReturnValue: [TimelineItem]? {
        get {
            if Thread.isMainThread {
                return appendUnderlyingReturnValue
            } else {
                var returnValue: [TimelineItem]?? = nil
                DispatchQueue.main.sync {
                    returnValue = appendUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                appendUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    appendUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var appendClosure: (() -> [TimelineItem]?)?

    open override func append() -> [TimelineItem]? {
        appendCallsCount += 1
        if let appendClosure = appendClosure {
            return appendClosure()
        } else {
            return appendReturnValue
        }
    }

    //MARK: - change

    var changeUnderlyingCallsCount = 0
    open var changeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return changeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = changeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                changeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    changeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var changeCalled: Bool {
        return changeCallsCount > 0
    }

    var changeUnderlyingReturnValue: TimelineChange!
    open var changeReturnValue: TimelineChange! {
        get {
            if Thread.isMainThread {
                return changeUnderlyingReturnValue
            } else {
                var returnValue: TimelineChange? = nil
                DispatchQueue.main.sync {
                    returnValue = changeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                changeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    changeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var changeClosure: (() -> TimelineChange)?

    open override func change() -> TimelineChange {
        changeCallsCount += 1
        if let changeClosure = changeClosure {
            return changeClosure()
        } else {
            return changeReturnValue
        }
    }

    //MARK: - insert

    var insertUnderlyingCallsCount = 0
    open var insertCallsCount: Int {
        get {
            if Thread.isMainThread {
                return insertUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = insertUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                insertUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    insertUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var insertCalled: Bool {
        return insertCallsCount > 0
    }

    var insertUnderlyingReturnValue: InsertData?
    open var insertReturnValue: InsertData? {
        get {
            if Thread.isMainThread {
                return insertUnderlyingReturnValue
            } else {
                var returnValue: InsertData?? = nil
                DispatchQueue.main.sync {
                    returnValue = insertUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                insertUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    insertUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var insertClosure: (() -> InsertData?)?

    open override func insert() -> InsertData? {
        insertCallsCount += 1
        if let insertClosure = insertClosure {
            return insertClosure()
        } else {
            return insertReturnValue
        }
    }

    //MARK: - pushBack

    var pushBackUnderlyingCallsCount = 0
    open var pushBackCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pushBackUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pushBackUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pushBackUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pushBackUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var pushBackCalled: Bool {
        return pushBackCallsCount > 0
    }

    var pushBackUnderlyingReturnValue: TimelineItem?
    open var pushBackReturnValue: TimelineItem? {
        get {
            if Thread.isMainThread {
                return pushBackUnderlyingReturnValue
            } else {
                var returnValue: TimelineItem?? = nil
                DispatchQueue.main.sync {
                    returnValue = pushBackUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pushBackUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    pushBackUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var pushBackClosure: (() -> TimelineItem?)?

    open override func pushBack() -> TimelineItem? {
        pushBackCallsCount += 1
        if let pushBackClosure = pushBackClosure {
            return pushBackClosure()
        } else {
            return pushBackReturnValue
        }
    }

    //MARK: - pushFront

    var pushFrontUnderlyingCallsCount = 0
    open var pushFrontCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pushFrontUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pushFrontUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pushFrontUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pushFrontUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var pushFrontCalled: Bool {
        return pushFrontCallsCount > 0
    }

    var pushFrontUnderlyingReturnValue: TimelineItem?
    open var pushFrontReturnValue: TimelineItem? {
        get {
            if Thread.isMainThread {
                return pushFrontUnderlyingReturnValue
            } else {
                var returnValue: TimelineItem?? = nil
                DispatchQueue.main.sync {
                    returnValue = pushFrontUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pushFrontUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    pushFrontUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var pushFrontClosure: (() -> TimelineItem?)?

    open override func pushFront() -> TimelineItem? {
        pushFrontCallsCount += 1
        if let pushFrontClosure = pushFrontClosure {
            return pushFrontClosure()
        } else {
            return pushFrontReturnValue
        }
    }

    //MARK: - remove

    var removeUnderlyingCallsCount = 0
    open var removeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var removeCalled: Bool {
        return removeCallsCount > 0
    }

    var removeUnderlyingReturnValue: UInt32?
    open var removeReturnValue: UInt32? {
        get {
            if Thread.isMainThread {
                return removeUnderlyingReturnValue
            } else {
                var returnValue: UInt32?? = nil
                DispatchQueue.main.sync {
                    returnValue = removeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    removeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var removeClosure: (() -> UInt32?)?

    open override func remove() -> UInt32? {
        removeCallsCount += 1
        if let removeClosure = removeClosure {
            return removeClosure()
        } else {
            return removeReturnValue
        }
    }

    //MARK: - reset

    var resetUnderlyingCallsCount = 0
    open var resetCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var resetCalled: Bool {
        return resetCallsCount > 0
    }

    var resetUnderlyingReturnValue: [TimelineItem]?
    open var resetReturnValue: [TimelineItem]? {
        get {
            if Thread.isMainThread {
                return resetUnderlyingReturnValue
            } else {
                var returnValue: [TimelineItem]?? = nil
                DispatchQueue.main.sync {
                    returnValue = resetUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    resetUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var resetClosure: (() -> [TimelineItem]?)?

    open override func reset() -> [TimelineItem]? {
        resetCallsCount += 1
        if let resetClosure = resetClosure {
            return resetClosure()
        } else {
            return resetReturnValue
        }
    }

    //MARK: - set

    var setUnderlyingCallsCount = 0
    open var setCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var setCalled: Bool {
        return setCallsCount > 0
    }

    var setUnderlyingReturnValue: SetData?
    open var setReturnValue: SetData? {
        get {
            if Thread.isMainThread {
                return setUnderlyingReturnValue
            } else {
                var returnValue: SetData?? = nil
                DispatchQueue.main.sync {
                    returnValue = setUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    setUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var setClosure: (() -> SetData?)?

    open override func set() -> SetData? {
        setCallsCount += 1
        if let setClosure = setClosure {
            return setClosure()
        } else {
            return setReturnValue
        }
    }

    //MARK: - truncate

    var truncateUnderlyingCallsCount = 0
    open var truncateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return truncateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = truncateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                truncateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    truncateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var truncateCalled: Bool {
        return truncateCallsCount > 0
    }

    var truncateUnderlyingReturnValue: UInt32?
    open var truncateReturnValue: UInt32? {
        get {
            if Thread.isMainThread {
                return truncateUnderlyingReturnValue
            } else {
                var returnValue: UInt32?? = nil
                DispatchQueue.main.sync {
                    returnValue = truncateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                truncateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    truncateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var truncateClosure: (() -> UInt32?)?

    open override func truncate() -> UInt32? {
        truncateCallsCount += 1
        if let truncateClosure = truncateClosure {
            return truncateClosure()
        } else {
            return truncateReturnValue
        }
    }
}
open class TimelineEventSDKMock: MatrixRustSDK.TimelineEvent, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - eventId

    var eventIdUnderlyingCallsCount = 0
    open var eventIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return eventIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = eventIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                eventIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    eventIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var eventIdCalled: Bool {
        return eventIdCallsCount > 0
    }

    var eventIdUnderlyingReturnValue: String!
    open var eventIdReturnValue: String! {
        get {
            if Thread.isMainThread {
                return eventIdUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = eventIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                eventIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    eventIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var eventIdClosure: (() -> String)?

    open override func eventId() -> String {
        eventIdCallsCount += 1
        if let eventIdClosure = eventIdClosure {
            return eventIdClosure()
        } else {
            return eventIdReturnValue
        }
    }

    //MARK: - eventType

    open var eventTypeThrowableError: Error?
    var eventTypeUnderlyingCallsCount = 0
    open var eventTypeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return eventTypeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = eventTypeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                eventTypeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    eventTypeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var eventTypeCalled: Bool {
        return eventTypeCallsCount > 0
    }

    var eventTypeUnderlyingReturnValue: TimelineEventType!
    open var eventTypeReturnValue: TimelineEventType! {
        get {
            if Thread.isMainThread {
                return eventTypeUnderlyingReturnValue
            } else {
                var returnValue: TimelineEventType? = nil
                DispatchQueue.main.sync {
                    returnValue = eventTypeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                eventTypeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    eventTypeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var eventTypeClosure: (() throws -> TimelineEventType)?

    open override func eventType() throws -> TimelineEventType {
        if let error = eventTypeThrowableError {
            throw error
        }
        eventTypeCallsCount += 1
        if let eventTypeClosure = eventTypeClosure {
            return try eventTypeClosure()
        } else {
            return eventTypeReturnValue
        }
    }

    //MARK: - senderId

    var senderIdUnderlyingCallsCount = 0
    open var senderIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return senderIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = senderIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                senderIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    senderIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var senderIdCalled: Bool {
        return senderIdCallsCount > 0
    }

    var senderIdUnderlyingReturnValue: String!
    open var senderIdReturnValue: String! {
        get {
            if Thread.isMainThread {
                return senderIdUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = senderIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                senderIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    senderIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var senderIdClosure: (() -> String)?

    open override func senderId() -> String {
        senderIdCallsCount += 1
        if let senderIdClosure = senderIdClosure {
            return senderIdClosure()
        } else {
            return senderIdReturnValue
        }
    }

    //MARK: - timestamp

    var timestampUnderlyingCallsCount = 0
    open var timestampCallsCount: Int {
        get {
            if Thread.isMainThread {
                return timestampUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = timestampUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                timestampUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    timestampUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var timestampCalled: Bool {
        return timestampCallsCount > 0
    }

    var timestampUnderlyingReturnValue: Timestamp!
    open var timestampReturnValue: Timestamp! {
        get {
            if Thread.isMainThread {
                return timestampUnderlyingReturnValue
            } else {
                var returnValue: Timestamp? = nil
                DispatchQueue.main.sync {
                    returnValue = timestampUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                timestampUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    timestampUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var timestampClosure: (() -> Timestamp)?

    open override func timestamp() -> Timestamp {
        timestampCallsCount += 1
        if let timestampClosure = timestampClosure {
            return timestampClosure()
        } else {
            return timestampReturnValue
        }
    }
}
open class TimelineEventTypeFilterSDKMock: MatrixRustSDK.TimelineEventTypeFilter, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!
    static func reset()
    {
    }
}
open class TimelineItemSDKMock: MatrixRustSDK.TimelineItem, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - asEvent

    var asEventUnderlyingCallsCount = 0
    open var asEventCallsCount: Int {
        get {
            if Thread.isMainThread {
                return asEventUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = asEventUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                asEventUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    asEventUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var asEventCalled: Bool {
        return asEventCallsCount > 0
    }

    var asEventUnderlyingReturnValue: EventTimelineItem?
    open var asEventReturnValue: EventTimelineItem? {
        get {
            if Thread.isMainThread {
                return asEventUnderlyingReturnValue
            } else {
                var returnValue: EventTimelineItem?? = nil
                DispatchQueue.main.sync {
                    returnValue = asEventUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                asEventUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    asEventUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var asEventClosure: (() -> EventTimelineItem?)?

    open override func asEvent() -> EventTimelineItem? {
        asEventCallsCount += 1
        if let asEventClosure = asEventClosure {
            return asEventClosure()
        } else {
            return asEventReturnValue
        }
    }

    //MARK: - asVirtual

    var asVirtualUnderlyingCallsCount = 0
    open var asVirtualCallsCount: Int {
        get {
            if Thread.isMainThread {
                return asVirtualUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = asVirtualUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                asVirtualUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    asVirtualUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var asVirtualCalled: Bool {
        return asVirtualCallsCount > 0
    }

    var asVirtualUnderlyingReturnValue: VirtualTimelineItem?
    open var asVirtualReturnValue: VirtualTimelineItem? {
        get {
            if Thread.isMainThread {
                return asVirtualUnderlyingReturnValue
            } else {
                var returnValue: VirtualTimelineItem?? = nil
                DispatchQueue.main.sync {
                    returnValue = asVirtualUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                asVirtualUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    asVirtualUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var asVirtualClosure: (() -> VirtualTimelineItem?)?

    open override func asVirtual() -> VirtualTimelineItem? {
        asVirtualCallsCount += 1
        if let asVirtualClosure = asVirtualClosure {
            return asVirtualClosure()
        } else {
            return asVirtualReturnValue
        }
    }

    //MARK: - fmtDebug

    var fmtDebugUnderlyingCallsCount = 0
    open var fmtDebugCallsCount: Int {
        get {
            if Thread.isMainThread {
                return fmtDebugUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = fmtDebugUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                fmtDebugUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    fmtDebugUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var fmtDebugCalled: Bool {
        return fmtDebugCallsCount > 0
    }

    var fmtDebugUnderlyingReturnValue: String!
    open var fmtDebugReturnValue: String! {
        get {
            if Thread.isMainThread {
                return fmtDebugUnderlyingReturnValue
            } else {
                var returnValue: String? = nil
                DispatchQueue.main.sync {
                    returnValue = fmtDebugUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                fmtDebugUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    fmtDebugUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var fmtDebugClosure: (() -> String)?

    open override func fmtDebug() -> String {
        fmtDebugCallsCount += 1
        if let fmtDebugClosure = fmtDebugClosure {
            return fmtDebugClosure()
        } else {
            return fmtDebugReturnValue
        }
    }

    //MARK: - uniqueId

    var uniqueIdUnderlyingCallsCount = 0
    open var uniqueIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return uniqueIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = uniqueIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uniqueIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    uniqueIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var uniqueIdCalled: Bool {
        return uniqueIdCallsCount > 0
    }

    var uniqueIdUnderlyingReturnValue: TimelineUniqueId!
    open var uniqueIdReturnValue: TimelineUniqueId! {
        get {
            if Thread.isMainThread {
                return uniqueIdUnderlyingReturnValue
            } else {
                var returnValue: TimelineUniqueId? = nil
                DispatchQueue.main.sync {
                    returnValue = uniqueIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uniqueIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    uniqueIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var uniqueIdClosure: (() -> TimelineUniqueId)?

    open override func uniqueId() -> TimelineUniqueId {
        uniqueIdCallsCount += 1
        if let uniqueIdClosure = uniqueIdClosure {
            return uniqueIdClosure()
        } else {
            return uniqueIdReturnValue
        }
    }
}
open class UnreadNotificationsCountSDKMock: MatrixRustSDK.UnreadNotificationsCount, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - hasNotifications

    var hasNotificationsUnderlyingCallsCount = 0
    open var hasNotificationsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return hasNotificationsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = hasNotificationsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                hasNotificationsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    hasNotificationsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var hasNotificationsCalled: Bool {
        return hasNotificationsCallsCount > 0
    }

    var hasNotificationsUnderlyingReturnValue: Bool!
    open var hasNotificationsReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return hasNotificationsUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = hasNotificationsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                hasNotificationsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    hasNotificationsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var hasNotificationsClosure: (() -> Bool)?

    open override func hasNotifications() -> Bool {
        hasNotificationsCallsCount += 1
        if let hasNotificationsClosure = hasNotificationsClosure {
            return hasNotificationsClosure()
        } else {
            return hasNotificationsReturnValue
        }
    }

    //MARK: - highlightCount

    var highlightCountUnderlyingCallsCount = 0
    open var highlightCountCallsCount: Int {
        get {
            if Thread.isMainThread {
                return highlightCountUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = highlightCountUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                highlightCountUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    highlightCountUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var highlightCountCalled: Bool {
        return highlightCountCallsCount > 0
    }

    var highlightCountUnderlyingReturnValue: UInt32!
    open var highlightCountReturnValue: UInt32! {
        get {
            if Thread.isMainThread {
                return highlightCountUnderlyingReturnValue
            } else {
                var returnValue: UInt32? = nil
                DispatchQueue.main.sync {
                    returnValue = highlightCountUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                highlightCountUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    highlightCountUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var highlightCountClosure: (() -> UInt32)?

    open override func highlightCount() -> UInt32 {
        highlightCountCallsCount += 1
        if let highlightCountClosure = highlightCountClosure {
            return highlightCountClosure()
        } else {
            return highlightCountReturnValue
        }
    }

    //MARK: - notificationCount

    var notificationCountUnderlyingCallsCount = 0
    open var notificationCountCallsCount: Int {
        get {
            if Thread.isMainThread {
                return notificationCountUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = notificationCountUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                notificationCountUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    notificationCountUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var notificationCountCalled: Bool {
        return notificationCountCallsCount > 0
    }

    var notificationCountUnderlyingReturnValue: UInt32!
    open var notificationCountReturnValue: UInt32! {
        get {
            if Thread.isMainThread {
                return notificationCountUnderlyingReturnValue
            } else {
                var returnValue: UInt32? = nil
                DispatchQueue.main.sync {
                    returnValue = notificationCountUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                notificationCountUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    notificationCountUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var notificationCountClosure: (() -> UInt32)?

    open override func notificationCount() -> UInt32 {
        notificationCountCallsCount += 1
        if let notificationCountClosure = notificationCountClosure {
            return notificationCountClosure()
        } else {
            return notificationCountReturnValue
        }
    }
}
open class UserIdentitySDKMock: MatrixRustSDK.UserIdentity, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - hasVerificationViolation

    var hasVerificationViolationUnderlyingCallsCount = 0
    open var hasVerificationViolationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return hasVerificationViolationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = hasVerificationViolationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                hasVerificationViolationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    hasVerificationViolationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var hasVerificationViolationCalled: Bool {
        return hasVerificationViolationCallsCount > 0
    }

    var hasVerificationViolationUnderlyingReturnValue: Bool!
    open var hasVerificationViolationReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return hasVerificationViolationUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = hasVerificationViolationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                hasVerificationViolationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    hasVerificationViolationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var hasVerificationViolationClosure: (() -> Bool)?

    open override func hasVerificationViolation() -> Bool {
        hasVerificationViolationCallsCount += 1
        if let hasVerificationViolationClosure = hasVerificationViolationClosure {
            return hasVerificationViolationClosure()
        } else {
            return hasVerificationViolationReturnValue
        }
    }

    //MARK: - isVerified

    var isVerifiedUnderlyingCallsCount = 0
    open var isVerifiedCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isVerifiedUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isVerifiedUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isVerifiedUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isVerifiedUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var isVerifiedCalled: Bool {
        return isVerifiedCallsCount > 0
    }

    var isVerifiedUnderlyingReturnValue: Bool!
    open var isVerifiedReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isVerifiedUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isVerifiedUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isVerifiedUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isVerifiedUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var isVerifiedClosure: (() -> Bool)?

    open override func isVerified() -> Bool {
        isVerifiedCallsCount += 1
        if let isVerifiedClosure = isVerifiedClosure {
            return isVerifiedClosure()
        } else {
            return isVerifiedReturnValue
        }
    }

    //MARK: - masterKey

    var masterKeyUnderlyingCallsCount = 0
    open var masterKeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return masterKeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = masterKeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                masterKeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    masterKeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var masterKeyCalled: Bool {
        return masterKeyCallsCount > 0
    }

    var masterKeyUnderlyingReturnValue: String?
    open var masterKeyReturnValue: String? {
        get {
            if Thread.isMainThread {
                return masterKeyUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = masterKeyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                masterKeyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    masterKeyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var masterKeyClosure: (() -> String?)?

    open override func masterKey() -> String? {
        masterKeyCallsCount += 1
        if let masterKeyClosure = masterKeyClosure {
            return masterKeyClosure()
        } else {
            return masterKeyReturnValue
        }
    }

    //MARK: - pin

    open var pinThrowableError: Error?
    var pinUnderlyingCallsCount = 0
    open var pinCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pinUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pinUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pinUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pinUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var pinCalled: Bool {
        return pinCallsCount > 0
    }
    open var pinClosure: (() async throws -> Void)?

    open override func pin() async throws {
        if let error = pinThrowableError {
            throw error
        }
        pinCallsCount += 1
        try await pinClosure?()
    }

    //MARK: - wasPreviouslyVerified

    var wasPreviouslyVerifiedUnderlyingCallsCount = 0
    open var wasPreviouslyVerifiedCallsCount: Int {
        get {
            if Thread.isMainThread {
                return wasPreviouslyVerifiedUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = wasPreviouslyVerifiedUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                wasPreviouslyVerifiedUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    wasPreviouslyVerifiedUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var wasPreviouslyVerifiedCalled: Bool {
        return wasPreviouslyVerifiedCallsCount > 0
    }

    var wasPreviouslyVerifiedUnderlyingReturnValue: Bool!
    open var wasPreviouslyVerifiedReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return wasPreviouslyVerifiedUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = wasPreviouslyVerifiedUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                wasPreviouslyVerifiedUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    wasPreviouslyVerifiedUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var wasPreviouslyVerifiedClosure: (() -> Bool)?

    open override func wasPreviouslyVerified() -> Bool {
        wasPreviouslyVerifiedCallsCount += 1
        if let wasPreviouslyVerifiedClosure = wasPreviouslyVerifiedClosure {
            return wasPreviouslyVerifiedClosure()
        } else {
            return wasPreviouslyVerifiedReturnValue
        }
    }

    //MARK: - withdrawVerification

    open var withdrawVerificationThrowableError: Error?
    var withdrawVerificationUnderlyingCallsCount = 0
    open var withdrawVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return withdrawVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = withdrawVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                withdrawVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    withdrawVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var withdrawVerificationCalled: Bool {
        return withdrawVerificationCallsCount > 0
    }
    open var withdrawVerificationClosure: (() async throws -> Void)?

    open override func withdrawVerification() async throws {
        if let error = withdrawVerificationThrowableError {
            throw error
        }
        withdrawVerificationCallsCount += 1
        try await withdrawVerificationClosure?()
    }
}
open class WidgetDriverSDKMock: MatrixRustSDK.WidgetDriver, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - run

    var runRoomCapabilitiesProviderUnderlyingCallsCount = 0
    open var runRoomCapabilitiesProviderCallsCount: Int {
        get {
            if Thread.isMainThread {
                return runRoomCapabilitiesProviderUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = runRoomCapabilitiesProviderUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                runRoomCapabilitiesProviderUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    runRoomCapabilitiesProviderUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var runRoomCapabilitiesProviderCalled: Bool {
        return runRoomCapabilitiesProviderCallsCount > 0
    }
    open var runRoomCapabilitiesProviderReceivedArguments: (room: Room, capabilitiesProvider: WidgetCapabilitiesProvider)?
    open var runRoomCapabilitiesProviderReceivedInvocations: [(room: Room, capabilitiesProvider: WidgetCapabilitiesProvider)] = []
    open var runRoomCapabilitiesProviderClosure: ((Room, WidgetCapabilitiesProvider) async -> Void)?

    open override func run(room: Room, capabilitiesProvider: WidgetCapabilitiesProvider) async {
        runRoomCapabilitiesProviderCallsCount += 1
        runRoomCapabilitiesProviderReceivedArguments = (room: room, capabilitiesProvider: capabilitiesProvider)
        DispatchQueue.main.async {
            self.runRoomCapabilitiesProviderReceivedInvocations.append((room: room, capabilitiesProvider: capabilitiesProvider))
        }
        await runRoomCapabilitiesProviderClosure?(room, capabilitiesProvider)
    }
}
open class WidgetDriverHandleSDKMock: MatrixRustSDK.WidgetDriverHandle, @unchecked Sendable {
    init() {
        super.init(noPointer: .init())
    }

    public required init(unsafeFromRawPointer pointer: UnsafeMutableRawPointer) {
        fatalError("init(unsafeFromRawPointer:) has not been implemented")
    }

    fileprivate var pointer: UnsafeMutableRawPointer!

    //MARK: - recv

    var recvUnderlyingCallsCount = 0
    open var recvCallsCount: Int {
        get {
            if Thread.isMainThread {
                return recvUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = recvUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recvUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    recvUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var recvCalled: Bool {
        return recvCallsCount > 0
    }

    var recvUnderlyingReturnValue: String?
    open var recvReturnValue: String? {
        get {
            if Thread.isMainThread {
                return recvUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = recvUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recvUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    recvUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var recvClosure: (() async -> String?)?

    open override func recv() async -> String? {
        recvCallsCount += 1
        if let recvClosure = recvClosure {
            return await recvClosure()
        } else {
            return recvReturnValue
        }
    }

    //MARK: - send

    var sendMsgUnderlyingCallsCount = 0
    open var sendMsgCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendMsgUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMsgUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMsgUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMsgUnderlyingCallsCount = newValue
                }
            }
        }
    }
    open var sendMsgCalled: Bool {
        return sendMsgCallsCount > 0
    }
    open var sendMsgReceivedMsg: String?
    open var sendMsgReceivedInvocations: [String] = []

    var sendMsgUnderlyingReturnValue: Bool!
    open var sendMsgReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return sendMsgUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMsgUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMsgUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMsgUnderlyingReturnValue = newValue
                }
            }
        }
    }
    open var sendMsgClosure: ((String) async -> Bool)?

    open override func send(msg: String) async -> Bool {
        sendMsgCallsCount += 1
        sendMsgReceivedMsg = msg
        DispatchQueue.main.async {
            self.sendMsgReceivedInvocations.append(msg)
        }
        if let sendMsgClosure = sendMsgClosure {
            return await sendMsgClosure(msg)
        } else {
            return sendMsgReturnValue
        }
    }
}
// swiftlint:enable all
