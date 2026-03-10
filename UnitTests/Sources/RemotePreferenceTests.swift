//
// Copyright 2025 Element Creations Ltd.
// Copyright 2023-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

<<<<<<< HEAD
import XCTest

// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
#endif
=======
@testable import ElementX
import Testing
>>>>>>> release/26.03.0

@Suite
struct RemotePreferenceTests {
    @Test
    func overrideAndReset() {
        let preference = RemotePreference(0)
        #expect(preference.publisher.value == 0)
        #expect(!preference.isRemotelyConfigured)
        
        preference.applyRemoteValue(1)
        #expect(preference.publisher.value == 1)
        #expect(preference.isRemotelyConfigured)
        
        preference.applyRemoteValue(2)
        #expect(preference.publisher.value == 2)
        #expect(preference.isRemotelyConfigured)
        
        preference.reset()
        #expect(preference.publisher.value == 0)
        #expect(!preference.isRemotelyConfigured)
    }
    
    @Test
    func optionalOverride() {
        let preference: RemotePreference<String?> = .init("Hello")
        #expect(preference.publisher.value == "Hello")
        #expect(!preference.isRemotelyConfigured)
        
        preference.applyRemoteValue("World")
        #expect(preference.publisher.value == "World")
        #expect(preference.isRemotelyConfigured)
        
        preference.applyRemoteValue(nil)
        #expect(preference.publisher.value == nil)
        #expect(preference.isRemotelyConfigured)
        
        preference.reset()
        #expect(preference.publisher.value == "Hello")
        #expect(!preference.isRemotelyConfigured)
    }
}
