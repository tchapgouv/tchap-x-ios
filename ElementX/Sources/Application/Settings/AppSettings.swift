//
// Copyright 2025 Element Creations Ltd.
// Copyright 2022-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

#if IS_MAIN_APP
import EmbeddedElementCall
#endif

import Foundation
import SwiftUI

/// Common settings between app and NSE
protocol CommonSettingsProtocol: AnyObject {
    var lastNotificationBootTime: TimeInterval? { get set }
    var notificationSoundName: RemotePreference<UNNotificationSoundName> { get }
    
    var logLevel: LogLevel { get }
    var traceLogPacks: Set<TraceLogPack> { get }
    var bugReportRageshakeURL: RemotePreference<RageshakeConfiguration> { get }
    
    var enableOnlySignedDeviceIsolationMode: Bool { get }
    var enableKeyShareOnInvite: Bool { get }
    var threadsEnabled: Bool { get }
    var hideQuietNotificationAlerts: Bool { get }
}

enum AppBuildType {
    case debug
    case nightly
    case release
}

/// Store Element specific app settings.
final class AppSettings {
    private enum UserDefaultsKeys: String {
        case lastVersionLaunched
        case seenInvites
        case hasSeenSpacesAnnouncement
        case hasSeenNewSoundBanner
        case appLockNumberOfPINAttempts
        case appLockNumberOfBiometricAttempts
        case timelineStyle
        
        case analyticsConsentState
        case hasRunNotificationPermissionsOnboarding
        // Tchap: add welcome screen
        case hasRunTchapWelcomeOnboarding
        case hasRunIdentityConfirmationOnboarding
        
        case frequentlyUsedSystemEmojis
        
        case enableNotifications
        case enableInAppNotifications
        case pusherProfileTag
        case lastNotificationBootTime
        case logLevel
        case traceLogPacks
        case viewSourceEnabled
        case optimizeMediaUploads
        case appAppearance
        case sharePresence
        
        case elementCallBaseURLOverride
        
        // Feature flags
        case publicSearchEnabled
        case fuzzyRoomListSearchEnabled
        case lowPriorityFilterEnabled
        case enableOnlySignedDeviceIsolationMode
        case enableKeyShareOnInvite
        case knockingEnabled
        case threadsEnabled
        case developerOptionsEnabled
        case linkPreviewsEnabled
        case focusEventOnNotificationTap
        case linkNewDeviceEnabled
        
        // Spaces
        case spaceFiltersEnabled
        case spaceSettingsEnabled
        case createSpaceEnabled
        
        case voiceMessagePlaybackSpeed

        // Doug's tweaks 🔧
        case hideUnreadMessagesBadge
        case hideQuietNotificationAlerts
    }
    
    private static var suiteName: String = InfoPlistReader.main.appGroupIdentifier

    /// UserDefaults to be used on reads and writes.
    private static var store: UserDefaults! = UserDefaults(suiteName: suiteName)
    
    static var appBuildType: AppBuildType {
        #if DEBUG
        return .debug
        #else
        // Tchap: we only build debug and release versions (production, staging and development are flavors, not build types).
//        switch InfoPlistReader.main.baseBundleIdentifier {
//        case "io.element.elementx.nightly":
//            return .nightly
//        default:
//            return .release
//        }
        return .release
        #endif
    }
    
    static func resetAllSettings() {
        MXLog.warning("Resetting the AppSettings.")
        store.removePersistentDomain(forName: suiteName)
    }
    
    static func resetSessionSpecificSettings() {
        MXLog.warning("Resetting the user session specific AppSettings.")
        store.removeObject(forKey: UserDefaultsKeys.hasRunIdentityConfirmationOnboarding.rawValue)
    }
    
    static func configureWithSuiteName(_ name: String) {
        suiteName = name
        
        guard let userDefaults = UserDefaults(suiteName: name) else {
            fatalError("Fail to load shared UserDefaults")
        }
        
        store = userDefaults
    }
    
    // MARK: - Hooks
    
    // swiftlint:disable:next function_parameter_count
    func override(accountProviders: [String],
                  allowOtherAccountProviders: Bool,
                  hideBrandChrome: Bool,
                  pushGatewayBaseURL: URL,
                  oidcRedirectURL: URL,
                  websiteURL: URL,
                  logoURL: URL,
                  copyrightURL: URL,
                  acceptableUseURL: URL,
                  privacyURL: URL,
                  encryptionURL: URL,
                  deviceVerificationURL: URL,
                  chatBackupDetailsURL: URL,
                  identityPinningViolationDetailsURL: URL,
                  historySharingDetailsURL: URL,
                  elementWebHosts: [String],
                  accountProvisioningHost: String,
                  bugReportApplicationID: String,
                  analyticsTermsURL: URL?,
                  mapTilerConfiguration: MapTilerConfiguration) {
        self.accountProviders = accountProviders
        self.allowOtherAccountProviders = allowOtherAccountProviders
        self.hideBrandChrome = hideBrandChrome
        self.pushGatewayBaseURL = pushGatewayBaseURL
        self.oidcRedirectURL = oidcRedirectURL
        self.websiteURL = websiteURL
        self.logoURL = logoURL
        self.copyrightURL = copyrightURL
        self.acceptableUseURL = acceptableUseURL
        self.privacyURL = privacyURL
        self.encryptionURL = encryptionURL
        self.deviceVerificationURL = deviceVerificationURL
        self.chatBackupDetailsURL = chatBackupDetailsURL
        self.identityPinningViolationDetailsURL = identityPinningViolationDetailsURL
        self.historySharingDetailsURL = historySharingDetailsURL
        self.elementWebHosts = elementWebHosts
        self.accountProvisioningHost = accountProvisioningHost
        self.bugReportApplicationID = bugReportApplicationID
        self.analyticsTermsURL = analyticsTermsURL
        self.mapTilerConfiguration = mapTilerConfiguration
    }
    
    // MARK: - Application
    
    /// The last known version of the app that was launched on this device, which is
    /// used to detect when migrations should be run. When `nil` the app may have been
    /// deleted between runs so should clear data in the shared container and keychain.
    @UserPreference(key: UserDefaultsKeys.lastVersionLaunched, storageType: .userDefaults(store))
    var lastVersionLaunched: String?
        
    /// The Set of room identifiers of invites that the user already saw in the invites list.
    /// This Set is being used to implement badges for unread invites.
    @UserPreference(key: UserDefaultsKeys.seenInvites, defaultValue: [], storageType: .userDefaults(store))
    var seenInvites: Set<String>
    
    @UserPreference(key: UserDefaultsKeys.hasSeenSpacesAnnouncement, defaultValue: false, storageType: .userDefaults(store))
    var hasSeenSpacesAnnouncement
    
    /// Defaults to `true` for new users, and we use a migration to set it to `false` for existing users.
    @UserPreference(key: UserDefaultsKeys.hasSeenNewSoundBanner, defaultValue: true, storageType: .userDefaults(store))
    var hasSeenNewSoundBanner
    
    /// The initial set of account providers shown to the user in the authentication flow.
    ///
    /// Account provider is the friendly term for the server name. It should not contain an `https` prefix and should
    /// match the last part of the user ID. For example `example.com` and not `https://matrix.example.com`.
    #if IS_TCHAP_DEVELOPMENT
    private(set) var accountProviders = [
        "dev01.tchap.incubateur.net",
        "dev02.tchap.incubateur.net",
        "ext01.tchap.incubateur.net"
    ]
    #elseif IS_TCHAP_STAGING
    private(set) var accountProviders = ["i.tchap.gouv.fr",
                                         "a.tchap.gouv.fr",
                                         "e.tchap.gouv.fr"]
    #elseif IS_TCHAP_PRODUCTION
    private(set) var accountProviders = ["agent.externe.tchap.gouv.fr",
                                         "agent.collectivites.tchap.gouv.fr",
                                         "agent.tchap.gouv.fr",
                                         "agent.elysee.tchap.gouv.fr",
                                         "agent.pm.tchap.gouv.fr",
                                         "agent.ssi.tchap.gouv.fr",
                                         "agent.finances.tchap.gouv.fr",
                                         "agent.social.tchap.gouv.fr",
                                         "agent.interieur.tchap.gouv.fr",
                                         "agent.agriculture.tchap.gouv.fr",
                                         "agent.justice.tchap.gouv.fr",
                                         "agent.diplomatie.tchap.gouv.fr",
                                         "agent.intradef.tchap.gouv.fr",
                                         "agent.dinum.tchap.gouv.fr",
                                         "agent.culture.tchap.gouv.fr",
                                         "agent.dev-durable.tchap.gouv.fr",
                                         "agent.education.tchap.gouv.fr"]
    #elseif IS_TCHAP_UNIT_TESTS
    private(set) var accountProviders = ["agent.dinum.tchap.gouv.fr"]
    #else
    private(set) var accountProviders = ["matrix.org"]
    #endif
    /// Whether or not the user is allowed to manually enter their own account provider or must select from one of `defaultAccountProviders`.
    private(set) var allowOtherAccountProviders = true
    /// Whether the components surrounding the app brand/logo should be hidden or not
    private(set) var hideBrandChrome = false
    
    /// The task identifier used for background app refresh. Also used in main target's the Info.plist
    let backgroundAppRefreshTaskIdentifier = "io.element.elementx.background.refresh"

    // Tchap: adapt website URL for OIDC / MAS
    //    private(set) var websiteURL: URL = "https://element.io"
    /// A URL where users can go read more about the app.
    #if IS_TCHAP_PRODUCTION
    private(set) var websiteURL: URL = "https://tchap.gouv.fr"
    #elseif IS_TCHAP_STAGING
    private(set) var websiteURL: URL = "https://beta.tchap.gouv.fr"
    #elseif IS_TCHAP_DEVELOPMENT
    private(set) var websiteURL: URL = "https://tchap.incubateur.net"
    #else
    private(set) var websiteURL: URL = "https://element.io"
    #endif
    
    /// A URL that contains the app's logo that may be used when showing content in a web view.
    private(set) var logoURL: URL = "https://element.io/mobile-icon.png"
    /// A URL that contains that app's copyright notice.
    private(set) var copyrightURL: URL = "https://element.io/copyright"
    // Tchap: replace Terms of Use and Privacy policy URLs.
//    /// A URL that contains the app's Terms of use.
//    let acceptableUseURL: URL = "https://element.io/acceptable-use-policy-terms"
//    /// A URL that contains the app's Privacy Policy.
//        let privacyURL: URL = "https://element.io/privacy"
    // Tchap: Tchap Terms of Use and Privacy policy
    /// A URL that contains the app's Terms of use.
    private(set) var acceptableUseURL: URL = "https://tchap.numerique.gouv.fr/cgu" // Tchap
    /// A URL that contains the app's Privacy Policy.
    private(set) var privacyURL: URL = "https://tchap.numerique.gouv.fr/politique-de-confidentialite/" // Tchap
    // Tchap: FAQ url.
    /// A URL that leads to Tchap FAQ page.
    let tchapFaqURL: URL = "https://aide.tchap.numerique.gouv.fr/" // Tchap
    // Tchap: external members FAQ url.
    /// A URL that leads to Tchap FAQ page.
    let tchapExternalFaqURL: URL = "https://aide.tchap.numerique.gouv.fr/fr/article/comment-inviter-un-externe-sur-tchap-iphone-110q735" // Tchap
    /// An email address that should be used for support requests.
    private(set) var supportEmailAddress = "support@element.io"
    /// A URL where users can go read more about encryption in general.
    private(set) var encryptionURL: URL = "https://element.io/help#encryption"
    /// A URL where users can go read more about device verification..
    private(set) var deviceVerificationURL: URL = "https://element.io/help#encryption-device-verification"
    /// A URL where users can go read more about the chat backup.
    private(set) var chatBackupDetailsURL: URL = "https://element.io/help#encryption5"
    /// A URL where users can go read more about identity pinning violations
    private(set) var identityPinningViolationDetailsURL: URL = "https://element.io/help#encryption18"
    /// A URL describing how history sharing works
    private(set) var historySharingDetailsURL: URL = "https://element.io/en/help#e2ee-history-sharing"
    // Tchap: handle Tchap permalinks
    /// Any domains that Element web may be hosted on - used for handling links.
    #if IS_TCHAP_DEVELOPMENT
    private(set) var elementWebHosts = ["tchap.incubateur.net", "www.tchap.incubateur.net"]
    #elseif IS_TCHAP_STAGING
    private(set) var elementWebHosts = ["beta.tchap.gouv.fr", "app.preprod.tchap.gouv.fr", "www.beta.tchap.gouv.fr", "www.app.preprod.tchap.gouv.fr"]
    #elseif IS_TCHAP_PRODUCTION
    private(set) var elementWebHosts = ["tchap.gouv.fr", "www.tchap.gouv.fr"]
    #else
    private(set) var elementWebHosts = ["app.element.io", "staging.element.io", "develop.element.io"]
    #endif
    /// The domain that account provisioning links will be hosted on - used for handling the links.
    private(set) var accountProvisioningHost = "mobile.element.io"
    /// The App Store URL for Element Pro, shown to the user when a homeserver requires that app.
    /// **Note:** This property isn't overridable as it in unexpected for forks to come across the error (or to even have a "Pro" app).
    let elementProAppStoreURL: URL = "https://apps.apple.com/app/element-pro-for-work/id6502951615"
    
    @UserPreference(key: UserDefaultsKeys.appAppearance, defaultValue: .system, storageType: .userDefaults(store))
    var appAppearance: AppAppearance
    
    // MARK: - Security
    
    /// The app must be locked with a PIN code as part of the authentication flow.
    let appLockIsMandatory = false
    /// The amount of time the app can remain in the background for without requesting the PIN/TouchID/FaceID.
    let appLockGracePeriod: TimeInterval = 0
    /// Any codes that the user isn't allowed to use for their PIN.
    let appLockPINCodeBlockList = ["0000", "1234"]
    /// The number of attempts the user has made to unlock the app with a PIN code (resets when unlocked).
    @UserPreference(key: UserDefaultsKeys.appLockNumberOfPINAttempts, defaultValue: 0, storageType: .userDefaults(store))
    var appLockNumberOfPINAttempts: Int
    
    // MARK: - Authentication
    
    /// Any pre-defined static client registrations for OIDC issuers.
    let oidcStaticRegistrations: [URL: String] = ["https://id.thirdroom.io/realms/thirdroom": "elementx"]

    // Tchap: Customize OIDC Redirect URL (as stated here https://github.com/element-hq/element-x-ios/issues/4119#issuecomment-2879430647)
    // and now in the `docs/FORKING.md` (https://github.com/element-hq/element-x-ios/blob/develop/docs/FORKING.md)
    // Use the same Redirect URL as Tchap Legacy.
    // The fact it is a custom scheme rather than a special web URL avoid the mandatory associated domain declaration: https://developer.apple.com/documentation/xcode/supporting-associated-domains
    //
    // It seemd the MAS need an oidc redirect url the match the domain name in reverse notation.
    //    private(set) var oidcRedirectURL: URL = "https://element.io/oidc/login"
    /// The redirect URL used for OIDC. This no longer uses universal links so we don't need the bundle ID to avoid conflicts between Element X, Nightly and PR builds.
    
    #if IS_TCHAP_DEVELOPMENT
    private(set) var oidcRedirectURL: URL = "net.incubateur.tchap.ios:/"
    #elseif IS_TCHAP_STAGING
    private(set) var oidcRedirectURL: URL = "fr.gouv.tchap.beta.ios:/"
    #elseif IS_TCHAP_PRODUCTION
    private(set) var oidcRedirectURL: URL = "fr.gouv.tchap.ios:/"
    #else
    private(set) var oidcRedirectURL: URL = "https://element.io/oidc/login"
    #endif

    private(set) lazy var oidcConfiguration = OIDCConfiguration(clientName: InfoPlistReader.main.bundleDisplayName,
                                                                redirectURI: oidcRedirectURL,
                                                                clientURI: websiteURL,
                                                                logoURI: logoURL,
                                                                tosURI: acceptableUseURL,
                                                                policyURI: privacyURL,
                                                                staticRegistrations: oidcStaticRegistrations.mapKeys { $0.absoluteString })
    
    /// Whether or not the Create Account button is shown on the start screen.
    ///
    /// **Note:** Setting this to false doesn't prevent someone from creating an account when the selected homeserver's MAS allows registration.
    let showCreateAccountButton = true
    
    // MARK: - Notifications
    
    var pusherAppID: String {
        // Tchap: always use `.ios.prod` pusherAppId suffix.
//        #if DEBUG
//        InfoPlistReader.main.baseBundleIdentifier + ".ios.dev"
//        #else
//        InfoPlistReader.main.baseBundleIdentifier + ".ios.prod"
//        #endif
        InfoPlistReader.main.baseBundleIdentifier + ".ios.prod"
    }
    
    // Tchap: use Tchap Sygnal as push notification server.
//    private(set) var pushGatewayBaseURL: URL = "https://matrix.org"
    #if IS_TCHAP_DEVELOPMENT
    var pushGatewayBaseURL: URL = "https://sygnal.tchap.incubateur.net"
    #elseif IS_TCHAP_STAGING
    var pushGatewayBaseURL: URL = "https://sygnal.preprod.tchap.gouv.fr"
    #elseif IS_TCHAP_PRODUCTION
    var pushGatewayBaseURL: URL = "https://sygnal.tchap.gouv.fr"
    #else
    var pushGatewayBaseURL: URL = "https://matrix.org"
    #endif
    var pushGatewayNotifyEndpoint: URL {
        pushGatewayBaseURL.appending(path: "_matrix/push/v1/notify")
    }
    
    @UserPreference(key: UserDefaultsKeys.enableNotifications, defaultValue: true, storageType: .userDefaults(store))
    var enableNotifications

    @UserPreference(key: UserDefaultsKeys.enableInAppNotifications, defaultValue: true, storageType: .userDefaults(store))
    var enableInAppNotifications
    
    @UserPreference(key: UserDefaultsKeys.hideQuietNotificationAlerts, defaultValue: false, storageType: .userDefaults(store))
    var hideQuietNotificationAlerts

    /// Tag describing which set of device specific rules a pusher executes.
    @UserPreference(key: UserDefaultsKeys.pusherProfileTag, storageType: .userDefaults(store))
    var pusherProfileTag: String?
    
    /// The device's last boot time as recorded by the NSE.
    @UserPreference(key: UserDefaultsKeys.lastNotificationBootTime, storageType: .userDefaults(store))
    var lastNotificationBootTime: TimeInterval?
    
    /// The name of sound played when delivering noisy notifications.
    var notificationSoundName: RemotePreference<UNNotificationSoundName> = .init(.init("message.caf"))
    
    // MARK: - Logging
        
    @UserPreference(key: UserDefaultsKeys.logLevel, defaultValue: LogLevel.info, storageType: .userDefaults(store))
    var logLevel
    
    @UserPreference(key: UserDefaultsKeys.traceLogPacks, defaultValue: [], storageType: .userDefaults(store))
    var traceLogPacks: Set<TraceLogPack>
    
    // MARK: - Bug report
    
    let bugReportRageshakeURL: RemotePreference<RageshakeConfiguration> = .init(Secrets.rageshakeURL.map { .url(URL(string: $0)!) } ?? .disabled) // swiftlint:disable:this force_unwrapping
    let bugReportSentryURL: URL? = Secrets.sentryDSN.map { URL(string: $0)! } // swiftlint:disable:this force_unwrapping
    let bugReportSentryRustURL: URL? = Secrets.sentryRustDSN.map { URL(string: $0)! } // swiftlint:disable:this force_unwrapping

    // Tchap: customize bug report application id to TchapX.
//    private(set) var bugReportApplicationID = "element-x-ios"
    /// The name allocated by the bug report server
    #if IS_TCHAP_DEVELOPMENT
    private(set) var bugReportApplicationID = "tchap-x-development-ios"
    #elseif IS_TCHAP_STAGING
    private(set) var bugReportApplicationID = "tchap-x-staging-ios"
    #elseif IS_TCHAP_PRODUCTION
    private(set) var bugReportApplicationID = "tchap-x-production-ios"
    #else
    private(set) var bugReportApplicationID = "element-x-ios"
    #endif
    /// The maximum size of the upload request. Default value is just below CloudFlare's max request size.
    let bugReportMaxUploadSize = 10 * 1024 * 1024

    // MARK: - Analytics
    
    /// The configuration to use for analytics. Set to `nil` to disable analytics.
    let analyticsConfiguration: AnalyticsConfiguration? = AppSettings.makeAnalyticsConfiguration()
    // Tchap: customize analytics policy url.
//    private(set) var analyticsTermsURL: URL? = "https://element.io/cookie-policy"
    /// The URL to open with more information about analytics terms. When this is `nil` the "Learn more" link will be hidden.
    private(set) var analyticsTermsURL: URL? = "https://tchap.numerique.gouv.fr/politique-de-confidentialite"
    /// Whether or not there the app is able ask for user consent to enable analytics or sentry reporting.
    var canPromptForAnalytics: Bool {
        analyticsConfiguration != nil || bugReportSentryURL != nil
    }
    
    private static func makeAnalyticsConfiguration() -> AnalyticsConfiguration? {
        guard let host = Secrets.postHogHost, let apiKey = Secrets.postHogAPIKey else { return nil }
        return AnalyticsConfiguration(host: host, apiKey: apiKey)
    }
    
    /// Whether the user has opted in to send analytics.
    @UserPreference(key: UserDefaultsKeys.analyticsConsentState, defaultValue: AnalyticsConsentState.unknown, storageType: .userDefaults(store))
    var analyticsConsentState
    
    @UserPreference(key: UserDefaultsKeys.hasRunNotificationPermissionsOnboarding, defaultValue: false, storageType: .userDefaults(store))
    var hasRunNotificationPermissionsOnboarding
    
    // Tchap: add welcome screen
    @UserPreference(key: UserDefaultsKeys.hasRunTchapWelcomeOnboarding, defaultValue: false, storageType: .userDefaults(store))
    var hasRunTchapWelcomeOnboarding
    
    @UserPreference(key: UserDefaultsKeys.hasRunIdentityConfirmationOnboarding, defaultValue: false, storageType: .userDefaults(store))
    var hasRunIdentityConfirmationOnboarding
    
    @UserPreference(key: UserDefaultsKeys.frequentlyUsedSystemEmojis, defaultValue: [FrequentlyUsedEmoji](), storageType: .userDefaults(store))
    var frequentlyUsedSystemEmojis
    
    // MARK: - Home Screen
    
    @UserPreference(key: UserDefaultsKeys.hideUnreadMessagesBadge, defaultValue: false, storageType: .userDefaults(store))
    var hideUnreadMessagesBadge
    
    // MARK: - Room Screen
    
    @UserPreference(key: UserDefaultsKeys.viewSourceEnabled, defaultValue: appBuildType == .debug, storageType: .userDefaults(store))
    var viewSourceEnabled
    
    @UserPreference(key: UserDefaultsKeys.optimizeMediaUploads, defaultValue: true, storageType: .userDefaults(store))
    var optimizeMediaUploads

    @UserPreference(key: UserDefaultsKeys.voiceMessagePlaybackSpeed, defaultValue: AudioPlaybackSpeed.default, storageType: .userDefaults(store))
    var voiceMessagePlaybackSpeed: AudioPlaybackSpeed

    /// Whether or not to show a warning on the media caption composer so the user knows
    /// that captions might not be visible to users who are using other Matrix clients.
    let shouldShowMediaCaptionWarning = true

    // MARK: - Element Call
    
    #if IS_MAIN_APP
    // swiftlint:disable:next force_unwrapping
    let elementCallBaseURL: URL = EmbeddedElementCall.appURL!
    #endif
    
    // These are publicly availble on https://call.element.io so we don't neeed to treat them as secrets
    let elementCallPosthogAPIHost = "https://posthog-element-call.element.io"
    let elementCallPosthogAPIKey = "phc_rXGHx9vDmyEvyRxPziYtdVIv0ahEv8A9uLWFcCi1WcU"
    let elementCallPosthogSentryDSN = "https://3bd2f95ba5554d4497da7153b552ffb5@sentry.tools.element.io/41"
    
    @UserPreference(key: UserDefaultsKeys.elementCallBaseURLOverride, defaultValue: nil, storageType: .userDefaults(store))
    var elementCallBaseURLOverride: URL?
    
    // MARK: - Users
    
    /// Whether to hide the display name and avatar of ignored users as these may contain objectionable content.
    let hideIgnoredUserProfiles = true
    
    // MARK: - Maps
    
    /// maptiler base url
    // Tchap: customize map tiler url for Tchap.
    #if IS_TCHAP_DEVELOPMENT || IS_TCHAP_STAGING || IS_TCHAP_PRODUCTION
    private enum TchapMapProvider: String {
        case geoDataGouv = "https://openmaptiles.geo.data.gouv.fr/styles"
        case ign = "https://data.geopf.fr/annexes/ressources/vectorTiles/styles/PLAN.IGN/standard.json"
    }

    private(set) var mapTilerConfiguration = MapTilerConfiguration(baseURL: URL(string: TchapMapProvider.geoDataGouv.rawValue)!, // swiftlint:disable:this force_unwrapping
                                                                   apiKey: Secrets.mapLibreAPIKey,
                                                                   lightStyleID: "osm-bright",
                                                                   darkStyleID: "fiord-color")
    #else
    private(set) var mapTilerConfiguration = MapTilerConfiguration(baseURL: "https://api.maptiler.com/maps",
                                                                   apiKey: Secrets.mapLibreAPIKey,
                                                                   lightStyleID: "9bc819c8-e627-474a-a348-ec144fe3d810",
                                                                   darkStyleID: "dea61faf-292b-4774-9660-58fcef89a7f3")
    #endif
    
    // MARK: - Presence
    
    @UserPreference(key: UserDefaultsKeys.sharePresence, defaultValue: true, storageType: .userDefaults(store))
    var sharePresence
    
    // MARK: - Feature Flags
    
    /// Spaces
    @UserPreference(key: UserDefaultsKeys.spaceSettingsEnabled, defaultValue: true, storageType: .volatile)
    var spaceSettingsEnabled
    
    @UserPreference(key: UserDefaultsKeys.createSpaceEnabled, defaultValue: true, storageType: .volatile)
    var createSpaceEnabled
    
    @UserPreference(key: UserDefaultsKeys.spaceFiltersEnabled, defaultValue: true, storageType: .volatile)
    var spaceFiltersEnabled
    
    /// Others
    // Tchap: enable `publicSearchEnabled` feature flag by default. It is Tchap `join a forum` action.
//    @UserPreference(key: UserDefaultsKeys.publicSearchEnabled, defaultValue: false, storageType: .userDefaults(store))
    @UserPreference(key: UserDefaultsKeys.publicSearchEnabled, defaultValue: true, storageType: .userDefaults(store))
    var publicSearchEnabled
    
    @UserPreference(key: UserDefaultsKeys.fuzzyRoomListSearchEnabled, defaultValue: false, storageType: .userDefaults(store))
    var fuzzyRoomListSearchEnabled
    
    @UserPreference(key: UserDefaultsKeys.lowPriorityFilterEnabled, defaultValue: false, storageType: .userDefaults(store))
    var lowPriorityFilterEnabled
    
    /// Configuration to enable only signed device isolation mode for  crypto. In this mode only devices signed by their owner will be considered in e2ee rooms.
    @UserPreference(key: UserDefaultsKeys.enableOnlySignedDeviceIsolationMode, defaultValue: false, storageType: .userDefaults(store))
    var enableOnlySignedDeviceIsolationMode
    
    /// Configuration to enable encrypted history sharing on invite, and accepting keys from inviters.
    @UserPreference(key: UserDefaultsKeys.enableKeyShareOnInvite, defaultValue: false, storageType: .userDefaults(store))
    var enableKeyShareOnInvite
    
    @UserPreference(key: UserDefaultsKeys.knockingEnabled, defaultValue: false, storageType: .userDefaults(store))
    var knockingEnabled
    
    // Tchap: enable `threadsEnabled` feature flag by default.
//    @UserPreference(key: UserDefaultsKeys.threadsEnabled, defaultValue: false, storageType: .userDefaults(store))
    @UserPreference(key: UserDefaultsKeys.threadsEnabled, defaultValue: true, storageType: .userDefaults(store))
    var threadsEnabled
    
    @UserPreference(key: UserDefaultsKeys.focusEventOnNotificationTap, defaultValue: false, storageType: .userDefaults(store))
    var focusEventOnNotificationTap
        
    @UserPreference(key: UserDefaultsKeys.linkPreviewsEnabled, defaultValue: false, storageType: .userDefaults(store))
    var linkPreviewsEnabled
    
    @UserPreference(key: UserDefaultsKeys.linkNewDeviceEnabled, defaultValue: false, storageType: .userDefaults(store))
    var linkNewDeviceEnabled
    
    @UserPreference(key: UserDefaultsKeys.developerOptionsEnabled, defaultValue: appBuildType == .debug, storageType: .userDefaults(store))
    var developerOptionsEnabled
}

extension AppSettings: CommonSettingsProtocol { }
