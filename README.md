# UIKitBloc

> An implimentation of the BLoC pattern for Swift UIKit

## How to get started

## Adding UIKitBloc via Swift Package Manager 

1. Open your project in Xcode

2. Go to **File** > **Swift Packages** > **Add Package Dependency...**

3. In the field **Enter package repository URL**, enter "https://github.com/roya1v/uikit-bloc"

4. Pick the latest version and click **Next**.

5. Choose the packages required for your project and click **Finish**

## Using UIKitBloc

1. Create a **Bloc** by subclassing the `Bloc<Event, State>` class. Provide concrite types for `Event` and `State` e.g. enums or protocols.

```
import Foundation
import UIKitBloc

// MARK: - State

enum ExampleState {
    case exampleState
    case secondExampleState
}

// MARK: - Event

enum ExampleEvent {
    case exampleEvent
}

// MARK: - Bloc class

final class ExampleBloc: Bloc<ExampleEvent, ExampleState> {

    override func map(_ event: ExampleEvent) {
        switch event {
        case .exampleEvent:
	    loadSomething()
        }
    }

    private func loadSomething() {
        ...
        state.send(.exampleEvent)
    }
}
```

Override the `map` method to perform the desired transformations from an `Event` to a `State`

2. Create the Bloc consumer e.g. a `BlocViewController` that will take a `Bloc` and perform the desired UI changes based on a `State` and send new `Event`s to the Bloc

```
import UIKit
import UIKitBloc

final class ExampleViewController: BlocViewController<ExampleEvent, ExampleState> {

    override func viewDidLoad() {
        super.viewDidLoad()
        events.send(.exampleEvent)
    }


    // MARK: - Bloc

    override func map(_ state: ShotLocationMapState) {
        switch state {
        case .exampleState:
            doSomething()
        case .secondExampleState:
            doSomethingDifferent()
        }
    }
}
```