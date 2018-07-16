# ZMAppFoundation

[![CI Status](http://img.shields.io/travis/jfosterdavis/ZMAppFoundation.svg?style=flat)](https://travis-ci.org/jfosterdavis/ZMAppFoundation)
[![Version](https://img.shields.io/cocoapods/v/ZMAppFoundation.svg?style=flat)](http://cocoapods.org/pods/ZMAppFoundation)
[![License](https://img.shields.io/cocoapods/l/ZMAppFoundation.svg?style=flat)](http://cocoapods.org/pods/ZMAppFoundation)
[![Platform](https://img.shields.io/cocoapods/p/ZMAppFoundation.svg?style=flat)](http://cocoapods.org/pods/ZMAppFoundation)

## Features
Easily add core functions to Zero Mu apps
- sliding menu
- Acknowledgements page
- 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ZMAppFoundation is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZMAppFoundation'
```

## Usage
### Adding custom menu items
- append an array of ZMMenuItem to the ZMMenuItems.CustomItems in the initial view controller of the app.
example:
```swift
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.

//add custom menu items to the ZMMenu
ZMMenuItems.CustomItems.append(contentsOf: CustomMenuItems.Items)
}
```

## Author

jfosterdavis, jfosterdavis@users.noreply.github.com

## License

ZMAppFoundation is available under the MIT license. See the LICENSE file for more info.
