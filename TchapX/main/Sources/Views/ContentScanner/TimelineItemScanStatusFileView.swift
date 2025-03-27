/*
 * Copyright (c) 2025 BWI GmbH
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Compound
import Foundation
import MatrixRustSDK
import SwiftUI

struct TimelineItemScanStatusFileView: View {
    let scanState: BwiScanState
    let filename: String
    let fileSize: UInt?
    
    var icon: KeyPath<CompoundIcons, Image> {
        switch scanState {
        case .infected, .mimeTypeNotAllowed:
            return \.block
        case .notFound:
            return \.imageError
        case .error:
            return \.imageError
        case .inProgress:
            return \.spinner
        default:
            return \.attachment
        }
    }
    
    var iconForegroundColor: Color {
        if scanState == .infected || scanState == .mimeTypeNotAllowed {
            return .compound.iconCriticalPrimary
        } else {
            return .compound.iconSecondary
        }
    }
    
    var scanStatusText: String {
        switch scanState {
        case .infected, .mimeTypeNotAllowed:
            return TchapL10n.contentScannerScanStatusInfected.capitalized
        case .notFound:
            return TchapL10n.contentScannerScanStatusNotFound
        case .error:
            return TchapL10n.contentScannerScanStatusError
        case .inProgress:
            return TchapL10n.contentScannerScanStatusInProgress
        case .trusted:
            if let fileSize {
                return "(\(fileSize.formatted(.byteCount(style: .file))))"
            } else {
                return ""
            }
        }
    }
    
    var a11yIdentifier: String {
        switch scanState {
        case .infected, .mimeTypeNotAllowed:
            return TchapA11yIdentifiers.scanStates.infected
        case .notFound:
            return TchapA11yIdentifiers.scanStates.notFound
        case .error:
            return TchapA11yIdentifiers.scanStates.error
        case .inProgress:
            return TchapA11yIdentifiers.scanStates.inProgress
        case .trusted:
            return TchapA11yIdentifiers.scanStates.trusted
        }
    }
    
    var body: some View {
        Label {
            VStack {
                Text(filename)
                    .truncationMode(.middle)
                    .font(.compound.bodyLG)
                    .foregroundStyle(.compound.textPrimary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 4) {
                    if scanState == .trusted {
                        Text((filename as NSString).pathExtension.uppercased())
                            .font(.compound.bodyXS)
                            .foregroundStyle(.compound.textSecondary)
                            .lineLimit(1)
                    }
                    
                    Text(scanStatusText)
                        .font(.compound.bodyXS)
                        .foregroundStyle(.compound.textSecondary)
                        .lineLimit(1)
                    
                    Spacer()
                }
            }

        } icon: {
            CompoundIcon(icon, size: .xSmall, relativeTo: .body)
                .foregroundColor(iconForegroundColor)
                .scaledPadding(8)
                .background(.compound.bgCanvasDefault, in: Circle())
        }
        .labelStyle(.custom(spacing: 8, alignment: .center))
        .padding(.horizontal, 4)
        .accessibilityIdentifier(a11yIdentifier)
    }
}
