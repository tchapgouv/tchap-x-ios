/*
 * MIT License
 *
 * Copyright (c) 2024. DINUM
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

//
//  TchapAccessibilityIdentifiers.swift
//  TchapX
//
//  Created by Nicolas Buquet on 06/01/2025.
//  Copyright © 2025 Tchap. All rights reserved.
//

import Foundation

enum TchapA11yIdentifiers {
    static let settingsScreen = SettingsScreen()
    static let startChatScreen = TchapA11yIdentifiers.StartChatScreen()
    static let scanStates = ScanStates()

    struct SettingsScreen {
        let faq = "settings-faq"
    }
    
    struct StartChatScreen {
        let joinForum = "start_chat-join-forum"
    }
    
    struct ScanStates {
        let infected = "scan_state-infected"
        let inProgress = "scan_state-inprogress"
        let error = "scan_state-error"
        let notFound = "scan_state-notfound"
        let trusted = "scan_state-trusted"
    }
}
