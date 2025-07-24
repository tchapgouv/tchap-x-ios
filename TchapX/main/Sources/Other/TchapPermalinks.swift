//
// Copyright 2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Foundation

/**
 * Mapping of an input URI to a matrix.to compliant URI.
 */
enum TchapPermalinks {
    private static let MATRIX_TO_PERMALINK_BASE_URL = "https://matrix.to/#/"
    public static let TCHAP_PERMALINK_BASE_URL = "https://tchap.gouv.fr/#/"
    private static let SUPPORTED_PATHS: [String] = ["/#/room/",
                                                    "/#/user/",
                                                    "/#/group/"]

    // the client or element-based domain permalinks (e.g. https://app.element.io/#/user/@chagai95:matrix.org) don't have the
    // mxid in the first param (like matrix.to does - https://matrix.to/#/@chagai95:matrix.org) but rather in the second after /user/ so /user/mxid
    // so convert URI to matrix.to to simplify parsing process

    /**
     * Try to convert a URL from an element web instance or from a client permalink to a matrix.to url.
     * To be successfully converted, URL path should contain one of the [SUPPORTED_PATHS].
     * Examples:
     * - https://riot.im/develop/#/room/#element-android:matrix.org  ->  https://matrix.to/#/#element-android:matrix.org
     * - https://app.element.io/#/room/#element-android:matrix.org   ->  https://matrix.to/#/#element-android:matrix.org
     * - https://www.example.org/#/room/#element-android:matrix.org  ->  https://matrix.to/#/#element-android:matrix.org
     */
    static func convert(permalinkUri: URL) -> URL? {
        let permalinkString = permalinkUri.absoluteString
        
        // If permalinkUri starts with MATRIX_TO_URL_BASE, it is already a matrix.to.
        // Return it as is.
        if permalinkString.hasPrefix(MATRIX_TO_PERMALINK_BASE_URL) {
            return permalinkUri
        }
        
        // PermalinkUri is a web or client url.
        if let supportedPathIndex = SUPPORTED_PATHS.firstIndex(where: { permalinkString.contains($0) }),
           let supportedPathRange = permalinkString.range(of: SUPPORTED_PATHS[supportedPathIndex]) {
            return URL(string: MATRIX_TO_PERMALINK_BASE_URL + permalinkString[permalinkString.index(permalinkString.index(after: supportedPathRange.upperBound), offsetBy: -1)...])
        }
        
        // If permalinkUri starts with TCHAP_PERMALINK_BASE_URL although it doesn't contains any supported path,
        // return it as is.
        if permalinkString.hasPrefix(TCHAP_PERMALINK_BASE_URL) {
            return permalinkUri
        }
        
        // URL is not supported
        return nil
    }
}
