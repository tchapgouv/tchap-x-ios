/*
 * MIT License
 *
 * Copyright (c) 2026. DINUM
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

import Compound
import SwiftUI

struct TchapOfflineScreenBanner: View {
    let dismissAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            content
            buttons
        }
        .padding(16)
        .background(Color.compound.bgSubtleSecondary)
        .cornerRadius(14)
        .padding(.horizontal, 16)
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .firstTextBaseline, spacing: 16) {
                Text(TchapL10n.screenHomeOfflineBannerTitle)
                    .font(.compound.bodyLGSemibold)
                    .foregroundColor(.compound.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Text(TchapL10n.screenHomeOfflineBannerDescription)
                .font(.compound.bodyMD)
                .foregroundColor(.compound.textSecondary)
        }
    }

    var buttons: some View {
        Button(action: dismissAction) {
            Text(TchapL10n.screenHomeOfflineBannerButton)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.compound(.primary, size: .medium))
    }
}

struct TchapOfflineScreenBanner_Previews: PreviewProvider, TestablePreview {
    static var previews: some View {
        TchapOfflineScreenBanner { }
    }
}
