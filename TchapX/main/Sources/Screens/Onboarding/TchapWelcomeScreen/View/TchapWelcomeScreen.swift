//
// Copyright 2025 Element Creations Ltd.
// Copyright 2021-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Compound
import SwiftUI

/// A prompt that asks the user whether they would like to enable Analytics or not.
struct TchapWelcomeScreen: View {
    @ObservedObject var context: TchapWelcomeScreenViewModel.Context
    
    var body: some View {
        FullscreenDialog(topPadding: 32.0) {
            mainContent
        } bottomContent: {
            buttons
        }
        .background()
        .backgroundStyle(.compound.bgCanvasDefault)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .interactiveDismissDisabled()
    }
    
    /// The main content of the screen that is shown inside the scroll view.
    private var mainContent: some View {
        VStack(spacing: 8) {
            Image(asset: TchapAsset.TargetAssets.Images.appLogo)
            
            Text(TchapL10n.screenOnboardingWelcomeNewTchapTitle)
                .padding(.horizontal, 32.0)
                .padding(.top, 48.0)
                .font(.compound.headingLGBold)
                .foregroundColor(.compound.textPrimary)
                .multilineTextAlignment(.center)
            
            Text(TchapL10n.screenOnboardingWelcomeNewTchapMessage)
                .padding(.horizontal, 16.0)
                .font(.compound.bodyLG)
                .foregroundColor(.compound.textSecondary)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 2.0) {
                HStack {
                    CompoundIcon(\.voiceCall)
                    Text(TchapL10n.screenOnboardingWelcomeNewTchapFeatureGroupCall)
                    Spacer()
                }
                .newFunctionalityBackground(cornersToRound: [.topLeft, .topRight])
                HStack {
                    CompoundIcon(\.lockOff)
                    Text(TchapL10n.screenOnboardingWelcomeNewTchapFeatureNewRoomType)
                    Spacer()
                }
                .newFunctionalityBackground(cornersToRound: [])
                HStack {
                    CompoundIcon(\.spaceSolid)
                    Text(TchapL10n.screenOnboardingWelcomeNewTchapFeatureSpaces)
                    Spacer()
                }
                .newFunctionalityBackground(cornersToRound: [.bottomLeft, .bottomRight])
            }
            .fixedSize(horizontal: true, vertical: false)
            .padding(.top, 48.0)
        }
    }

    private var buttons: some View {
        VStack(spacing: 16) {
            Button(L10n.actionContinue) { context.send(viewAction: .continue) }
                .buttonStyle(.compound(.primary))
        }
    }
}

private struct TchapWelcomeNewFunctionalityBackground: ViewModifier {
    var cornersToRound: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16.0)
            .padding(.vertical, 12.0)
            .frame(maxWidth: .infinity)
            .background()
            .backgroundStyle(Color.compound.bgSubtleSecondaryLevel0)
            .cornerRadius(4.0, corners: cornersToRound)
    }
}

extension View {
    func newFunctionalityBackground(cornersToRound: UIRectCorner) -> some View {
        modifier(TchapWelcomeNewFunctionalityBackground(cornersToRound: cornersToRound))
    }
}

// MARK: - Previews

struct TchapWelcomeScreen_Previews: PreviewProvider, TestablePreview {
    static let viewModel = TchapWelcomeScreenViewModel()
    static var previews: some View {
        TchapWelcomeScreen(context: viewModel.context)
    }
}
