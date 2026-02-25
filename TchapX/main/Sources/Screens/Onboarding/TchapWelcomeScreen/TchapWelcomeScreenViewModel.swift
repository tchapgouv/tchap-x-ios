//
// Copyright 2025 Element Creations Ltd.
// Copyright 2021-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Combine
import SwiftUI

typealias TchapWelcomeScreenViewModelType = StateStoreViewModel<TchapWelcomeScreenViewState, TchapWelcomeScreenViewAction>

class TchapWelcomeScreenViewModel: TchapWelcomeScreenViewModelType, TchapWelcomeScreenViewModelProtocol {
    private var actionsSubject: PassthroughSubject<TchapWelcomeScreenViewModelAction, Never> = .init()
    var actionsPublisher: AnyPublisher<TchapWelcomeScreenViewModelAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }
    
    init() {
        super.init(initialViewState: .init())
    }

    // MARK: - Public
    
    override func process(viewAction: TchapWelcomeScreenViewAction) {
        switch viewAction {
        case .continue:
            actionsSubject.send(.done)
        }
    }
}
