//
//  TchapExternalViewModifier.swift
//  TchapX
//
//  Created by Nicolas Buquet on 15/01/2025.
//  Copyright © 2025 Tchap. All rights reserved.
//

import Compound
import SwiftUI

struct TchapExternalViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.compound.bodySMSemibold)
            .foregroundColor(CompoundCoreColorTokens.blue1000)
            .padding(EdgeInsets(top: 2.0, leading: 8.0, bottom: 3.0, trailing: 8.0))
            .background(CompoundCoreColorTokens.blue400, in: Capsule())
    }
}

extension View {
    func tchapExternalDisplay() -> some View {
        modifier(TchapExternalViewModifier())
    }
}

#Preview {
    Text("I'm an external")
        .tchapExternalDisplay()
}
