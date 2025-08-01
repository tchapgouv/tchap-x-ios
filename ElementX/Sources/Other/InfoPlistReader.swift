//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Foundation

struct InfoPlistReader {
    private enum Keys {
        static let appGroupIdentifier = "appGroupIdentifier"
        static let baseBundleIdentifier = "baseBundleIdentifier"
        static let keychainAccessGroupIdentifier = "keychainAccessGroupIdentifier"
        static let bundleShortVersion = "CFBundleShortVersionString"
        static let bundleDisplayName = "CFBundleDisplayName"
        static let productionAppName = "productionAppName"
        static let utExportedTypeDeclarationsKey = "UTExportedTypeDeclarations"
        static let utTypeIdentifierKey = "UTTypeIdentifier"
        static let utDescriptionKey = "UTTypeDescription"
        
        static let bundleURLTypes = "CFBundleURLTypes"
        static let bundleURLName = "CFBundleURLName"
        static let bundleURLSchemes = "CFBundleURLSchemes"
    }
    
    private enum Values {
        static let mentionPills = "Mention Pills"
    }

    /// Info.plist reader on the bundle object that contains the current executable.
    static let main = InfoPlistReader(bundle: .main)

    /// Info.plist reader on the bundle object that contains the main app executable.
    static let app = InfoPlistReader(bundle: .app)

    private let bundle: Bundle

    /// Initializer
    /// - Parameter bundle: bundle to read values from
    init(bundle: Bundle) {
        self.bundle = bundle
    }

    /// App group identifier set in Info.plist of the target
    var appGroupIdentifier: String {
        infoPlistValue(forKey: Keys.appGroupIdentifier)
    }

    /// Base bundle identifier set in Info.plist of the target
    var baseBundleIdentifier: String {
        infoPlistValue(forKey: Keys.baseBundleIdentifier)
    }
    
    /// Keychain access group identifier set in Info.plist of the target
    var keychainAccessGroupIdentifier: String {
        infoPlistValue(forKey: Keys.keychainAccessGroupIdentifier)
    }

    /// Bundle executable of the target
    var bundleExecutable: String {
        infoPlistValue(forKey: kCFBundleExecutableKey as String)
    }

    /// Bundle identifier of the target
    var bundleIdentifier: String {
        infoPlistValue(forKey: kCFBundleIdentifierKey as String)
    }

    /// Bundle short version string of the target
    var bundleShortVersionString: String {
        infoPlistValue(forKey: Keys.bundleShortVersion)
    }

    /// Bundle version of the target
    var bundleVersion: String {
        infoPlistValue(forKey: kCFBundleVersionKey as String)
    }

    /// Bundle display name of the target
    var bundleDisplayName: String {
        infoPlistValue(forKey: Keys.bundleDisplayName)
    }
    
    /// The name of the non-X app when it becomes production ready.
    var productionAppName: String {
        infoPlistValue(forKey: Keys.productionAppName)
    }
    
    // MARK: - Custom App Scheme
    
    var appScheme: String {
        customSchemeForName("Application")
    }
    
    var elementCallScheme: String {
        customSchemeForName("Element Call")
    }
    
    // MARK: - Mention Pills

    /// Mention Pills UTType
    var pillsUTType: String {
        let exportedTypes: [[String: Any]] = infoPlistValue(forKey: Keys.utExportedTypeDeclarationsKey)
        guard let mentionPills = exportedTypes.first(where: { $0[Keys.utDescriptionKey] as? String == Values.mentionPills }),
              let utType = mentionPills[Keys.utTypeIdentifierKey] as? String else {
            fatalError("Add properly \(Values.mentionPills) exported type into your target's Info.plist")
        }
        
        // The pills type is formed from the baseBundleIdentifier, however weirdly, if a fork sets that with a value
        // that includes one or more uppercase characters, pill rendering breaks. If we lowercase the type identifier
        // the bug is fixed, even though the value used in the fork's Info.plist no longer matches the value returned.
        // Maybe in the future the fork should set their own PILLS_UT_TYPE_IDENTIFIER, but for now this works 🤷‍♂️🤷‍♂️🤷‍♂️
        return utType.lowercased()
    }
    
    // Tchap: add `pinnedCertificates` property
    
    // MARK: - Tchap Certificate Pinning
    
    private func recursiveSearchCertificates(for searchedKey: String, into: [String: Any]) -> [String] {
        var result = [String]()
        into.forEach { key, value in
            if key == searchedKey,
               let stringValue = value as? String {
                result.append(stringValue)
            } else if let subDict = value as? [String: Any] {
                result.append(contentsOf: recursiveSearchCertificates(for: searchedKey, into: subDict))
            } else if let subArray = value as? [[String: Any]] {
                subArray.forEach {
                    result.append(contentsOf: recursiveSearchCertificates(for: searchedKey, into: $0))
                }
            }
        }
        return result
    }
    
    var embeddedTransportSecurity: Any? {
        bundle.object(forInfoDictionaryKey: "NSAppTransportSecurity")
    }
    
    var embeddedSpkiCertificates: [String] {
        guard let transportSecurityData = embeddedTransportSecurity as? [String: Any] else {
            return []
        }
        return recursiveSearchCertificates(for: "SPKI-SHA256-BASE64", into: transportSecurityData)
    }
    
    var embeddedPemCertificates: [String] {
        guard let transportSecurityData = embeddedTransportSecurity as? [String: Any] else {
            return []
        }
        return recursiveSearchCertificates(for: "PEM", into: transportSecurityData)
    }
    
    // MARK: - Private
    
    private func infoPlistValue<T>(forKey key: String) -> T {
        guard let result = bundle.object(forInfoDictionaryKey: key) as? T else {
            fatalError("Add \(key) into your target's Info.plst")
        }
        return result
    }
    
    private func customSchemeForName(_ name: String) -> String {
        let urlTypes: [[String: Any]] = infoPlistValue(forKey: Keys.bundleURLTypes)
        
        guard let urlType = urlTypes.first(where: { $0[Keys.bundleURLName] as? String == name }),
              let urlSchemes = urlType[Keys.bundleURLSchemes] as? [String],
              let scheme = urlSchemes.first else {
            fatalError("Invalid custom application scheme configuration")
        }
        
        return scheme
    }
}
