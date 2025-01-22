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

    struct SettingsScreen {
        let faq = "settings-faq"
    }
    
    struct StartChatScreen {
        let joinForum = "start_chat-join-forum"
    }
}
