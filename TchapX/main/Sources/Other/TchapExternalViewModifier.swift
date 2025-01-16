//
//  TchapExternalViewModifier.swift
//  TchapX
//
//  Created by Nicolas Buquet on 15/01/2025.
//  Copyright © 2025 Tchap. All rights reserved.
//

import Compound
import SwiftUI

private struct TchapExternalViewModifier: ViewModifier {
    let font: Font
    let foregroundColor: Color
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(foregroundColor)
            .padding(EdgeInsets(top: 2.0, leading: 8.0, bottom: 3.0, trailing: 8.0))
            .background(backgroundColor, in: Capsule())
    }
}

extension View {
    func tchapExternalDisplay() -> some View {
        modifier(TchapExternalViewModifier(font: .compound.bodySMSemibold,
                                           foregroundColor: CompoundCoreColorTokens.blue1000,
                                           backgroundColor: CompoundCoreColorTokens.blue400))
    }
    
    func tchapRoomPropertiesDisplay() -> some View {
        modifier(TchapExternalViewModifier(font: .system(size: 10.0).bold(),
                                           foregroundColor: CompoundCoreColorTokens.red1000,
                                           backgroundColor: CompoundCoreColorTokens.red400))
    }
}

#Preview {
    Text("I'm an external")
        .tchapExternalDisplay()
}
