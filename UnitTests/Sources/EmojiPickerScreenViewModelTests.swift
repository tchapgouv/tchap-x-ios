//
// Copyright 2025 Element Creations Ltd.
// Copyright 2025 New Vector Ltd.
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

@MainActor
@Suite
struct EmojiPickerScreenViewModelTests {
    var timelineProxy: TimelineProxyMock!
    
    var viewModel: EmojiPickerScreenViewModel!
    var context: EmojiPickerScreenViewModel.Context {
        viewModel.context
    }
    
    @Test
    mutating func toggleReaction() async throws {
        setupViewModel()
        let reaction = "👋"
        
        let deferred = deferFulfillment(viewModel.actions) { $0 == .dismiss }
        
        try await waitForConfirmation(timeout: .seconds(5)) { confirmation in
            timelineProxy.toggleReactionToClosure = { toggledReaction, _ in
                defer { confirmation() }
                #expect(toggledReaction == reaction)
                return .success(())
            }
            
            context.send(viewAction: .emojiTapped(emoji: .init(id: "wave", value: reaction)))
        }
        
        try await deferred.fulfill()
    }
    
    // MARK: - Helpers
    
    private mutating func setupViewModel(selectedEmojis: Set<String> = []) {
        timelineProxy = TimelineProxyMock(.init())
        
        viewModel = EmojiPickerScreenViewModel(itemID: .randomEvent,
                                               selectedEmojis: selectedEmojis,
                                               emojiProvider: EmojiProvider(appSettings: ServiceLocator.shared.settings),
                                               timelineController: MockTimelineController(timelineProxy: timelineProxy))
    }
}
