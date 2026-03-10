//
// Copyright 2025 Element Creations Ltd.
// Copyright 2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

@testable import ElementX
import MatrixRustSDK
import MatrixRustSDKMocks
import Testing

<<<<<<< HEAD
// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
#endif

class RoomTests: XCTestCase {
    func testCallIntent() async throws {
=======
@Suite
struct RoomTests {
    @Test
    func callIntent() async {
>>>>>>> release/26.03.0
        let room = RoomSDKMock()
        room.hasActiveRoomCallReturnValue = false
        room.isDirectReturnValue = false
        
        var callIntent = await room.joinCallIntent
        #expect(callIntent == .startCall)
        
        room.isDirectReturnValue = true
        callIntent = await room.joinCallIntent
        #expect(callIntent == .startCallDm)
        
        room.hasActiveRoomCallReturnValue = true
        callIntent = await room.joinCallIntent
        #expect(callIntent == .joinExistingDm)
        
        room.isDirectReturnValue = false
        callIntent = await room.joinCallIntent
        #expect(callIntent == .joinExisting)
    }
}
