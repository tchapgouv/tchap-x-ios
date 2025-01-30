//
// Copyright 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
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
                            enableOnlySignedDeviceIsolationMode: Bool) -> ClientBuilder {
        var builder = ClientBuilder()
            .crossProcessStoreLocksHolderName(holderName: InfoPlistReader.main.bundleIdentifier)
            .enableOidcRefreshLock()
            .setSessionDelegate(sessionDelegate: sessionDelegate)
            .userAgent(userAgent: UserAgentBuilder.makeASCIIUserAgent())
            .requestConfig(config: .init(retryLimit: 0, timeout: 30000, maxConcurrentRequests: nil, retryTimeout: nil))
        
        builder = switch slidingSync {
        case .restored: builder
        case .discoverProxy: builder.slidingSyncVersionBuilder(versionBuilder: .discoverProxy)
        case .discoverNative: builder.slidingSyncVersionBuilder(versionBuilder: .discoverNative)
        case .forceNative: builder.slidingSyncVersionBuilder(versionBuilder: .native)
        }
        
        if setupEncryption {
            builder = builder
                .autoEnableCrossSigning(autoEnableCrossSigning: true)
                .backupDownloadStrategy(backupDownloadStrategy: .afterDecryptionFailure)
                .autoEnableBackups(autoEnableBackups: true)
                
            if enableOnlySignedDeviceIsolationMode {
                builder = builder
                    .roomKeyRecipientStrategy(strategy: .identityBasedStrategy)
                    .roomDecryptionTrustRequirement(trustRequirement: .crossSignedOrLegacy)
            } else {
                builder = builder
                    .roomKeyRecipientStrategy(strategy: .deviceBasedStrategy(onlyAllowTrustedDevices: false, errorOnVerifiedUserProblem: true))
                    .roomDecryptionTrustRequirement(trustRequirement: .untrusted)
            }
        }
        
        if let httpProxy {
            builder = builder.proxy(url: httpProxy)
        }
        
        // Tchap: check certificate pinning if activated.
        if TchapFeatureFlag.Configuration.certificatePinning.isActivated(for: .all) {
            let pemCertificates = InfoPlistReader.app.embeddedPemCertificates
            if pemCertificates.count > 0 {
                // `addRootCertificates(certificates: [Data])` awaits a list of Data type values containing Certificates in DER or PEM format.
                // Actually, Certificates in PEM format don't work in ElementX implementation (it works in Rust direct test).
                // But it works with Certificates in DER format.
                // As DER format is not practical to store in info.plist, we store the certificates in PEM format in info.plist,
                // and convert it in DER format in Swift to take the functional path of DER into Rust.
                
                // Try to convert String based PEM to DER Data and check if no Certificate conversion failed.
                // This step require the removal of header and footer and any newline.
                
                let derCertificates = pemCertificates.compactMap {
                    Data(base64Encoded:
                        $0.replacingOccurrences(of: "-----BEGIN CERTIFICATE-----", with: "")
                            .replacingOccurrences(of: "-----END CERTIFICATE-----", with: "")
                            .replacingOccurrences(of: "\n", with: ""))
                }
                
                // If necessary, to get the real certificate format:
                //    let certificate = SecCertificateCreateWithData(nil, certDataDER as CFData)
                // Then, if necessary to get the public key:
                //    let publicKey = SecCertificateCopyKey(certificate)
                
                // If any failure occured, ignore ALL certificates.
                if derCertificates.count == pemCertificates.count {
                    builder = builder.disableBuiltInRootCertificates()
                        .addRootCertificates(certificates: derCertificates)
                }
            }
        }
        return appHooks.clientBuilderHook.configure(builder)
    }
}

enum ClientBuilderSlidingSync {
    /// The proxy will be supplied when restoring the Session.
    case restored
    /// A proxy must be discovered whilst building the session.
    case discoverProxy
    /// Native sliding sync must be discovered whilst building the session.
    case discoverNative
    /// Forces native sliding sync without discovering it.
    case forceNative
}
