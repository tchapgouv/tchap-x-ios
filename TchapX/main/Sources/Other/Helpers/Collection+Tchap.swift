//
// Copyright 2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Foundation

extension Collection where Element == String {
    // Tchap: check if a list of room's members contains any external user.
    var containsExternalTchapUser: Bool {
        !filter {
            switch MatrixIdFromString($0).userType {
            case .external: true
            case .agent: false
            }
        }.isEmpty
    }
}
