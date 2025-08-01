//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Combine
import Foundation
import MatrixRustSDK

class TimelineItemProvider: TimelineItemProviderProtocol {
    private var cancellables = Set<AnyCancellable>()
    private let serialDispatchQueue: DispatchQueue
    
    private var roomTimelineObservationToken: TaskHandle?

    private let paginationStateSubject = CurrentValueSubject<PaginationState, Never>(.initial)
    var paginationState: PaginationState {
        paginationStateSubject.value
    }

    private let itemProxiesSubject: CurrentValueSubject<[TimelineItemProxy], Never>
    private(set) var itemProxies: [TimelineItemProxy] = [] {
        didSet {
            itemProxiesSubject.send(itemProxies)
        }
    }

    var updatePublisher: AnyPublisher<([TimelineItemProxy], PaginationState), Never> {
        itemProxiesSubject
            .combineLatest(paginationStateSubject)
            .eraseToAnyPublisher()
    }
    
    let kind: TimelineKind
    
    private let membershipChangeSubject = PassthroughSubject<Void, Never>()
    var membershipChangePublisher: AnyPublisher<Void, Never> {
        membershipChangeSubject
            .eraseToAnyPublisher()
    }
    
    deinit {
        roomTimelineObservationToken?.cancel()
    }

    init(timeline: Timeline, kind: TimelineKind, paginationStatePublisher: AnyPublisher<PaginationState, Never>) {
        serialDispatchQueue = DispatchQueue(label: "io.element.elementx.timeline_item_provider", qos: .utility)
        itemProxiesSubject = CurrentValueSubject<[TimelineItemProxy], Never>([])
        self.kind = kind
        
        paginationStatePublisher
            .sink { [weak self] in
                self?.paginationStateSubject.send($0)
            }
            .store(in: &cancellables)
        
        Task {
            roomTimelineObservationToken = await timeline.addListener(listener: SDKListener { [weak self] timelineDiffs in
                self?.serialDispatchQueue.sync {
                    self?.updateItemsWithDiffs(timelineDiffs)
                }
            })
        }
    }
    
    /// A continuation to signal whether the initial timeline items have been loaded and processed.
    private var hasLoadedInitialItemsContinuation: CheckedContinuation<Void, Never>?
    /// A method that allows `await`ing the first update of timeline items from the listener, as the items
    /// aren't added directly to the provider upon initialisation and may take some time to come in.
    func waitForInitialItems() async {
        guard itemProxies.isEmpty else { return }
        return await withCheckedContinuation { continuation in
            hasLoadedInitialItemsContinuation = continuation
        }
    }
    
    // MARK: - Private
    
    private func updateItemsWithDiffs(_ diffs: [TimelineDiff]) {
        let span = MXLog.createSpan("process_timeline_list_diffs:\(kind)")
        span.enter()
        defer {
            span.exit()
        }
        
        MXLog.verbose("Received diffs: \(diffs)")
        
        itemProxies = diffs.reduce(itemProxies) { currentItems, diff in
            guard let collectionDiff = buildDiff(from: diff, on: currentItems) else {
                MXLog.error("Failed building CollectionDifference from \(diff)")
                return currentItems
            }
            
            guard let updatedItems = currentItems.applying(collectionDiff) else {
                MXLog.error("Failed applying diff: \(collectionDiff)")
                return currentItems
            }
            
            return updatedItems
        }
        
        if let hasLoadedInitialItemsContinuation {
            hasLoadedInitialItemsContinuation.resume()
            self.hasLoadedInitialItemsContinuation = nil
        }
    }
    
    // swiftlint:disable:next cyclomatic_complexity
    private func buildDiff(from diff: TimelineDiff, on itemProxies: [TimelineItemProxy]) -> CollectionDifference<TimelineItemProxy>? {
        var changes = [CollectionDifference<TimelineItemProxy>.Change]()
        
        switch diff.change() {
        case .append:
            guard let items = diff.append() else { fatalError() }

            for (index, item) in items.enumerated() {
                let itemProxy = TimelineItemProxy(item: item)
                
                if itemProxy.isMembershipChange {
                    membershipChangeSubject.send(())
                }
                
                changes.append(.insert(offset: Int(itemProxies.count) + index, element: itemProxy, associatedWith: nil))
            }
        case .clear:
            for (index, itemProxy) in itemProxies.enumerated() {
                changes.append(.remove(offset: index, element: itemProxy, associatedWith: nil))
            }
        case .insert:
            guard let update = diff.insert() else { fatalError() }

            let itemProxy = TimelineItemProxy(item: update.item)
            changes.append(.insert(offset: Int(update.index), element: itemProxy, associatedWith: nil))
        case .popBack:
            guard let itemProxy = itemProxies.last else { fatalError() }

            changes.append(.remove(offset: itemProxies.count - 1, element: itemProxy, associatedWith: nil))
        case .popFront:
            guard let itemProxy = itemProxies.first else { fatalError() }

            changes.append(.remove(offset: 0, element: itemProxy, associatedWith: nil))
        case .pushBack:
            guard let item = diff.pushBack() else { fatalError() }
            
            let itemProxy = TimelineItemProxy(item: item)
            
            if itemProxy.isMembershipChange {
                membershipChangeSubject.send(())
            }
            
            changes.append(.insert(offset: Int(itemProxies.count), element: itemProxy, associatedWith: nil))
        case .pushFront:
            guard let item = diff.pushFront() else { fatalError() }

            let itemProxy = TimelineItemProxy(item: item)
            changes.append(.insert(offset: 0, element: itemProxy, associatedWith: nil))
        case .remove:
            guard let index = diff.remove() else { fatalError() }

            let itemProxy = itemProxies[Int(index)]

            changes.append(.remove(offset: Int(index), element: itemProxy, associatedWith: nil))
        case .reset:
            guard let items = diff.reset() else { fatalError() }

            for (index, itemProxy) in itemProxies.enumerated() {
                changes.append(.remove(offset: index, element: itemProxy, associatedWith: nil))
            }

            for (index, timelineItem) in items.enumerated() {
                changes.append(.insert(offset: index, element: TimelineItemProxy(item: timelineItem), associatedWith: nil))
            }
        case .set:
            guard let update = diff.set() else { fatalError() }

            let itemProxy = TimelineItemProxy(item: update.item)
            changes.append(.remove(offset: Int(update.index), element: itemProxy, associatedWith: nil))
            changes.append(.insert(offset: Int(update.index), element: itemProxy, associatedWith: nil))
        case .truncate:
            break
        }
        
        return CollectionDifference(changes)
    }
}

private extension TimelineItemProxy {
    var isMembershipChange: Bool {
        switch self {
        case .event(let eventTimelineItemProxy):
            switch eventTimelineItemProxy.content {
            case .roomMembership:
                true
            default:
                false
            }
        case .virtual, .unknown:
            false
        }
    }
}

private extension VirtualTimelineItem {
    var description: String {
        switch self {
        case .dateDivider(let timestamp):
            return "DayDiviver(\(timestamp))"
        case .readMarker:
            return "ReadMarker"
        case .timelineStart:
            return "TimelineStart"
        // Tchap: BWI content-scanner for app build purposes
        case .scanStateChanged(eventId: let eventId, newScanState: let newScanState):
            return "Scan state changed for event \(eventId) to \(newScanState)"
        }
    }
}

private extension Array where Element == TimelineDiff {
    var debugDescription: String {
        "[" + map(\.debugDescription).joined(separator: ",") + "]"
    }
}

extension TimelineDiff: @retroactive CustomDebugStringConvertible {
    public var debugDescription: String {
        switch change() {
        case .append:
            guard let update = append() else {
                fatalError()
            }
            return "Append(\(update.count))"
        case .clear:
            return "Clear"
        case .insert:
            return "Insert"
        case .set:
            guard let update = set() else {
                fatalError()
            }
            return "Set(\(update.index))"
        case .remove:
            guard let update = remove() else {
                fatalError()
            }
            return "Remove(\(update)"
        case .pushBack:
            return "PushBack"
        case .pushFront:
            return "PushFront"
        case .popBack:
            return "PopBack"
        case .popFront:
            return "PopFront"
        case .truncate:
            guard let update = truncate() else {
                fatalError()
            }
            return "Truncate(\(update))"
        case .reset:
            guard let update = reset() else {
                fatalError()
            }
            return "Reset(\(update.count)@\(update.startIndex)-\(update.endIndex))"
        }
    }
}
