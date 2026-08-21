//
// Copyright 2025 Element Creations Ltd.
// Copyright 2024-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Foundation
import MatrixRustSDK

extension ClientBuilder {
    /// A helper method that applies the common builder modifiers needed for the app.
    static func baseBuilder(setupEncryption: Bool = true,
                            httpProxy: String? = nil,
                            slidingSync: ClientBuilderSlidingSync,
                            sessionDelegate: ClientSessionDelegate,
                            appHooks: AppHooks,
                            enableOnlySignedDeviceIsolationMode: Bool,
                            requestTimeout: UInt64? = 30000,
                            maxRequestRetryTime: UInt64? = nil,
                            threadsEnabled: Bool) -> ClientBuilder {
        var builder = ClientBuilder()
            .crossProcessLockConfig(crossProcessLockConfig: .multiProcess(holderName: InfoPlistReader.main.bundleIdentifier))
            .setSessionDelegate(sessionDelegate: sessionDelegate)
            .userAgent(userAgent: UserAgentBuilder.makeASCIIUserAgent())
            // :tchap: Disable thread subscriptions (MSC4308)
            // The server response is missing the 'unsubscribed' field which causes infinite retry loops
//            .threadsEnabled(enabled: threadsEnabled, threadSubscriptions: threadsEnabled)
            .threadsEnabled(enabled: threadsEnabled, threadSubscriptions: false) // :tchap:end
            .requestConfig(config: .init(retryLimit: 3, // Must be non-zero for the SDK to retry API calls when rate-limited.
                                         timeout: requestTimeout,
                                         maxConcurrentRequests: nil,
                                         maxRetryTime: maxRequestRetryTime))
            .dmRoomDefinition(dmRoomDefinition: .twoMembers)
        
        builder = switch slidingSync {
        case .restored: builder
        case .discover: builder.slidingSyncVersionBuilder(versionBuilder: .discoverNative)
        }
        
        if setupEncryption {
            builder = builder
                .autoEnableCrossSigning(autoEnableCrossSigning: true)
                .backupDownloadStrategy(backupDownloadStrategy: .afterDecryptionFailure)
                .enableShareHistoryOnInvite(enableShareHistoryOnInvite: true)
                .autoEnableBackups(autoEnableBackups: true)
        }
        
        // Set recipient strategy and trust requirement even if `setupEncryption` is false to ensure messages
        // from insecure devices aren't displayed in push notifications.
        // See https://github.com/element-hq/element-x-ios/issues/4702.
        if enableOnlySignedDeviceIsolationMode {
            builder = builder
                .roomKeyRecipientStrategy(strategy: .identityBasedStrategy)
                .decryptionSettings(decryptionSettings: .init(senderDeviceTrustRequirement: .crossSignedOrLegacy))
        } else {
            builder = builder
                // Tchap: [Beta DINUM] - allow sending messages even if non-verified device is present on the account.
//                    .roomKeyRecipientStrategy(strategy: .errorOnVerifiedUserProblem)
                .roomKeyRecipientStrategy(strategy: .allDevices)
        }
        
        if let httpProxy {
            builder = builder.proxy(url: httpProxy)
        }
        
        // :tchap: certificate pinning
        if let derCertificates = certificatePinningDERCertificates() {
            builder = builder
                .disableBuiltInRootCertificates()
                .addRootCertificates(certificates: derCertificates)
        } // :tchap:end:
        
        return appHooks.clientBuilderHook.configure(builder)
    }
    
    // :tchap: certificate pinning
    static func certificatePinningDERCertificates() -> [Data]? {
        guard TchapFeatureFlag.Configuration.certificatePinning.isActivated(for: .all) else {
            return nil
        }

        let pemCertificates = InfoPlistReader.app.embeddedPemCertificates

        guard !pemCertificates.isEmpty else {
            preconditionFailure("Certificate pinning is enabled but no certificates are configured.")
        }
        
        // `addRootCertificates(certificates: [Data])` awaits a list of Data type values containing Certificates in DER or PEM format.
        // Actually, Certificates in PEM format don't work in ElementX implementation (it works in Rust direct test).
        // But it works with Certificates in DER format.
        // As DER format is not practical to store in info.plist, we store the certificates in PEM format in info.plist,
        // and convert it in DER format in Swift to take the functional path of DER into Rust.
        
        // Try to convert String based PEM to DER Data and check if no Certificate conversion failed.
        // This step require the removal of header and footer and any newline.

        return pemCertificates.enumerated().map { index, pem in
            let base64 = pem
                .replacingOccurrences(of: "-----BEGIN CERTIFICATE-----", with: "")
                .replacingOccurrences(of: "-----END CERTIFICATE-----", with: "")
                .components(separatedBy: .whitespacesAndNewlines)
                .joined()
            
            guard let data = Data(base64Encoded: base64) else {
                preconditionFailure("Invalid certificate pinning configuration: PEM certificate \(index) cannot be decoded.")
            }
            
            return data
        }
        
        // If necessary, to get the real certificate format:
        //    let certificateData = SecCertificateCreateWithData(nil, derCertificates as CFData)
        // Then, if necessary to get the public key:
        //    let publicKey = SecCertificateCopyKey(certificateData)
    } // :tchap:end:
}

enum ClientBuilderSlidingSync {
    /// Sliding sync will be configured when restoring the Session.
    case restored
    /// Sliding sync must be discovered whilst building the session.
    case discover
}
