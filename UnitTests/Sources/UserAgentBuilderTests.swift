//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import XCTest

// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
#endif

class UserAgentBuilderTests: XCTestCase {
    func testIsNotNil() {
        XCTAssertNotNil(UserAgentBuilder.makeASCIIUserAgent())
    }
    
    func testContainsClientName() {
        let userAgent = UserAgentBuilder.makeASCIIUserAgent()
        XCTAssert(userAgent.contains(InfoPlistReader.main.bundleDisplayName) == true, "\(userAgent) does not contain client name")
    }
    
    func testContainsClientVersion() {
        let userAgent = UserAgentBuilder.makeASCIIUserAgent()
        XCTAssert(userAgent.contains(InfoPlistReader.main.bundleShortVersionString) == true, "\(userAgent) does not contain client version")
    }
}
