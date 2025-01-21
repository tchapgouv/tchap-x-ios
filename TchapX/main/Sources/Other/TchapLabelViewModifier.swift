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
        case roomIsEncrypted
        case roomIsNotEncrypted
        case roomIsPublic
        case roomIsAccessibleToExternals
        
        var colors: (foregroundColor: Color, backgroundColor: Color) {
            switch self {
            case .userIsExternal: (foregroundColor: CompoundCoreColorTokens.orange1200, backgroundColor: CompoundCoreColorTokens.orange400)
            case .roomIsEncrypted: (foregroundColor: CompoundCoreColorTokens.green1200, backgroundColor: CompoundCoreColorTokens.green400)
            case .roomIsNotEncrypted: (foregroundColor: CompoundCoreColorTokens.gray1200, backgroundColor: CompoundCoreColorTokens.gray400)
            case .roomIsPublic: (foregroundColor: CompoundCoreColorTokens.gray1200, backgroundColor: CompoundCoreColorTokens.gray400)
            case .roomIsAccessibleToExternals: (foregroundColor: CompoundCoreColorTokens.gray1200, backgroundColor: CompoundCoreColorTokens.gray400)
            default:
                (foregroundColor: CompoundCoreColorTokens.gray1200, backgroundColor: CompoundCoreColorTokens.gray400)
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
    func tchapLabelView(font: Font, usage: TchapLabelViewModifier.Usage) -> some View {
        modifier(TchapLabelViewModifier(font: font, usage: usage))
    }
    
    func tchapExternalLabelView() -> some View {
        modifier(TchapLabelViewModifier(font: .compound.bodySMSemibold, usage: .userIsExternal))
    }
    
    func tchapRoomLabelView(usage: TchapLabelViewModifier.Usage) -> some View {
        modifier(TchapLabelViewModifier(font: .system(size: 9.0).bold(), usage: usage))
    }
}

#Preview {
    Text("I'm an external")
        .tchapExternalLabelView()
    Text("I'm encrypted")
        .tchapRoomLabelView(usage: .roomIsEncrypted)
    Text("I'm NOT encrypted")
        .tchapRoomLabelView(usage: .roomIsNotEncrypted)
    Text("I'm public")
        .tchapRoomLabelView(usage: .roomIsPublic)
    Text("I'm accessible to externals")
        .tchapRoomLabelView(usage: .roomIsAccessibleToExternals)
}
