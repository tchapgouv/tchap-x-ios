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

struct TimelineItemScanStatusImageView: View {
    let scanState: BwiScanState
    let imageInfo: ImageInfoProxy?
    let filename: String
    
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
        if scanState == .infected {
            return .compound.iconCriticalPrimary
        } else {
            return .compound.iconSecondary
        }
    }
    
    var scanStatusText: String {
        switch scanState {
        case .infected, .mimeTypeNotAllowed:
            return TchapL10n.contentScannerScanStatusInfected
        case .notFound:
            return TchapL10n.contentScannerScanStatusNotFound
        case .error:
            return TchapL10n.contentScannerScanStatusError
        case .inProgress:
            return TchapL10n.contentScannerScanStatusInProgress
        case .trusted:
            return ""
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
        ZStack {
            Rectangle()
                .fill(.clear)
                .timelineMediaFrame(imageInfo: imageInfo)
            
            VStack {
                Spacer()
                
                CompoundIcon(icon)
                    .foregroundColor(iconForegroundColor)
                    .scaledFrame(size: 48, relativeTo: .title)
                    .background(.compound.bgCanvasDefault, in: Circle())
                
                Spacer()
                
                if scanState == .infected {
                    statusTextWithFilename
                } else {
                    statusText
                }
            }
        }
        .accessibilityIdentifier(a11yIdentifier)
    }
    
    var statusText: some View {
        Text(scanStatusText)
            .font(.compound.bodyXS)
            .lineLimit(1)
            .foregroundColor(.compound.textSecondary)
            .padding(.bottom, 6)
    }
    
    var statusTextWithFilename: some View {
        HStack {
            Text("\(filename)")
                .font(.compound.bodyXS)
                .lineLimit(1)
                .foregroundColor(.compound.textSecondary)
                .truncationMode(.middle)
            
            Text(scanStatusText)
                .font(.compound.bodyXS)
                .lineLimit(1)
                .foregroundColor(.compound.textPrimary)
                .layoutPriority(1)
        }
        .padding(.bottom, 6)
    }
}
