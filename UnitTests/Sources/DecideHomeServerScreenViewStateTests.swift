/*
 * MIT License
 *
 * Copyright (c) 2026. DINUM
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
 * OR OTHER DEALINGS IN THE SOFTWARE.
 */

// :tchap: `DecideHomeServerScreen` only exists in the TchapX target.
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
import Testing

struct DecideHomeServerScreenViewStateTests {
    @Test
    func canSubmitWithValidEmail() {
        let viewState = makeViewState(username: "alice@gouv.fr")
        #expect(viewState.canSubmit)
    }
    
    @Test(arguments: [" alice@gouv.fr", "alice@gouv.fr ", "  alice@gouv.fr\n"])
    func canSubmitIgnoresSurroundingWhitespace(username: String) {
        let viewState = makeViewState(username: username)
        #expect(viewState.canSubmit)
        #expect(viewState.trimmedUsername == "alice@gouv.fr")
    }
    
    @Test(arguments: ["", "alice", "alice@localhost", "alice@exam ple.fr"])
    func cannotSubmitWithInvalidEmail(username: String) {
        let viewState = makeViewState(username: username)
        #expect(!viewState.canSubmit)
    }
    
    @Test
    func cannotSubmitWhileLoading() {
        var viewState = makeViewState(username: "alice@gouv.fr")
        viewState.isLoading = true
        #expect(!viewState.canSubmit)
    }
    
    @Test
    func cannotSubmitWhileUserInteractionIsBlocked() {
        var viewState = makeViewState(username: "alice@gouv.fr")
        viewState.blockUserInteraction = true
        #expect(!viewState.canSubmit)
    }
    
    // MARK: - Helpers
    
    private func makeViewState(username: String) -> DecideHomeServerScreenViewState {
        DecideHomeServerScreenViewState(bindings: DecideHomeServerScreenBindings(username: username),
                                        authenticationFlow: .login)
    }
}
#endif
