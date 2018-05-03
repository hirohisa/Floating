Floating
=======
[![CocoaPods](https://img.shields.io/cocoapods/v/Floating.svg)](https://cocoapods.org/pods/Floating)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![license](https://img.shields.io/badge/license-MIT-000000.svg)](https://github.com/hirohisa/Floating/blob/master/LICENSE)

Floating is a very flexible overlay library.

Requirements
-------

- iOS 10.0+
- Xcode 9.2+, Swift 4.1

### CocoaPods

```ruby
pod 'Floating'
```

### Carthage

```
github "hirohisa/Floating"
```

Usage
-------

### FloatingView<T: UIView>

#### present

```swift

import Floating

func didTapButton(_ sender: UIButton) {
  let handler: FloatingView<UITextField>.Handler = { (state, object) in
      print(state)
      print(object)
  }
  FloatingView(view)
      .configure(backgroundColor: backgroundColor, handler: handler)
      .present(from: sender.frame)
}

```

### Handling with Life Cycle

#### Observer

```swift

// Notification.Name

let FloatingViewWillPresent
let FloatingViewDidPresent
let FloatingViewWillDismiss
let FloatingViewDidDismiss


NotificationCenter.default.addObserver(forName: .FloatingViewWillPresent, object: nil, queue: nil) { (notification) in
  ...
}

```

#### Closure

```swift

// State

enum FloatingView.State {
    case willPresent
    case didPresent
    case willDismiss
    case didDismiss
}

let handler: FloatingView<T>.Handler = { (state: State, object: T) in
  ...
}
FloatingView(view)
    .configure(handler: handler)

```

License
-------

Floating is available under the MIT license.
