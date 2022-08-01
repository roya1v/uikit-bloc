//
//  BlocViewController.swift
//
//
//  Created by Mike Shevelinsky on 09.10.2021.
//

import UIKit
import Combine

open class BlocViewController<Event, State>: UIViewController {

    public let bloc: Bloc<Event, State>
    public let events = PassthroughSubject<Event, Never>()
    private var cancellable = Set<AnyCancellable>()

    open override func viewDidLoad() {
        super.viewDidLoad()

        bindBloc()
    }

    private func bindBloc() {
        bloc.bind(events: events.eraseToAnyPublisher())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
            self?.map(state)
        }.store(in: &cancellable)
    }

    open func map(_ state: State) {

    }

    public init(with bloc: Bloc<Event, State>) {
        self.bloc = bloc
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
