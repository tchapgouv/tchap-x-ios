//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import SwiftUI

extension View {
    /// Constrains the max height of a media item in the timeline, whilst preserving its aspect ratio.
    @ViewBuilder
    func timelineMediaFrame(imageInfo: ImageInfoProxy?) -> some View {
        let defaultMediaSize = 100.0
        let minMediaHeight = 100.0
        // Tchap: BWI content-scanner
//        let maxMediaHeight = 300.0
        let maxMediaHeight = 520.0

        if let contentHeight = imageInfo?.size?.height, contentHeight < minMediaHeight { // Special case very small images
            aspectRatio(imageInfo?.aspectRatio, contentMode: .fit)
                .frame(minHeight: minMediaHeight, maxHeight: minMediaHeight)
        } else {
            if let contentAspectRatio = imageInfo?.aspectRatio {
                aspectRatio(contentAspectRatio, contentMode: .fit)
                    .frame(maxHeight: min(maxMediaHeight, max(minMediaHeight, imageInfo?.size?.height ?? .infinity)))
                    // Required to prevent the reply details to get higher priority in rendering the width of the view.
                    .aspectRatio(contentAspectRatio, contentMode: .fit)
            } else { // Otherwise force the image to be `defaultMediaSize` x `defaultMediaSize`
                frame(width: defaultMediaSize, height: defaultMediaSize)
            }
        }
    }
    
    // Tchap: BWI content-scanner - timelineMediaFrame does not work for contentScanner views
    @ViewBuilder
    func contentScannerFrame(imageInfo: ImageInfoProxy?) -> some View {
        let minMediaHeight = 100.0
        let minMediaWidth = 200.0
        let maxMediaHeight = 520.0
        let maxMediaWidth = 400.0
        
        let contentAspectRatio = imageInfo?.aspectRatio ?? 1.0
        
        if let contentHeight = imageInfo?.size?.height, contentHeight < minMediaHeight { // Special case very small images
            frame(minWidth: minMediaHeight * contentAspectRatio, maxWidth: minMediaHeight * contentAspectRatio, minHeight: minMediaHeight, maxHeight: minMediaHeight)
                
        } else {
            if let mediaSize = imageInfo?.size {
                if mediaSize.width / maxMediaWidth < mediaSize.height / maxMediaHeight {
                    let height = min(maxMediaHeight, max(minMediaHeight, mediaSize.height))
                    
                    let width = min(maxMediaWidth, height * contentAspectRatio)
                    aspectRatio(contentAspectRatio, contentMode: .fit)
                        .frame(minWidth: width, maxWidth: width, minHeight: height, maxHeight: height)
                        .aspectRatio(contentAspectRatio, contentMode: .fit)
                } else {
                    let width = min(maxMediaWidth, max(minMediaWidth, mediaSize.width))
                    
                    let height = min(maxMediaHeight, width / contentAspectRatio)
                    
                    aspectRatio(contentAspectRatio, contentMode: .fit)
                        .frame(minWidth: width, maxWidth: width, minHeight: height, maxHeight: height)
                        .aspectRatio(contentAspectRatio, contentMode: .fit)
                }
            } else {
                frame(minWidth: maxMediaWidth, maxWidth: maxMediaWidth, minHeight: maxMediaHeight, maxHeight: maxMediaHeight)
            }
        }
    }
    
    @ViewBuilder
    func mediaGalleryTimelineAspectRatio(imageInfo: ImageInfoProxy?) -> some View {
        aspectRatio(imageInfo?.aspectRatio, contentMode: .fill)
    }
}
