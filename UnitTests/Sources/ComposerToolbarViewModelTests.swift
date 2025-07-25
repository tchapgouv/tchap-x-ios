//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Combine

// Tchap: specify target for unit tests
// @testable import ElementX
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
#else
@testable import ElementX
#endif
import MatrixRustSDK
import XCTest

import WysiwygComposer

@MainActor
class ComposerToolbarViewModelTests: XCTestCase {
    private var appSettings: AppSettings!
    private var wysiwygViewModel: WysiwygComposerViewModel!
    private var viewModel: ComposerToolbarViewModel!
    private var completionSuggestionServiceMock: CompletionSuggestionServiceMock!
    private var draftServiceMock: ComposerDraftServiceMock!

    override func setUp() {
        AppSettings.resetAllSettings()
        appSettings = AppSettings()
        ServiceLocator.shared.register(appSettings: appSettings)
        setUpViewModel()
    }
    
    override func tearDown() {
        AppSettings.resetAllSettings()
    }

    func testComposerFocus() {
        viewModel.process(timelineAction: .setMode(mode: .edit(originalEventOrTransactionID: .eventID("mock"), type: .default)))
        XCTAssertTrue(viewModel.state.bindings.composerFocused)
        viewModel.process(timelineAction: .removeFocus)
        XCTAssertFalse(viewModel.state.bindings.composerFocused)
    }

    func testComposerMode() {
        let mode: ComposerMode = .edit(originalEventOrTransactionID: .eventID("mock"), type: .default)
        viewModel.process(timelineAction: .setMode(mode: mode))
        XCTAssertEqual(viewModel.state.composerMode, mode)
        viewModel.process(timelineAction: .clear)
        XCTAssertEqual(viewModel.state.composerMode, .default)
    }

    func testComposerModeIsPublished() {
        let mode: ComposerMode = .edit(originalEventOrTransactionID: .eventID("mock"), type: .default)
        let expectation = expectation(description: "Composer mode is published")
        let cancellable = viewModel
            .context
            .$viewState
            .map(\.composerMode)
            .removeDuplicates()
            .dropFirst()
            .sink { composerMode in
                XCTAssertEqual(composerMode, mode)
                expectation.fulfill()
            }

        viewModel.process(timelineAction: .setMode(mode: mode))

        wait(for: [expectation], timeout: 2.0)
        cancellable.cancel()
    }

    func testHandleKeyCommand() {
        XCTAssertTrue(viewModel.context.viewState.keyCommands.count == 1)
    }

    func testComposerFocusAfterEnablingRTE() {
        viewModel.process(viewAction: .enableTextFormatting)
        XCTAssertTrue(viewModel.state.bindings.composerFocused)
    }

    func testRTEEnabledAfterSendingMessage() {
        viewModel.process(viewAction: .enableTextFormatting)
        XCTAssertTrue(viewModel.state.bindings.composerFocused)
        viewModel.state.composerEmpty = false
        viewModel.process(viewAction: .sendMessage)
        XCTAssertTrue(viewModel.state.bindings.composerFormattingEnabled)
    }

    func testAlertIsShownAfterLinkAction() {
        XCTAssertNil(viewModel.state.bindings.alertInfo)
        viewModel.process(viewAction: .enableTextFormatting)
        viewModel.process(viewAction: .composerAction(action: .link))
        XCTAssertNotNil(viewModel.state.bindings.alertInfo)
    }
    
    func testSuggestions() {
        let suggestions: [SuggestionItem] = [.init(suggestionType: .user(.init(id: "@user_mention_1:matrix.org", displayName: "User 1", avatarURL: nil)), range: .init(), rawSuggestionText: ""),
                                             .init(suggestionType: .user(.init(id: "@user_mention_2:matrix.org", displayName: "User 2", avatarURL: nil)), range: .init(), rawSuggestionText: "")]
        let mockCompletionSuggestionService = CompletionSuggestionServiceMock(configuration: .init(suggestions: suggestions))
        
        viewModel = ComposerToolbarViewModel(roomProxy: JoinedRoomProxyMock(.init()),
                                             wysiwygViewModel: wysiwygViewModel,
                                             completionSuggestionService: mockCompletionSuggestionService,
                                             mediaProvider: MediaProviderMock(configuration: .init()),
                                             mentionDisplayHelper: ComposerMentionDisplayHelper.mock,
                                             appSettings: ServiceLocator.shared.settings,
                                             analyticsService: ServiceLocator.shared.analytics,
                                             composerDraftService: draftServiceMock)
        
        XCTAssertEqual(viewModel.state.suggestions, suggestions)
    }
    
    func testSuggestionTrigger() async throws {
        let deferred = deferFulfillment(wysiwygViewModel.$attributedContent) { $0.plainText == "#room-alias-test" }
        wysiwygViewModel.setMarkdownContent("@user-test")
        wysiwygViewModel.setMarkdownContent("#room-alias-test")
        try await deferred.fulfill()
        
        // The first one is nil because when initialised the view model is empty
        XCTAssertEqual(completionSuggestionServiceMock.setSuggestionTriggerReceivedInvocations, [nil,
                                                                                                 .init(type: .user, text: "user-test", range: .init(location: 0, length: 10)),
                                                                                                 .init(type: .room, text: "room-alias-test",
                                                                                                       range: .init(location: 0, length: 16))])
    }
    
    func testSelectedUserSuggestion() {
        let suggestion = SuggestionItem(suggestionType: .user(.init(id: "@test:matrix.org", displayName: "Test", avatarURL: nil)), range: .init(), rawSuggestionText: "")
        viewModel.context.send(viewAction: .selectedSuggestion(suggestion))
        
        // The display name can be used for HTML injection in the rich text editor and it's useless anyway as the clients don't use it when resolving display names
        XCTAssertEqual(wysiwygViewModel.content.html, "<a href=\"https://matrix.to/#/@test:matrix.org\">@test:matrix.org</a> ")
    }
    
    func testSelectedRoomSuggestion() {
        let suggestion = SuggestionItem(suggestionType: .room(.init(id: "!room:matrix.org",
                                                                    canonicalAlias: "#room-alias:matrix.org",
                                                                    name: "Room",
                                                                    avatar: .room(id: "!room:matrix.org",
                                                                                  name: "Room",
                                                                                  avatarURL: nil))),
                                        range: .init(), rawSuggestionText: "")
        viewModel.context.send(viewAction: .selectedSuggestion(suggestion))
        
        // The display name can be used for HTML injection in the rich text editor and it's useless anyway as the clients don't use it when resolving display names

        XCTAssertEqual(wysiwygViewModel.content.html, "<a href=\"https://matrix.to/#/%23room-alias:matrix.org\">#room-alias:matrix.org</a> ")
    }
    
    func testAllUsersSuggestion() {
        let suggestion = SuggestionItem(suggestionType: .allUsers(.room(id: "", name: nil, avatarURL: nil)), range: .init(), rawSuggestionText: "")
        viewModel.context.send(viewAction: .selectedSuggestion(suggestion))
        
        var string = "@room"
        // swiftlint:disable:next force_unwrapping
        string.unicodeScalars.append(UnicodeScalar(String.nbsp)!)
        XCTAssertEqual(wysiwygViewModel.content.html, string)
    }
    
    func testUserMentionPillInRTE() async {
        viewModel.context.send(viewAction: .composerAppeared)
        await Task.yield()
        let userID = "@test:matrix.org"
        let suggestion = SuggestionItem(suggestionType: .user(.init(id: userID, displayName: "Test", avatarURL: nil)), range: .init(), rawSuggestionText: "")
        viewModel.context.send(viewAction: .selectedSuggestion(suggestion))
        
        let attachment = wysiwygViewModel.textView.attributedText.attribute(.attachment, at: 0, effectiveRange: nil) as? PillTextAttachment
        XCTAssertEqual(attachment?.pillData?.type, .user(userID: userID))
    }
    
    func testRoomMentionPillInRTE() async {
        viewModel.context.send(viewAction: .composerAppeared)
        await Task.yield()
        let roomAlias = "#test:matrix.org"
        let suggestion = SuggestionItem(suggestionType: .room(.init(id: "room-id", canonicalAlias: roomAlias, name: "Room", avatar: .room(id: "room-id", name: "Room", avatarURL: nil))), range: .init(), rawSuggestionText: "")
        viewModel.context.send(viewAction: .selectedSuggestion(suggestion))
        
        let attachment = wysiwygViewModel.textView.attributedText.attribute(.attachment, at: 0, effectiveRange: nil) as? PillTextAttachment
        XCTAssertEqual(attachment?.pillData?.type, .roomAlias(roomAlias))
    }
    
    func testAllUsersMentionPillInRTE() async {
        viewModel.context.send(viewAction: .composerAppeared)
        await Task.yield()
        let suggestion = SuggestionItem(suggestionType: .allUsers(.room(id: "", name: nil, avatarURL: nil)), range: .init(), rawSuggestionText: "")
        viewModel.context.send(viewAction: .selectedSuggestion(suggestion))
        
        let attachment = wysiwygViewModel.textView.attributedText.attribute(.attachment, at: 0, effectiveRange: nil) as? PillTextAttachment
        XCTAssertEqual(attachment?.pillData?.type, .allUsers)
    }
    
    func testIntentionalMentions() async throws {
        wysiwygViewModel.setHtmlContent(
            """
            <p>Hello @room \
            and especially hello to <a href=\"https://matrix.to/#/@test:matrix.org\">Test</a></p>
            """
        )
        
        let deferred = deferFulfillment(viewModel.actions) { action in
            switch action {
            case let .sendMessage(_, _, _, intentionalMentions):
                return intentionalMentions == IntentionalMentions(userIDs: ["@test:matrix.org"], atRoom: true)
            default:
                return false
            }
        }
        viewModel.context.send(viewAction: .sendMessage)
        
        try await deferred.fulfill()
    }
    
    // MARK: - Draft
    
    func testSaveDraftPlainText() async {
        let expectation = expectation(description: "Wait for draft to be saved")
        draftServiceMock.saveDraftClosure = { draft in
            XCTAssertEqual(draft.plainText, "Hello world!")
            XCTAssertNil(draft.htmlText)
            XCTAssertEqual(draft.draftType, .newMessage)
            defer { expectation.fulfill() }
            return .success(())
        }
        
        viewModel.context.composerFormattingEnabled = false
        viewModel.context.plainComposerText = .init(string: "Hello world!")
        viewModel.saveDraft()
        
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertEqual(draftServiceMock.saveDraftCallsCount, 1)
        XCTAssertFalse(draftServiceMock.clearDraftCalled)
        XCTAssertFalse(draftServiceMock.loadDraftCalled)
    }
    
    func testSaveDraftFormattedText() async {
        let expectation = expectation(description: "Wait for draft to be saved")
        draftServiceMock.saveDraftClosure = { draft in
            XCTAssertEqual(draft.plainText, "__Hello__ world!")
            XCTAssertEqual(draft.htmlText, "<strong>Hello</strong> world!")
            XCTAssertEqual(draft.draftType, .newMessage)
            defer { expectation.fulfill() }
            return .success(())
        }
        
        viewModel.context.composerFormattingEnabled = true
        wysiwygViewModel.setHtmlContent("<strong>Hello</strong> world!")
        viewModel.saveDraft()
        
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertEqual(draftServiceMock.saveDraftCallsCount, 1)
        XCTAssertFalse(draftServiceMock.clearDraftCalled)
        XCTAssertFalse(draftServiceMock.loadDraftCalled)
    }
    
    func testSaveDraftEdit() async {
        let expectation = expectation(description: "Wait for draft to be saved")
        draftServiceMock.saveDraftClosure = { draft in
            XCTAssertEqual(draft.plainText, "Hello world!")
            XCTAssertNil(draft.htmlText)
            XCTAssertEqual(draft.draftType, .edit(eventID: "testID"))
            defer { expectation.fulfill() }
            return .success(())
        }
        
        viewModel.context.composerFormattingEnabled = false
        viewModel.process(timelineAction: .setMode(mode: .edit(originalEventOrTransactionID: .eventID("testID"), type: .default)))
        viewModel.context.plainComposerText = .init(string: "Hello world!")
        viewModel.saveDraft()
        
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertEqual(draftServiceMock.saveDraftCallsCount, 1)
        XCTAssertFalse(draftServiceMock.clearDraftCalled)
        XCTAssertFalse(draftServiceMock.loadDraftCalled)
    }
    
    func testSaveDraftReply() async {
        let expectation = expectation(description: "Wait for draft to be saved")
        draftServiceMock.saveDraftClosure = { draft in
            XCTAssertEqual(draft.plainText, "Hello world!")
            XCTAssertNil(draft.htmlText)
            XCTAssertEqual(draft.draftType, .reply(eventID: "testID"))
            defer { expectation.fulfill() }
            return .success(())
        }
        
        viewModel.context.composerFormattingEnabled = false
        viewModel.process(timelineAction: .setMode(mode: .reply(eventID: "testID",
                                                                replyDetails: .loaded(sender: .init(id: ""),
                                                                                      eventID: "testID",
                                                                                      eventContent: .message(.text(.init(body: "reply text")))),
                                                                isThread: false)))
        viewModel.context.plainComposerText = .init(string: "Hello world!")
        viewModel.saveDraft()
        
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertEqual(draftServiceMock.saveDraftCallsCount, 1)
        XCTAssertFalse(draftServiceMock.clearDraftCalled)
        XCTAssertFalse(draftServiceMock.loadDraftCalled)
    }
    
    func testSaveDraftWhenEmptyReply() async {
        let expectation = expectation(description: "Wait for draft to be saved")
        draftServiceMock.saveDraftClosure = { draft in
            XCTAssertEqual(draft.plainText, "")
            XCTAssertNil(draft.htmlText)
            XCTAssertEqual(draft.draftType, .reply(eventID: "testID"))
            defer { expectation.fulfill() }
            return .success(())
        }
        
        viewModel.context.composerFormattingEnabled = false
        viewModel.process(timelineAction: .setMode(mode: .reply(eventID: "testID",
                                                                replyDetails: .loaded(sender: .init(id: ""),
                                                                                      eventID: "testID",
                                                                                      eventContent: .message(.text(.init(body: "reply text")))),
                                                                isThread: false)))
        viewModel.saveDraft()
        
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertEqual(draftServiceMock.saveDraftCallsCount, 1)
        XCTAssertFalse(draftServiceMock.clearDraftCalled)
        XCTAssertFalse(draftServiceMock.loadDraftCalled)
    }
    
    func testClearDraftWhenEmptyNormalMessage() async {
        let expectation = expectation(description: "Wait for draft to be cleared")
        draftServiceMock.clearDraftClosure = {
            defer { expectation.fulfill() }
            return .success(())
        }
        
        viewModel.context.composerFormattingEnabled = false
        viewModel.saveDraft()
        
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertFalse(draftServiceMock.saveDraftCalled)
        XCTAssertEqual(draftServiceMock.clearDraftCallsCount, 1)
        XCTAssertFalse(draftServiceMock.loadDraftCalled)
    }
    
    func testClearDraftForNonTextMode() async {
        let expectation = expectation(description: "Wait for draft to be cleared")
        draftServiceMock.clearDraftClosure = {
            defer { expectation.fulfill() }
            return .success(())
        }
        
        viewModel.context.composerFormattingEnabled = false
        let waveformData: [Float] = Array(repeating: 1.0, count: 1000)
        viewModel.context.plainComposerText = .init(string: "Hello world!")
        viewModel.process(timelineAction: .setMode(mode: .previewVoiceMessage(state: AudioPlayerState(id: .recorderPreview, title: "", duration: 10.0),
                                                                              waveform: .data(waveformData),
                                                                              isUploading: false)))
        viewModel.saveDraft()

        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertFalse(draftServiceMock.saveDraftCalled)
        XCTAssertEqual(draftServiceMock.clearDraftCallsCount, 1)
        XCTAssertFalse(draftServiceMock.loadDraftCalled)
    }
    
    func testNothingToRestore() async {
        viewModel.context.composerFormattingEnabled = false
        let expectation = expectation(description: "Wait for draft to be restored")
        draftServiceMock.loadDraftClosure = {
            defer { expectation.fulfill() }
            return .success(nil)
        }
        
        await viewModel.loadDraft()
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertFalse(viewModel.context.composerFormattingEnabled)
        XCTAssertTrue(viewModel.state.composerEmpty)
        XCTAssertEqual(viewModel.state.composerMode, .default)
    }
    
    func testRestoreNormalPlainTextMessage() async {
        viewModel.context.composerFormattingEnabled = false
        let expectation = expectation(description: "Wait for draft to be restored")
        draftServiceMock.loadDraftClosure = {
            defer { expectation.fulfill() }
            return .success(.init(plainText: "Hello world!",
                                  htmlText: nil,
                                  draftType: .newMessage))
        }
        await viewModel.loadDraft()
        
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertFalse(viewModel.context.composerFormattingEnabled)
        XCTAssertEqual(viewModel.state.composerMode, .default)
        XCTAssertEqual(viewModel.context.plainComposerText, NSAttributedString(string: "Hello world!"))
    }
    
    func testRestoreNormalFormattedTextMessage() async {
        viewModel.context.composerFormattingEnabled = false
        let expectation = expectation(description: "Wait for draft to be restored")
        draftServiceMock.loadDraftClosure = {
            defer { expectation.fulfill() }
            return .success(.init(plainText: "__Hello__ world!",
                                  htmlText: "<strong>Hello</strong> world!",
                                  draftType: .newMessage))
        }
        await viewModel.loadDraft()
        
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertTrue(viewModel.context.composerFormattingEnabled)
        XCTAssertEqual(viewModel.state.composerMode, .default)
        XCTAssertEqual(wysiwygViewModel.content.html, "<strong>Hello</strong> world!")
        XCTAssertEqual(wysiwygViewModel.content.markdown, "__Hello__ world!")
    }
    
    func testRestoreEdit() async {
        viewModel.context.composerFormattingEnabled = false
        let expectation = expectation(description: "Wait for draft to be restored")
        draftServiceMock.loadDraftClosure = {
            defer { expectation.fulfill() }
            return .success(.init(plainText: "Hello world!",
                                  htmlText: nil,
                                  draftType: .edit(eventID: "testID")))
        }
        await viewModel.loadDraft()
        
        await fulfillment(of: [expectation], timeout: 10)
        XCTAssertFalse(viewModel.context.composerFormattingEnabled)
        XCTAssertEqual(viewModel.state.composerMode, .edit(originalEventOrTransactionID: .eventID("testID"), type: .default))
        XCTAssertEqual(viewModel.context.plainComposerText, NSAttributedString(string: "Hello world!"))
    }
    
    func testRestoreReply() async {
        let testEventID = "testID"
        let text = "Hello world!"
        let loadedReply = TimelineItemReplyDetails.loaded(sender: .init(id: "userID",
                                                                        displayName: "Username"),
                                                          eventID: testEventID,
                                                          eventContent: .message(.text(.init(body: "Reply text"))))
        
        viewModel.context.composerFormattingEnabled = false
        let draftExpectation = expectation(description: "Wait for draft to be restored")
        draftServiceMock.loadDraftClosure = {
            defer { draftExpectation.fulfill() }
            return .success(.init(plainText: text,
                                  htmlText: nil,
                                  draftType: .reply(eventID: testEventID)))
        }
        
        let loadReplyExpectation = expectation(description: "Wait for reply to be loaded")
        draftServiceMock.getReplyEventIDClosure = { eventID in
            defer { loadReplyExpectation.fulfill() }
            XCTAssertEqual(eventID, testEventID)
            try? await Task.sleep(for: .seconds(1))
            return .success(.init(details: loadedReply,
                                  isThreaded: true))
        }
        await viewModel.loadDraft()
        
        await fulfillment(of: [draftExpectation], timeout: 10)
        XCTAssertFalse(viewModel.context.composerFormattingEnabled)
        // Testing the loading state first
        XCTAssertEqual(viewModel.state.composerMode, .reply(eventID: testEventID,
                                                            replyDetails: .loading(eventID: testEventID),
                                                            isThread: false))
        XCTAssertEqual(viewModel.context.plainComposerText, NSAttributedString(string: text))
        
        await fulfillment(of: [loadReplyExpectation], timeout: 10)
        XCTAssertEqual(viewModel.state.composerMode, .reply(eventID: testEventID,
                                                            replyDetails: loadedReply,
                                                            isThread: true))
    }
    
    func testRestoreReplyAndCancelReplyMode() async {
        let testEventID = "testID"
        let text = "Hello world!"
        let loadedReply = TimelineItemReplyDetails.loaded(sender: .init(id: "userID", displayName: "Username"),
                                                          eventID: testEventID,
                                                          eventContent: .message(.text(.init(body: "Reply text"))))
        
        viewModel.context.composerFormattingEnabled = false
        let draftExpectation = expectation(description: "Wait for draft to be restored")
        draftServiceMock.loadDraftClosure = {
            defer { draftExpectation.fulfill() }
            return .success(.init(plainText: text,
                                  htmlText: nil,
                                  draftType: .reply(eventID: testEventID)))
        }
        
        let loadReplyExpectation = expectation(description: "Wait for reply to be loaded")
        draftServiceMock.getReplyEventIDClosure = { eventID in
            defer { loadReplyExpectation.fulfill() }
            XCTAssertEqual(eventID, testEventID)
            try? await Task.sleep(for: .seconds(1))
            return .success(.init(details: loadedReply,
                                  isThreaded: true))
        }
        await viewModel.loadDraft()
        
        await fulfillment(of: [draftExpectation], timeout: 10)
        XCTAssertFalse(viewModel.context.composerFormattingEnabled)
        // Testing the loading state first
        XCTAssertEqual(viewModel.state.composerMode, .reply(eventID: testEventID,
                                                            replyDetails: .loading(eventID: testEventID),
                                                            isThread: false))
        XCTAssertEqual(viewModel.context.plainComposerText, NSAttributedString(string: text))
        
        // Now we change the state to cancel the reply mode update
        viewModel.process(viewAction: .cancelReply)
        await fulfillment(of: [loadReplyExpectation], timeout: 10)
        XCTAssertEqual(viewModel.state.composerMode, .default)
    }
    
    func testSaveVolatileDraftWhenEditing() {
        viewModel.context.composerFormattingEnabled = false
        viewModel.context.plainComposerText = .init(string: "Hello world!")
        viewModel.process(timelineAction: .setMode(mode: .edit(originalEventOrTransactionID: .eventID(UUID().uuidString), type: .default)))
        
        let draft = draftServiceMock.saveVolatileDraftReceivedDraft
        XCTAssertNotNil(draft)
        XCTAssertEqual(draft?.plainText, "Hello world!")
        XCTAssertNil(draft?.htmlText)
        XCTAssertEqual(draft?.draftType, .newMessage)
    }
    
    func testRestoreVolatileDraftWhenCancellingEdit() async {
        let expectation = expectation(description: "Wait for draft to be restored")
        draftServiceMock.loadVolatileDraftClosure = {
            defer { expectation.fulfill() }
            return .init(plainText: "Hello world",
                         htmlText: nil,
                         draftType: .newMessage)
        }
        
        viewModel.process(viewAction: .cancelEdit)
        await fulfillment(of: [expectation])
        XCTAssertEqual(viewModel.context.plainComposerText, NSAttributedString(string: "Hello world"))
    }
    
    func testRestoreVolatileDraftWhenClearing() async {
        let expectation1 = expectation(description: "Wait for draft to be restored")
        draftServiceMock.loadVolatileDraftClosure = {
            defer { expectation1.fulfill() }
            return .init(plainText: "Hello world",
                         htmlText: nil,
                         draftType: .newMessage)
        }
        
        let expectation2 = expectation(description: "The draft should also be cleared after being loaded")
        draftServiceMock.clearVolatileDraftClosure = {
            expectation2.fulfill()
        }
        
        viewModel.process(timelineAction: .clear)
        await fulfillment(of: [expectation1, expectation2])
        XCTAssertEqual(viewModel.context.plainComposerText, NSAttributedString(string: "Hello world"))
    }
    
    func testRestoreVolatileDraftDoubleClear() async {
        let expectation1 = expectation(description: "Wait for draft to be restored")
        draftServiceMock.loadVolatileDraftClosure = {
            defer { expectation1.fulfill() }
            return .init(plainText: "Hello world",
                         htmlText: nil,
                         draftType: .newMessage)
        }
        
        let expectation2 = expectation(description: "The draft should also be cleared after being loaded")
        draftServiceMock.clearVolatileDraftClosure = {
            expectation2.fulfill()
        }
        
        viewModel.process(timelineAction: .clear)
        await fulfillment(of: [expectation1, expectation2])
        XCTAssertEqual(viewModel.context.plainComposerText, NSAttributedString(string: "Hello world"))
    }
    
    func testRestoreUserMentionInPlainText() async throws {
        viewModel.context.composerFormattingEnabled = false
        let text = "Hello [TestName](https://matrix.to/#/@test:matrix.org)!"
        viewModel.process(timelineAction: .setText(plainText: text, htmlText: nil))
        
        let deferred = deferFulfillment(viewModel.actions) { action in
            switch action {
            case let .sendMessage(plainText, _, _, intentionalMentions):
                // As of right now the markdown loses the display name when restored
                return plainText == "Hello [@test:matrix.org](https://matrix.to/#/@test:matrix.org)!" &&
                    intentionalMentions == IntentionalMentions(userIDs: ["@test:matrix.org"], atRoom: false)
            default:
                return false
            }
        }
        
        viewModel.process(viewAction: .sendMessage)
        try await deferred.fulfill()
    }
    
    func testRestoreAllUsersMentionInPlainText() async throws {
        viewModel.context.composerFormattingEnabled = false
        let text = "Hello @room"
        viewModel.process(timelineAction: .setText(plainText: text, htmlText: nil))

        let deferred = deferFulfillment(viewModel.actions) { action in
            switch action {
            case let .sendMessage(plainText, _, _, intentionalMentions):
                return plainText == "Hello @room" &&
                    intentionalMentions == IntentionalMentions(userIDs: [], atRoom: true)
            default:
                return false
            }
        }
        
        viewModel.process(viewAction: .sendMessage)
        try await deferred.fulfill()
    }
    
    func testRestoreMixedMentionsInPlainText() async throws {
        viewModel.context.composerFormattingEnabled = false
        let text = "Hello [User1](https://matrix.to/#/@user1:matrix.org), [User2](https://matrix.to/#/@user2:matrix.org) and @room"
        viewModel.process(timelineAction: .setText(plainText: text, htmlText: nil))
        
        let deferred = deferFulfillment(viewModel.actions) { action in
            switch action {
            case let .sendMessage(plainText, _, _, intentionalMentions):
                // As of right now the markdown loses the display name when restored
                return plainText == "Hello [@user1:matrix.org](https://matrix.to/#/@user1:matrix.org), [@user2:matrix.org](https://matrix.to/#/@user2:matrix.org) and @room" &&
                    intentionalMentions == IntentionalMentions(userIDs: ["@user1:matrix.org", "@user2:matrix.org"], atRoom: true)
            default:
                return false
            }
        }
        
        viewModel.process(viewAction: .sendMessage)
        try await deferred.fulfill()
    }
    
    func testRestoreAmbiguousMention() async throws {
        viewModel.context.composerFormattingEnabled = false
        let text = "Hello [User1](https://matrix.to/#/@roomuser:matrix.org)"
        viewModel.process(timelineAction: .setText(plainText: text, htmlText: nil))
        
        let deferred = deferFulfillment(viewModel.actions) { action in
            switch action {
            case let .sendMessage(plainText, _, _, intentionalMentions):
                // As of right now the markdown loses the display name when restored
                return plainText == "Hello [@roomuser:matrix.org](https://matrix.to/#/@roomuser:matrix.org)" &&
                    intentionalMentions == IntentionalMentions(userIDs: ["@roomuser:matrix.org"], atRoom: false)
            default:
                return false
            }
        }
        
        viewModel.process(viewAction: .sendMessage)
        try await deferred.fulfill()
    }
    
    func testRestoreDoesntOverwriteInitialText() async {
        let sharedText = "Some shared text"
        let expectation = expectation(description: "Wait for draft to be restored")
        expectation.isInverted = true
        setUpViewModel(initialText: sharedText) {
            defer { expectation.fulfill() }
            return .success(.init(plainText: "Hello world!",
                                  htmlText: nil,
                                  draftType: .newMessage))
        }
        viewModel.context.composerFormattingEnabled = false
        await viewModel.loadDraft()
        
        await fulfillment(of: [expectation], timeout: 1)
        XCTAssertFalse(viewModel.context.composerFormattingEnabled)
        XCTAssertEqual(viewModel.state.composerMode, .default)
        XCTAssertEqual(viewModel.context.plainComposerText, NSAttributedString(string: sharedText))
    }
    
    // MARK: - Identity Violation
    
    func testVerificationViolationDisablesComposer() async throws {
        let mockCompletionSuggestionService = CompletionSuggestionServiceMock(configuration: .init())
        
        let roomProxyMock = JoinedRoomProxyMock(.init(name: "Test"))
        
        let roomMemberProxyMock = RoomMemberProxyMock(with: .init(userID: "@alice:localhost", membership: .join))
        roomProxyMock.getMemberUserIDClosure = { _ in
            .success(roomMemberProxyMock)
        }
    
        let mockSubject = CurrentValueSubject<[IdentityStatusChange], Never>([])
        roomProxyMock.underlyingIdentityStatusChangesPublisher = mockSubject.asCurrentValuePublisher()
        
        viewModel = ComposerToolbarViewModel(roomProxy: roomProxyMock,
                                             wysiwygViewModel: wysiwygViewModel,
                                             completionSuggestionService: mockCompletionSuggestionService,
                                             mediaProvider: MediaProviderMock(configuration: .init()),
                                             mentionDisplayHelper: ComposerMentionDisplayHelper.mock,
                                             appSettings: ServiceLocator.shared.settings,
                                             analyticsService: ServiceLocator.shared.analytics,
                                             composerDraftService: draftServiceMock)
        
        var fulfillment = deferFulfillment(viewModel.context.$viewState, message: "Composer is disabled") { $0.canSend == false }
        mockSubject.send([IdentityStatusChange(userId: "@alice:localhost", changedTo: .verificationViolation)])
        try await fulfillment.fulfill()
        
        fulfillment = deferFulfillment(viewModel.context.$viewState, message: "Composer is enabled") { $0.canSend == true }
        mockSubject.send([IdentityStatusChange(userId: "@alice:localhost", changedTo: .pinned)])
        try await fulfillment.fulfill()
    }
    
    func testMultipleViolation() async throws {
        let mockCompletionSuggestionService = CompletionSuggestionServiceMock(configuration: .init())
        
        let roomProxyMock = JoinedRoomProxyMock(.init(name: "Test"))
        
        let aliceRoomMemberProxyMock = RoomMemberProxyMock(with: .init(userID: "@alice:localhost", membership: .join))
        let bobRoomMemberProxyMock = RoomMemberProxyMock(with: .init(userID: "@bob:localhost", membership: .join))
        
        roomProxyMock.getMemberUserIDClosure = { userId in
            if userId == "@alice:localhost" {
                return .success(aliceRoomMemberProxyMock)
            } else if userId == "@bob:localhost" {
                return .success(bobRoomMemberProxyMock)
            } else {
                return .failure(.sdkError(ClientProxyMockError.generic))
            }
        }
    
        // There are 2 violations, ensure that resolving the first one is not enough
        let mockSubject = CurrentValueSubject<[IdentityStatusChange], Never>([
            IdentityStatusChange(userId: "@alice:localhost", changedTo: .verificationViolation),
            IdentityStatusChange(userId: "@bob:localhost", changedTo: .verificationViolation)
        ])
        
        roomProxyMock.underlyingIdentityStatusChangesPublisher = mockSubject.asCurrentValuePublisher()
        
        viewModel = ComposerToolbarViewModel(roomProxy: roomProxyMock,
                                             wysiwygViewModel: wysiwygViewModel,
                                             completionSuggestionService: mockCompletionSuggestionService,
                                             mediaProvider: MediaProviderMock(configuration: .init()),
                                             mentionDisplayHelper: ComposerMentionDisplayHelper.mock,
                                             appSettings: ServiceLocator.shared.settings,
                                             analyticsService: ServiceLocator.shared.analytics,
                                             composerDraftService: draftServiceMock)
        
        var fulfillment = deferFulfillment(viewModel.context.$viewState, message: "Composer is disabled") { $0.canSend == false }
        mockSubject.send([IdentityStatusChange(userId: "@alice:localhost", changedTo: .verificationViolation)])
        try await fulfillment.fulfill()
        
        fulfillment = deferFulfillment(viewModel.context.$viewState, message: "Composer is still disabled") { $0.canSend == false }
        mockSubject.send([IdentityStatusChange(userId: "@alice:localhost", changedTo: .pinned)])
        try await fulfillment.fulfill()
        
        fulfillment = deferFulfillment(viewModel.context.$viewState, message: "Composer is now enabled") { $0.canSend == true }
        mockSubject.send([IdentityStatusChange(userId: "@bob:localhost", changedTo: .pinned)])
        try await fulfillment.fulfill()
    }
    
    func testPinViolationDoesNotDisableComposer() {
        let mockCompletionSuggestionService = CompletionSuggestionServiceMock(configuration: .init())
        
        let roomProxyMock = JoinedRoomProxyMock(.init(name: "Test"))
        let roomMemberProxyMock = RoomMemberProxyMock(with: .init(userID: "@alice:localhost", membership: .join))
        
        roomProxyMock.getMemberUserIDClosure = { _ in
            .success(roomMemberProxyMock)
        }
        
        roomProxyMock.underlyingIdentityStatusChangesPublisher = CurrentValueSubject([IdentityStatusChange(userId: "@alice:localhost", changedTo: .pinViolation)]).asCurrentValuePublisher()
        
        viewModel = ComposerToolbarViewModel(roomProxy: roomProxyMock,
                                             wysiwygViewModel: wysiwygViewModel,
                                             completionSuggestionService: mockCompletionSuggestionService,
                                             mediaProvider: MediaProviderMock(configuration: .init()),
                                             mentionDisplayHelper: ComposerMentionDisplayHelper.mock,
                                             appSettings: ServiceLocator.shared.settings,
                                             analyticsService: ServiceLocator.shared.analytics,
                                             composerDraftService: draftServiceMock)
        
        let expectation = expectation(description: "Composer should be enabled")
        let cancellable = viewModel
            .context
            .$viewState
            .map(\.canSend)
            .sink { canSend in
                if canSend {
                    expectation.fulfill()
                }
            }
        
        wait(for: [expectation], timeout: 2.0)
        cancellable.cancel()
    }
    
    // MARK: - Helpers
    
    private func setUpViewModel(initialText: String? = nil, loadDraftClosure: (() async -> Result<ComposerDraftProxy?, ComposerDraftServiceError>)? = nil) {
        wysiwygViewModel = WysiwygComposerViewModel()
        completionSuggestionServiceMock = CompletionSuggestionServiceMock(configuration: .init())
        draftServiceMock = ComposerDraftServiceMock(.init())
        if let loadDraftClosure {
            draftServiceMock.loadDraftClosure = loadDraftClosure
        }
        
        viewModel = ComposerToolbarViewModel(initialText: initialText,
                                             roomProxy: JoinedRoomProxyMock(.init()),
                                             wysiwygViewModel: wysiwygViewModel,
                                             completionSuggestionService: completionSuggestionServiceMock,
                                             mediaProvider: MediaProviderMock(configuration: .init()),
                                             mentionDisplayHelper: ComposerMentionDisplayHelper.mock,
                                             appSettings: ServiceLocator.shared.settings,
                                             analyticsService: ServiceLocator.shared.analytics,
                                             composerDraftService: draftServiceMock)
        viewModel.context.composerFormattingEnabled = true
    }
}
