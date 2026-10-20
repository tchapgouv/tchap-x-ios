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

// :tchap: `isEmailAddress` only exists in the TchapX target.
#if IS_TCHAP_UNIT_TESTS
@testable import TchapX_Production
import Testing

struct StringTchapTests {
    @Test(arguments: [
        "alice@example.fr",
        "alice.dupont@beta.gouv.fr",
        "alice+tag@sub.domain.example.org",
        "alice_dupont-1@example-site.fr",
        "a@b.c"
    ])
    func validEmailAddresses(email: String) {
        #expect(email.isEmailAddress)
    }
    
    @Test(arguments: [
        "",
        "alice",
        "alice@",
        "@example.fr",
        "alice@example",
        "alice@localhost",
        "alice@example.",
        "alice@.example.fr",
        "alice..dupont@example.fr",
        "alice@exam ple.fr",
        "alice@example.fr@example.fr",
        "alicé@example.fr",
        "alice@éxample.fr"
    ])
    func invalidEmailAddresses(email: String) {
        #expect(!email.isEmailAddress)
    }
    
    @Test(arguments: [
        " alice@example.fr",
        "alice@example.fr ",
        " alice@example.fr ",
        "alice@example.fr\n"
    ])
    func surroundingWhitespaceIsNotAnEmailAddress(email: String) {
        #expect(!email.isEmailAddress)
    }
}
#endif
