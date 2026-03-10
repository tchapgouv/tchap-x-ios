//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import Combine

@MainActor
protocol DecideHomeServerScreenViewModelProtocol {
    var actions: AnyPublisher<DecideHomeServerScreenViewModelAction, Never> { get }
    var context: DecideHomeServerScreenViewModelType.Context { get }
    
    /// Update the view to reflect that loaded has finished.
    func stopLoading()
    /// reset loading state in case OIDC login failed or is canceled by user.
    func resetLoadingState()
}
