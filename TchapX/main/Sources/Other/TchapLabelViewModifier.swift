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
//  TchapLabelViewModifier.swift
//  TchapX
//
//  Created by Nicolas Buquet on 15/01/2025.
//  Copyright © 2025 Tchap. All rights reserved.
//

import Compound
import SwiftUI

public struct TchapLabelViewModifier: ViewModifier {
    let font: Font
    let usage: Usage
    
    public enum Usage {
        case userIsExternal
        
        var colors: (foregroundColor: Color, backgroundColor: Color) {
            switch self {
            case .userIsExternal: (foregroundColor: CompoundCoreColorTokens.orange1200, backgroundColor: CompoundCoreColorTokens.orange400)
            }
        }
    }
    
    public func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(usage.colors.foregroundColor)
            .padding(EdgeInsets(top: 2.0, leading: 8.0, bottom: 2.0, trailing: 8.0))
            .background(usage.colors.backgroundColor.opacity(1.0), in: Capsule())
    }
}

extension View {
    func tchapExternalLabelView() -> some View {
        modifier(TchapLabelViewModifier(font: .compound.bodySMSemibold, usage: .userIsExternal))
    }
}

#Preview {
    Text("I'm an external")
        .tchapExternalLabelView()
}
