//
// Copyright 2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import SwiftUI

struct TchapStaticMapView<PlaceHolderView: View, PinAnnotationView: View, ErrorView: View>: View {
    @Bindable var mapLoader: TchapStaticMapLoader
    
    let placeholderView: PlaceHolderView
    let pinAnnotationView: PinAnnotationView
    let errorView: ErrorView
    
    init(mapLoader: TchapStaticMapLoader, placeholderView: PlaceHolderView, pinAnnotationView: PinAnnotationView, errorView: ErrorView) {
        self.mapLoader = mapLoader
        self.placeholderView = placeholderView
        self.pinAnnotationView = pinAnnotationView
        self.errorView = errorView
    }
    
    var body: some View {
        switch mapLoader.state {
        case .inited, .loading:
            ZStack {
                placeholderView
                ProgressView()
            }
        case .success(let image):
            ZStack {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                pinAnnotationView
            }
        case .failure:
            errorView
        @unknown default:
            EmptyView()
        }
    }
}
