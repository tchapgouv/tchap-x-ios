//
// Copyright 2022 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Compound
import SwiftUI
import WysiwygComposer

struct RoomScreen: View {
    @ObservedObject var roomContext: RoomScreenViewModel.Context
    @ObservedObject var timelineContext: TimelineViewModel.Context
    @ObservedObject private var composerToolbarContext: ComposerToolbarViewModel.Context
    @State private var dragOver = false
    let composerToolbar: ComposerToolbar

    init(roomViewModel: RoomScreenViewModelProtocol,
         timelineViewModel: TimelineViewModelProtocol,
         composerToolbar: ComposerToolbar) {
        roomContext = roomViewModel.context
        timelineContext = timelineViewModel.context
        self.composerToolbar = composerToolbar
        composerToolbarContext = composerToolbar.context
    }

    var body: some View {
        timeline
            .background(Color.compound.bgCanvasDefault.ignoresSafeArea())
            .safeAreaInset(edge: .bottom, spacing: 0) {
                composerToolbar
                    .padding(.bottom, composerToolbarContext.composerFormattingEnabled ? 8 : 12)
                    .background {
                        if composerToolbarContext.composerFormattingEnabled {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.compound.borderInteractiveSecondary, lineWidth: 0.5)
                                .ignoresSafeArea()
                        }
                    }
                    .padding(.top, 8)
                    .background(Color.compound.bgCanvasDefault.ignoresSafeArea())
                    .environmentObject(timelineContext)
                    .environment(\.timelineContext, timelineContext)
            }
            .overlay(alignment: .top) {
                Group {
                    if timelineContext.viewState.shouldShowPinnedEventsBanner {
                        pinnedItemsBanner
                    }
                }
                .animation(.elementDefault, value: timelineContext.viewState.shouldShowPinnedEventsBanner)
            }
            .navigationTitle(L10n.screenRoomTitle) // Hidden but used for back button text.
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(isNavigationBarHidden)
            .toolbar { toolbar }
            .toolbarBackground(.visible, for: .navigationBar) // Fix the toolbar's background.
            .overlay { loadingIndicator }
            .alert(item: $timelineContext.alertInfo)
            .sheet(item: $timelineContext.debugInfo) { TimelineItemDebugView(info: $0) }
            .sheet(item: $timelineContext.actionMenuInfo) { info in
                let actions = TimelineItemMenuActionProvider(timelineItem: info.item,
                                                             canCurrentUserRedactSelf: timelineContext.viewState.canCurrentUserRedactSelf,
                                                             canCurrentUserRedactOthers: timelineContext.viewState.canCurrentUserRedactOthers,
                                                             canCurrentUserPin: timelineContext.viewState.canCurrentUserPin,
                                                             pinnedEventIDs: timelineContext.viewState.pinnedEventIDs,
                                                             isDM: timelineContext.viewState.isEncryptedOneToOneRoom,
                                                             isViewSourceEnabled: timelineContext.viewState.isViewSourceEnabled).makeActions()
                if let actions {
                    TimelineItemMenu(item: info.item, actions: actions)
                        .environmentObject(timelineContext)
                }
            }
            .sheet(item: $timelineContext.reactionSummaryInfo) {
                ReactionsSummaryView(reactions: $0.reactions, members: timelineContext.viewState.members, imageProvider: timelineContext.imageProvider, selectedReactionKey: $0.selectedKey)
                    .edgesIgnoringSafeArea([.bottom])
            }
            .sheet(item: $timelineContext.readReceiptsSummaryInfo) {
                ReadReceiptsSummaryView(orderedReadReceipts: $0.orderedReceipts)
                    .environmentObject(timelineContext)
            }
            .interactiveQuickLook(item: $timelineContext.mediaPreviewItem)
            .track(screen: .Room)
            .onDrop(of: ["public.item", "public.file-url"], isTargeted: $dragOver) { providers -> Bool in
                guard let provider = providers.first,
                      provider.isSupportedForPasteOrDrop else {
                    return false
                }
                
                timelineContext.send(viewAction: .handlePasteOrDrop(provider: provider))
                return true
            }
            .sentryTrace("\(Self.self)")
    }

    private var timeline: some View {
        TimelineView()
            .id(timelineContext.viewState.roomID)
            .environmentObject(timelineContext)
            .environment(\.focussedEventID, timelineContext.viewState.timelineViewState.focussedEvent?.eventID)
            .overlay(alignment: .bottomTrailing) {
                scrollToBottomButton
            }
    }
    
    private var pinnedItemsBanner: some View {
        PinnedItemsBannerView(state: timelineContext.viewState.pinnedEventsBannerState,
                              onMainButtonTap: { timelineContext.send(viewAction: .tappedPinnedEventsBanner) },
                              onViewAllButtonTap: { timelineContext.send(viewAction: .viewAllPins) })
            .transition(.move(edge: .top))
    }
    
    private var scrollToBottomButton: some View {
        Button { timelineContext.send(viewAction: .scrollToBottom) } label: {
            Image(systemName: "chevron.down")
                .font(.compound.bodyLG)
                .fontWeight(.semibold)
                .foregroundColor(.compound.iconSecondary)
                .padding(13)
                .offset(y: 1)
                .background {
                    Circle()
                        .fill(Color.compound.iconOnSolidPrimary)
                        // Intentionally using system primary colour to get white/black.
                        .shadow(color: .primary.opacity(0.33), radius: 2.0)
                }
                .padding()
        }
        .opacity(isAtBottomAndLive ? 0.0 : 1.0)
        .accessibilityHidden(isAtBottomAndLive)
        .animation(.elementDefault, value: isAtBottomAndLive)
        .accessibilityIdentifier(A11yIdentifiers.roomScreen.scrollToBottom)
    }
    
    private var isAtBottomAndLive: Bool {
        timelineContext.isScrolledToBottom && timelineContext.viewState.timelineViewState.isLive
    }
    
    @ViewBuilder
    private var loadingIndicator: some View {
        if timelineContext.viewState.showLoading {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.compound.textPrimary)
                .padding(16)
                .background(.ultraThickMaterial)
                .cornerRadius(8)
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        // .principal + .primaryAction works better than .navigation leading + trailing
        // as the latter disables interaction in the action button for rooms with long names
        ToolbarItem(placement: .principal) {
            RoomHeaderView(roomName: timelineContext.viewState.roomTitle,
                           roomAvatar: timelineContext.viewState.roomAvatar,
                           imageProvider: timelineContext.imageProvider)
                // Using a button stops it from getting truncated in the navigation bar
                .contentShape(.rect)
                .onTapGesture {
                    timelineContext.send(viewAction: .displayRoomDetails)
                }
        }
        
        if !ProcessInfo.processInfo.isiOSAppOnMac {
            ToolbarItem(placement: .primaryAction) {
                callButton
                    .disabled(timelineContext.viewState.canJoinCall == false)
            }
        }
    }
    
    @ViewBuilder
    private var callButton: some View {
        if timelineContext.viewState.hasOngoingCall {
            Button {
                timelineContext.send(viewAction: .displayCall)
            } label: {
                Label(L10n.actionJoin, icon: \.videoCallSolid)
                    .labelStyle(.titleAndIcon)
            }
            .buttonStyle(ElementCallButtonStyle())
            .accessibilityIdentifier(A11yIdentifiers.roomScreen.joinCall)
        } else {
            Button {
                timelineContext.send(viewAction: .displayCall)
            } label: {
                CompoundIcon(\.videoCallSolid)
            }
            .accessibilityIdentifier(A11yIdentifiers.roomScreen.joinCall)
        }
    }
    
    private var isNavigationBarHidden: Bool {
        composerToolbarContext.composerFormattingEnabled && composerToolbarContext.composerExpanded && UIDevice.current.userInterfaceIdiom == .pad
    }
}

// MARK: - Previews

struct RoomScreen_Previews: PreviewProvider, TestablePreview {
    static let roomViewModel = RoomScreenViewModel.mock()
    static let timelineViewModel = TimelineViewModel(roomProxy: RoomProxyMock(.init(id: "stable_id",
                                                                                    name: "Preview room",
                                                                                    hasOngoingCall: true)),
                                                     timelineController: MockRoomTimelineController(),
                                                     mediaProvider: MockMediaProvider(),
                                                     mediaPlayerProvider: MediaPlayerProviderMock(),
                                                     voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                     userIndicatorController: ServiceLocator.shared.userIndicatorController,
                                                     appMediator: AppMediatorMock.default,
                                                     appSettings: ServiceLocator.shared.settings,
                                                     analyticsService: ServiceLocator.shared.analytics)

    static var previews: some View {
        NavigationStack {
            RoomScreen(roomViewModel: roomViewModel,
                       timelineViewModel: timelineViewModel,
                       composerToolbar: ComposerToolbar.mock())
        }
    }
}
