//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Combine
import Foundation
import UIKit

struct BugReport: Equatable {
    let userID: String?
    let deviceID: String?
    let ed25519: String?
    let curve25519: String?
    let text: String
    let logFiles: [URL]?
    let canContact: Bool
    var githubLabels: [String]
    let files: [URL]
}

struct SubmitBugReportResponse: Decodable {
    var reportURL: String?
    
    enum CodingKeys: String, CodingKey {
        case reportURL = "report_url"
    }
}

enum BugReportServiceError: LocalizedError {
    case uploadFailure(Error)
    case serverError(URLResponse, String)
    case httpError(HTTPURLResponse, String)
    
    var errorDescription: String? {
        switch self {
        case .uploadFailure(let error):
            return error.localizedDescription
        case .serverError(_, let errorDescription):
            return errorDescription
        case .httpError(_, let errorDescription):
            return errorDescription
        }
    }
}

enum RageshakeConfiguration {
    /// Rageshakes should be sent to the provided URL
    case url(URL)
    /// Rageshakes are disabled.
    case disabled
    /// No customisations are made, use the default configuration.
    case `default`
}

// sourcery: AutoMockable
protocol BugReportServiceProtocol: AnyObject {
    var isEnabled: Bool { get }
    var crashedLastRun: Bool { get }
    
    var lastCrashEventID: String? { get set }
    
    func applyConfiguration(_ configuration: RageshakeConfiguration)
    
    func submitBugReport(_ bugReport: BugReport,
                         progressListener: CurrentValueSubject<Double, Never>) async -> Result<SubmitBugReportResponse, BugReportServiceError>
}
