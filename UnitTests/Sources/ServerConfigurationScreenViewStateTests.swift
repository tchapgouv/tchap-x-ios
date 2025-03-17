//
// Copyright 2023, 2024 New Vector Ltd.
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

@MainActor
class ServerConfirmationScreenViewStateTests: XCTestCase {
    func testLoginMessageString() {
        let matrixDotOrgLogin = ServerConfirmationScreenViewState(homeserverAddress: LoginHomeserver.mockMatrixDotOrg.address,
                                                                  authenticationFlow: .login)
        XCTAssertEqual(matrixDotOrgLogin.message, L10n.screenServerConfirmationMessageLoginMatrixDotOrg, "matrix.org should have a custom message.")
        
        let elementDotIoLogin = ServerConfirmationScreenViewState(homeserverAddress: "element.io",
                                                                  authenticationFlow: .login)
        XCTAssertEqual(elementDotIoLogin.message, L10n.screenServerConfirmationMessageLoginElementDotIo, "element.io should have a custom message.")
        
        let otherLogin = ServerConfirmationScreenViewState(homeserverAddress: LoginHomeserver.mockOIDC.address,
                                                           authenticationFlow: .login)
        XCTAssertTrue(otherLogin.message.isEmpty, "Other servers should not show a message.")
    }
    
    func testRegisterMessageString() {
        let matrixDotOrgRegister = ServerConfirmationScreenViewState(homeserverAddress: LoginHomeserver.mockMatrixDotOrg.address,
                                                                     authenticationFlow: .register)
        XCTAssertEqual(matrixDotOrgRegister.message, L10n.screenServerConfirmationMessageRegister, "The registration message should always be the same.")
        
        let oidcRegister = ServerConfirmationScreenViewState(homeserverAddress: LoginHomeserver.mockOIDC.address,
                                                             authenticationFlow: .register)
        XCTAssertEqual(oidcRegister.message, L10n.screenServerConfirmationMessageRegister, "The registration message should always be the same.")
    }
}
