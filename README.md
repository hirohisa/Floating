Floating
=======
[![CocoaPods](https://img.shields.io/cocoapods/v/Floating.svg)](https://cocoapods.org/pods/Floating)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![license](https://img.shields.io/badge/license-MIT-000000.svg)](https://github.com/hirohisa/Floating/blob/master/LICENSE)

Floating is a very flexible overlay library.

Requirements
----------

- iOS 10.0+
- Xcode 9.2+, Swift 4.1

### CocoaPods

```ruby
pod 'Floating'
```

### Carthage

```
github "hirohisa/Floating" ~> 0.0.2
```

Usage
----------

### FloatingView<T: UIView>

#### present

```swift

import Floating

func didTapButton(_ sender: UIButton) {
    let floatingView = FloatingView(UITextField(frame: frame))
    floatingView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
    floatingView.present(from: sender.frame)
}

```

#### Notification.Name List

```swift
let FloatingViewWillPresent
let FloatingViewDidPresent
let FloatingViewWillDismiss
let FloatingViewDidDismiss
```


## License

Floating is available under the MIT license.
