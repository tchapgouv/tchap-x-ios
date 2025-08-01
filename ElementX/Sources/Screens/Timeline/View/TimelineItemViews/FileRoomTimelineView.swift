//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

struct FileRoomTimelineView: View {
    @Environment(\.timelineContext) private var context
    let timelineItem: FileRoomTimelineItem
    
    var body: some View {
        TimelineStyler(timelineItem: timelineItem) {
            // Tchap: content-scanner - scanState Views on scanstates other than trusted,
            if timelineItem.scanState == .trusted {
                MediaFileRoomTimelineContent(filename: timelineItem.content.filename,
                                             fileSize: timelineItem.content.fileSize,
                                             caption: timelineItem.content.caption,
                                             formattedCaption: timelineItem.content.formattedCaption,
                                             additionalWhitespaces: timelineItem.additionalWhitespaces(),
                                             shouldBoost: timelineItem.shouldBoost) {
                    context?.send(viewAction: .mediaTapped(itemID: timelineItem.id))
                }
                .accessibilityLabel(L10n.commonFile)
            } else {
                TimelineItemScanStatusFileView(scanState: timelineItem.scanState,
                                               filename: timelineItem.content.filename,
                                               fileSize: timelineItem.content.fileSize)
            }
        }
    }
}

// MARK: Content

struct MediaFileRoomTimelineContent: View {
    let filename: String
    let fileSize: UInt?
    let caption: String?
    let formattedCaption: AttributedString?
    let additionalWhitespaces: Int
    var shouldBoost = false
    var isAudioFile = false
    
    private var fileDescription: String {
        var fileDescription = "\(filename.validatedFileExtension.uppercased())"
        if let fileSize {
            fileDescription += " (\(fileSize.formatted(.byteCount(style: .file))))"
        }
        return fileDescription
    }
    
    var onMediaTap: (() -> Void)?
    
    private var icon: KeyPath<CompoundIcons, Image> {
        isAudioFile ? \.audio : \.attachment
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let onMediaTap {
                filePreview
                    .onTapGesture {
                        onMediaTap()
                    }
            } else {
                filePreview
            }
            
            if let formattedCaption {
                FormattedBodyText(attributedString: formattedCaption,
                                  additionalWhitespacesCount: additionalWhitespaces,
                                  boostFontSize: shouldBoost)
            } else if let caption {
                FormattedBodyText(text: caption,
                                  additionalWhitespacesCount: additionalWhitespaces,
                                  boostFontSize: shouldBoost)
            }
        }
    }
    
    var filePreview: some View {
        Label {
            VStack(alignment: .leading, spacing: 0) {
                Text(filename)
                    .foregroundStyle(.compound.textPrimary)
                    .font(.compound.bodyLG)
                Text(fileDescription)
                    .font(.compound.bodySM)
                    .foregroundStyle(.compound.textSecondary)
            }
            .font(.compound.bodyLG)
            .foregroundStyle(.compound.textPrimary)
            .lineLimit(1)
        } icon: {
            CompoundIcon(icon, size: .xSmall, relativeTo: .body)
                .foregroundColor(.compound.iconPrimary)
                .scaledPadding(8)
                .background(.compound.iconOnSolidPrimary, in: Circle())
        }
        .labelStyle(.custom(spacing: 8, alignment: .center))
        .padding(.horizontal, 4) // Add to the styler's padding of 8, as we use the default insets for the caption.
    }
}

// MARK: - Previews

struct FileRoomTimelineView_Previews: PreviewProvider, TestablePreview {
    static let viewModel = TimelineViewModel.mock
    
    static var previews: some View {
        VStack(spacing: 20.0) {
            FileRoomTimelineView(timelineItem: makeItem(filename: "document.pdf"))
            
            FileRoomTimelineView(timelineItem: makeItem(filename: "document.pdf",
                                                        fileSize: 3 * 1024 * 1024))
            
            FileRoomTimelineView(timelineItem: makeItem(filename: "spreadsheet.xlsx",
                                                        fileSize: 17 * 1024,
                                                        caption: "The important figures you asked me to send over."))
            
            FileRoomTimelineView(timelineItem: makeItem(filename: "document.txt",
                                                        fileSize: 456,
                                                        caption: "Plain caption",
                                                        formattedCaption: "Formatted caption"))
        }
        .environmentObject(viewModel.context)
    }
    
    static func makeItem(filename: String,
                         fileSize: UInt? = nil,
                         caption: String? = nil,
                         formattedCaption: AttributedString? = nil) -> FileRoomTimelineItem {
        .init(id: .randomEvent,
              timestamp: .mock,
              isOutgoing: false,
              isEditable: false,
              canBeRepliedTo: true,
              sender: .init(id: "Bob"),
              content: .init(filename: filename,
                             caption: caption,
                             formattedCaption: formattedCaption,
                             source: nil,
                             fileSize: fileSize,
                             thumbnailSource: nil,
                             contentType: nil))
    }
}
