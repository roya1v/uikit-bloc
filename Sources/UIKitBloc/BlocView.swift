//
//  BlocView.swift
//  
//
//  Created by Mike Shevelinsky on 01.08.2022.
//

import UIKit
import Combine

/// Takes in a ``Bloc`` and calles ``map(_:)`` on receiving each new ``State``
open class BlocView<Event, State>: UIView {

    public let bloc: Bloc<Event, State>
    public let events = PassthroughSubject<Event, Never>()
    private var cancellable = Set<AnyCancellable>()


    private func bindBloc() {
        bloc.bind(events: events.eraseToAnyPublisher())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
            self?.map(state)
        }.store(in: &cancellable)
    }

    open func map(_ state: State) {
        fatalError("map() should be overridden")
    }

    public init(with bloc: Bloc<Event, State>) {
        self.bloc = bloc
        super.init(frame: .zero)
        bindBloc()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
