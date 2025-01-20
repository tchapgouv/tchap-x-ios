//
//  TchapExternalViewModifier.swift
//  TchapX
//
//  Created by Nicolas Buquet on 15/01/2025.
//  Copyright © 2025 Tchap. All rights reserved.
//

import Compound
import SwiftUI

private struct TchapLabelViewModifier: ViewModifier {
    let font: Font
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
            .padding(EdgeInsets(top: 2.0, leading: 8.0, bottom: 2.0, trailing: 8.0))
            .background(color.opacity(0.25), in: Capsule())
    }
}

extension View {
    func tchapExternalDisplay() -> some View {
        modifier(TchapLabelViewModifier(font: .compound.bodySMSemibold, color: CompoundCoreColorTokens.blue1000))
    }
    
    func tchapRoomPropertiesBadgeDisplay(color: Color) -> some View {
        modifier(TchapLabelViewModifier(font: .system(size: 10.0).bold(), color: color))
    }
}

#Preview {
    Text("I'm an external")
        .tchapExternalDisplay()
    Text("I'm encrypted")
        .tchapRoomPropertiesBadgeDisplay(color: .green)
    Text("I'm public")
        .tchapRoomPropertiesBadgeDisplay(color: .gray)
}
