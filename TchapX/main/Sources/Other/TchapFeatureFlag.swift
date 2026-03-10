/*
 * MIT License
 *
 * Copyright (c) 2024. DINUM
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
 * OR OTHER DEALINGS IN THE SOFTWARE.
 */

//
// TchapFeatureFlag.swift
// TchapX
//
// Created by Nicolas Buquet on 09/12/2024.
// Copyright © 2024 Tchap. All rights reserved.
//

import Foundation

struct TchapFeatureFlag {
    let allowedInstances: [Instance]
    
    func isActivated(for homeServer: TchapFeatureFlag.Instance) -> Bool {
        // Return false if no instance suppports the feature.
        if allowedInstances.isEmpty {
            return false
        }

        // Return true if all instances support the feature.
        // Can be used for feature that takes place before login (like ProConnect login option).
        if allowedInstances.contains(.all) {
            return true
        }
        
        // Example of homeServer for authenticiation: `matrix.agent.dinum.tchap.gouv.fr`
        // We must remove the `matrix.` prefix.
        let homeServerPrefixes = ["matrix.", "https://matrix."]
        var sanitizedHomeServer = Substring(homeServer.rawValue)
        homeServerPrefixes.forEach {
            if sanitizedHomeServer.hasPrefix($0) {
                sanitizedHomeServer = sanitizedHomeServer.dropFirst($0.count)
            }
        }
        
        // Verifiy that the instance is known.
        // Return false if the instance is not a known instance.
        guard let instance = Instance(rawValue: String(sanitizedHomeServer)) else {
            return false
        }
        
        // Return true if current session homeServer is listed in the instances supporting the feature.
        return allowedInstances.contains(instance)
    }
}

extension TchapFeatureFlag {
    enum Instance: String, CaseIterable {
        #if IS_TCHAP_PRODUCTION
        case externe = "agent.externe.tchap.gouv.fr"
        case collectivites = "agent.collectivites.tchap.gouv.fr"
        case agent = "agent.tchap.gouv.fr"
        case elysee = "agent.elysee.tchap.gouv.fr"
        case pm = "agent.pm.tchap.gouv.fr"
        case ssi = "agent.ssi.tchap.gouv.fr"
        case finances = "agent.finances.tchap.gouv.fr"
        case social = "agent.social.tchap.gouv.fr"
        case interieur = "agent.interieur.tchap.gouv.fr"
        case agriculture = "agent.agriculture.tchap.gouv.fr"
        case justice = "agent.justice.tchap.gouv.fr"
        case diplomatie = "agent.diplomatie.tchap.gouv.fr"
        case intradef = "agent.intradef.tchap.gouv.fr"
        case dinum = "agent.dinum.tchap.gouv.fr"
        case culture = "agent.culture.tchap.gouv.fr"
        case devDurable = "agent.dev-durable.tchap.gouv.fr"
        case education = "agent.education.tchap.gouv.fr"
        #elseif IS_TCHAP_STAGING
        case interne = "i.tchap.gouv.fr"
        case interne2 = "a.tchap.gouv.fr"
        case externe = "e.tchap.gouv.fr"
        #elseif IS_TCHAP_DEVELOPMENT
        case dev01 = "dev01.tchap.incubateur.net"
        case dev02 = "dev02.tchap.incubateur.net"
        #endif
        case all // To allow a feature for any instance

        var homeServer: String? { rawValue }
        
        static func instance(for homeServerName: String) -> Instance? {
            Instance.allCases.filter { $0.rawValue == homeServerName }.first
        }
    }
}

extension TchapFeatureFlag {
    enum Configuration {
        #if IS_TCHAP_PRODUCTION
        // CertificatePinning feature flag can only be activated for .all or none because it is used before any activated session.
        // See `TchapX/target.yml` file to know how to generate certificate pinning.
        static let certificatePinning = TchapFeatureFlag(allowedInstances: [.all])
        static let unencryptedPrivateRoom = TchapFeatureFlag(allowedInstances: [.dinum])
        // enableMAS feature flag can only be activated for .all or none because it is used before any activated session.
        static let enableMAS = TchapFeatureFlag(allowedInstances: [.all])
        #elseif IS_TCHAP_STAGING
        // CertificatePinning feature flag can only be activated for .all or none because it is used before any activated session.
        // See `TchapX/target.yml` file to know how to generate certificate pinning.
        static let certificatePinning = TchapFeatureFlag(allowedInstances: [.all])
        static let unencryptedPrivateRoom = TchapFeatureFlag(allowedInstances: [.all])
        // enableMAS feature flag can only be activated for .all or none because it is used before any activated session.
        static let enableMAS = TchapFeatureFlag(allowedInstances: [.all])
        #elseif IS_TCHAP_DEVELOPMENT
        // CertificatePinning feature flag pinning is disabled in Development version (which uses Let's Encrypt certificates).
        // See `TchapX/target.yml` file to know how to generate certificate pinning.
        static let certificatePinning = TchapFeatureFlag(allowedInstances: [])
        static let unencryptedPrivateRoom = TchapFeatureFlag(allowedInstances: [.all])
        // enableMAS feature flag can only be activated for .all or none because it is used before any activated session.
        static let enableMAS = TchapFeatureFlag(allowedInstances: [.all])
        #endif
    }
}
