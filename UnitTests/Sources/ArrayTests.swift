//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Foundation

import XCTest

// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
#endif

class ArrayTests: XCTestCase {
    func testGrouping() {
        XCTAssertEqual([].groupBy { $0 == 0 }, [])
        
        XCTAssertEqual([0].groupBy { $0 == 0 }, [[0]])
        
        XCTAssertEqual([1].groupBy { $0 == 0 }, [[1]])
        
        XCTAssertEqual([0, 0, 0].groupBy { $0 == 0 }, [[0, 0, 0]])
        
        XCTAssertEqual([1, 1, 1].groupBy { $0 == 0 }, [[1], [1], [1]])
        
        XCTAssertEqual([1, 0, 0, 1].groupBy { $0 == 0 }, [[1], [0, 0], [1]])
        
        XCTAssertEqual([0, 0, 1, 0].groupBy { $0 == 0 }, [[0, 0], [1], [0]])
        
        XCTAssertEqual([0, 0, 0, 1, 2, 3, 0].groupBy { $0 == 0 }, [[0, 0, 0], [1], [2], [3], [0]])
        
        XCTAssertEqual([0, 0, 0, 1, 2, 3, 0, 0].groupBy { $0 == 0 }, [[0, 0, 0], [1], [2], [3], [0, 0]])
        
        XCTAssertEqual([0, 0, 0, 1, 0, 2, 3, 0, 0].groupBy { $0 == 0 }, [[0, 0, 0], [1], [0], [2], [3], [0, 0]])
    }
}
