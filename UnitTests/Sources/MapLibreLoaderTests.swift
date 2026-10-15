//
// Copyright 2026 Element Creations Ltd.
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
#endif
import Testing

@MainActor
struct MapLibreLoaderTests {
    /// The shim is embedded but not linked, if it ever stops being copied into the app (or
    /// the class is renamed) the interactive map would silently stop working.
    @Test
    func loadsTheShim() {
        #expect(MapLibreLoader.shim != nil)
    }
}
