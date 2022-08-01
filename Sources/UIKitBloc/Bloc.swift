//
//  Bloc.swift
//
//
//  Created by Mike Shevelinsky on 02.09.2021.
//

import Foundation
import Combine

open class Bloc<Event, State> {
    
    private var cancellable = Set<AnyCancellable>()
    public let state = PassthroughSubject<State, Never>()
    
    
    public func bind(events: AnyPublisher<Event, Never>) -> AnyPublisher<State, Never> {
        events
            .sink {[weak self] in  self?.map($0) }
            .store(in: &cancellable)
        return state.eraseToAnyPublisher()
    }

    public init() { }
    
    open func map(_ event: Event) {
        
    }
}
