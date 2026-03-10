//
// Copyright 2025 Element Creations Ltd.
// Copyright 2021-2025 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial.
// Please see LICENSE files in the repository root for full details.
//

import Combine
import SwiftUI

struct TchapWelcomeScreenCoordinatorParameters { }

enum TchapWelcomeScreenCoordinatorAction {
    case done
}

final class TchapWelcomeScreenCoordinator: CoordinatorProtocol {
    private var viewModel: TchapWelcomeScreenViewModelProtocol
    private let actionsSubject: PassthroughSubject<TchapWelcomeScreenCoordinatorAction, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    
    var actions: AnyPublisher<TchapWelcomeScreenCoordinatorAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }
    
    init(parameters: TchapWelcomeScreenCoordinatorParameters) {
        viewModel = TchapWelcomeScreenViewModel()
    }
    
    // MARK: - Public
    
    func start() {
        viewModel.actionsPublisher
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .done:
                    actionsSubject.send(.done)
                }
            }
            .store(in: &cancellables)
    }
    
    func toPresentable() -> AnyView {
        AnyView(TchapWelcomeScreen(context: viewModel.context))
    }
}
