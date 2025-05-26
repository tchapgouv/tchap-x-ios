//
//  Strings+Tchap.swift
//  TchapX
//
//  Created by Nicolas Buquet on 26/05/2025.
//  Copyright © 2025 Tchap. All rights reserved.
//

import Foundation

extension String {
    var isEmailAddress: Bool {
        // Email Regex comes from Element iOS.
        let emailRegex = try! Regex("^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:\\.[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$")
        let match = ranges(of: emailRegex)
        guard match.count == 1,
              let uniqueMatch = match.first,
              uniqueMatch.lowerBound == self.startIndex,
              uniqueMatch.upperBound == self.endIndex else {
            return false
        }
        return true
    }
}
