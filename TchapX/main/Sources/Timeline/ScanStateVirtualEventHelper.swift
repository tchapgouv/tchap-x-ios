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

import MatrixRustSDK

struct ScanStateVirtualEventHelper {
    func mergeVirtualScanStateIntoTimeline(timelineItems: [RoomTimelineItemProtocol]) -> [RoomTimelineItemProtocol] {
        var newTimelineItems = timelineItems
        
        let scanStateItems = newTimelineItems.compactMap { $0 as? ScanStateRoomTimelineItem }
        let messageItems = newTimelineItems.compactMap { $0 as? EventBasedMessageTimelineItemProtocol }
            .filter(\.hasScanState)
        
        // for all virtual scan state events find the corresponding timeline event and add the scan state from the virtual event
        for scanState in scanStateItems {
            let eventItemsWithScanState = messageItems.filter { $0.id.uniqueID.value == scanState.correspondingEventId }
            
            if var event = eventItemsWithScanState.first {
                event.scanState = scanState.scanState
                
                if let index = newTimelineItems.firstIndex(where: { $0.id.uniqueID.value == scanState.correspondingEventId }) {
                    newTimelineItems[index] = event
                } else {
                    MXLog.error("#BWI# Error No corresponding Event ID for ScanState in original timelineitems")
                }
                
            } else {
                MXLog.error("#BWI# Error No corresponding Event ID for ScanState")
            }
        }
        
        return newTimelineItems
    }
}
