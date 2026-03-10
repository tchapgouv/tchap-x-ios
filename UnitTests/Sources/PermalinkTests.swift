//
// Copyright 2025 Element Creations Ltd.
// Copyright 2022-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
<<<<<<< HEAD
#endif
=======
import Foundation
>>>>>>> release/26.03.0
import MatrixRustSDK
import Testing

/// Just for API sanity checking, they're already properly tested in the SDK/Ruma
<<<<<<< HEAD
class PermalinkTests: XCTestCase {
    // Tchap: adapt test
    private let homeServerName = "tchap.gouv.fr"

    func testUserIdentifierPermalink() {
=======
@Suite
struct PermalinkTests {
    @Test
    func userIdentifierPermalink() throws {
>>>>>>> release/26.03.0
        let invalidUserId = "This1sN0tV4lid!@#$%^&*()"
        #expect(throws: (any Error).self) { try matrixToUserPermalink(userId: invalidUserId) }
        
        let validUserId = "@abcdefghijklmnopqrstuvwxyz1234567890._-=/:matrix.org"
<<<<<<< HEAD
        // Tchap: handle permalinks
//        XCTAssertEqual(try? matrixToUserPermalink(userId: validUserId), .some("https://matrix.to/#/@abcdefghijklmnopqrstuvwxyz1234567890._-=%2F:matrix.org"))
        XCTAssertEqual(try? matrixToUserPermalink(userId: validUserId), .some("https://\(homeServerName)/#/@abcdefghijklmnopqrstuvwxyz1234567890._-=%2F:matrix.org"))
=======
        #expect(try matrixToUserPermalink(userId: validUserId) == "https://matrix.to/#/@abcdefghijklmnopqrstuvwxyz1234567890._-=%2F:matrix.org")
>>>>>>> release/26.03.0
    }
    
    @Test
    func permalinkDetection() {
        var url: URL = "https://www.matrix.org"
<<<<<<< HEAD
        // Tchap: handle permalinks
//        XCTAssertNil(parseMatrixEntityFrom(uri: url.absoluteString))
        let tchapBadUrl = URL(string: "badScheme://badHost.ext")! // swiftlint:disable:this force_unwrapping
        var tchapPermalink = TchapPermalinks.convert(permalinkUri: url) ?? tchapBadUrl
        XCTAssertNil(parseMatrixEntityFrom(uri: tchapPermalink.absoluteString))

        url = "https://matrix.to/#/@bob:matrix.org?via=matrix.org"
        // Tchap: handle permalinks
//        XCTAssertEqual(parseMatrixEntityFrom(uri: url.absoluteString),
//                       MatrixEntity(id: .user(id: "@bob:matrix.org"),
//                                    via: ["matrix.org"]))
        tchapPermalink = TchapPermalinks.convert(permalinkUri: url) ?? tchapBadUrl
        XCTAssertEqual(parseMatrixEntityFrom(uri: tchapPermalink.absoluteString),
                       MatrixEntity(id: .user(id: "@bob:matrix.org"),
                                    via: ["matrix.org"]))
        
        url = "https://matrix.to/#/!roomidentifier:matrix.org?via=matrix.org"
        // Tchap: handle permalinks
//        XCTAssertEqual(parseMatrixEntityFrom(uri: url.absoluteString),
//                       MatrixEntity(id: .room(id: "!roomidentifier:matrix.org"),
//                                    via: ["matrix.org"]))
        tchapPermalink = TchapPermalinks.convert(permalinkUri: url) ?? tchapBadUrl
        XCTAssertEqual(parseMatrixEntityFrom(uri: tchapPermalink.absoluteString),
                       MatrixEntity(id: .room(id: "!roomidentifier:matrix.org"),
                                    via: ["matrix.org"]))

        url = "https://matrix.to/#/%23roomalias:matrix.org?via=matrix.org"
        // Tchap: handle permalinks
//        XCTAssertEqual(parseMatrixEntityFrom(uri: url.absoluteString),
//                       MatrixEntity(id: .roomAlias(alias: "#roomalias:matrix.org"),
//                                    via: ["matrix.org"]))
        tchapPermalink = TchapPermalinks.convert(permalinkUri: url) ?? tchapBadUrl
        XCTAssertEqual(parseMatrixEntityFrom(uri: tchapPermalink.absoluteString),
                       MatrixEntity(id: .roomAlias(alias: "#roomalias:matrix.org"),
                                    via: ["matrix.org"]))

        url = "https://matrix.to/#/!roomidentifier:matrix.org/$eventidentifier?via=matrix.org"
        // Tchap: handle permalinks
//        XCTAssertEqual(parseMatrixEntityFrom(uri: url.absoluteString),
//                       MatrixEntity(id: .eventOnRoomId(roomId: "!roomidentifier:matrix.org", eventId: "$eventidentifier"),
//                                    via: ["matrix.org"]))
        tchapPermalink = TchapPermalinks.convert(permalinkUri: url) ?? tchapBadUrl
        XCTAssertEqual(parseMatrixEntityFrom(uri: tchapPermalink.absoluteString),
                       MatrixEntity(id: .eventOnRoomId(roomId: "!roomidentifier:matrix.org", eventId: "$eventidentifier"),
                                    via: ["matrix.org"]))

        url = "https://matrix.to/#/#roomalias:matrix.org/$eventidentifier?via=matrix.org"
        // Tchap: handle permalinks
//        XCTAssertEqual(parseMatrixEntityFrom(uri: url.absoluteString),
//                       MatrixEntity(id: .eventOnRoomAlias(alias: "#roomalias:matrix.org", eventId: "$eventidentifier"),
//                                    via: ["matrix.org"]))
        tchapPermalink = TchapPermalinks.convert(permalinkUri: url) ?? tchapBadUrl
        XCTAssertEqual(parseMatrixEntityFrom(uri: tchapPermalink.absoluteString),
                       MatrixEntity(id: .eventOnRoomAlias(alias: "#roomalias:matrix.org", eventId: "$eventidentifier"),
                                    via: ["matrix.org"]))
=======
        #expect(parseMatrixEntityFrom(uri: url.absoluteString) == nil)
        
        url = "https://matrix.to/#/@bob:matrix.org?via=matrix.org"
        #expect(parseMatrixEntityFrom(uri: url.absoluteString) ==
            MatrixEntity(id: .user(id: "@bob:matrix.org"),
                         via: ["matrix.org"]))
        
        url = "https://matrix.to/#/!roomidentifier:matrix.org?via=matrix.org"
        #expect(parseMatrixEntityFrom(uri: url.absoluteString) ==
            MatrixEntity(id: .room(id: "!roomidentifier:matrix.org"),
                         via: ["matrix.org"]))
        
        url = "https://matrix.to/#/%23roomalias:matrix.org?via=matrix.org"
        #expect(parseMatrixEntityFrom(uri: url.absoluteString) ==
            MatrixEntity(id: .roomAlias(alias: "#roomalias:matrix.org"),
                         via: ["matrix.org"]))
        
        url = "https://matrix.to/#/!roomidentifier:matrix.org/$eventidentifier?via=matrix.org"
        #expect(parseMatrixEntityFrom(uri: url.absoluteString) ==
            MatrixEntity(id: .eventOnRoomId(roomId: "!roomidentifier:matrix.org", eventId: "$eventidentifier"),
                         via: ["matrix.org"]))
        
        url = "https://matrix.to/#/#roomalias:matrix.org/$eventidentifier?via=matrix.org"
        #expect(parseMatrixEntityFrom(uri: url.absoluteString) ==
            MatrixEntity(id: .eventOnRoomAlias(alias: "#roomalias:matrix.org", eventId: "$eventidentifier"),
                         via: ["matrix.org"]))
>>>>>>> release/26.03.0
    }
}
