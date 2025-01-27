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
