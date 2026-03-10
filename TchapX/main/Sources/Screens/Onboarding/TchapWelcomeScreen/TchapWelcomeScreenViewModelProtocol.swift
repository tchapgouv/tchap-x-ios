//
// Copyright 2025 Element Creations Ltd.
// Copyright 2021-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Combine

@MainActor
protocol TchapWelcomeScreenViewModelProtocol {
    var actionsPublisher: AnyPublisher<TchapWelcomeScreenViewModelAction, Never> { get }
    var context: TchapWelcomeScreenViewModelType.Context { get }
}
