//
//  TchapRoomHeaderViewRoomPropertiesBadgesView.swift
//  TchapX
//
//  Created by Nicolas Buquet on 16/01/2025.
//  Copyright © 2025 Tchap. All rights reserved.
//

import MatrixRustSDK
import SwiftUI

struct TchapRoomHeaderViewRoomPropertiesBadgesView: View {
    @Binding var isEncrypted: Bool?
    @Binding var isPublic: Bool?

    var body: some View {
        HStack(spacing: 6) {
            if let isEncrypted = isEncrypted,
               isEncrypted == true {
                Label("SÉCURISÉ", systemSymbol: .lockFill)
                    .labelStyle(.titleAndIcon)
                    .tchapRoomPropertiesDisplay()
            }
            if let isPublic = isPublic,
               isPublic == true {
                Label("PUBLIC", systemSymbol: .globe)
                    .labelStyle(.titleAndIcon)
                    .tchapRoomPropertiesDisplay()
            }
        }
    }
}

extension TchapRoomHeaderViewRoomPropertiesBadgesView {
    static var sample: TchapRoomHeaderViewRoomPropertiesBadgesView {
        TchapRoomHeaderViewRoomPropertiesBadgesView(isEncrypted: .constant(true), isPublic: .constant(false))
    }
}

#Preview {
    TchapRoomHeaderViewRoomPropertiesBadgesView.sample
}
