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

### Extend AppDelegate
ZMAppFoundation defines the AppDelegate so you must extend it if you want to add or override functionality
```swift
import UIKit
import ZMAppFoundation

extension AppDelegate {
//put in anything that extends the ZMAppDelegate
}
```

### Connect Core Data
- App Delegate

## Usage
### Adding custom menu items
- append any number of `ZMMenuItem` to the `ZMMenuItems.CustomItems` in the initial view controller of the app.
example:
```swift
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.

//add custom menu items to the ZMMenu
ZMMenuItems.CustomItems.append(contentsOf: CustomMenuItems.Items)
}
```
### Adding custom Acknowledgement Page items
- append  `String` objects to the `ZMAcknowlegementContent.CustomItems` in the initial view controller of the app.
example:
```swift
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.

//add acknowledgement items to the Ack page
ZMAcknowledgementsContent.CustomContent.append(contentsOf: CustomAcknowledgements.Items)
}
```

## Secrets, private resources
- the framework assumes that you have file named `Secrets.swift`, and this file is included in .gitignore.  Put any secret resources such as passwords in a file like this.

## Author

jfosterdavis, jfosterdavis@users.noreply.github.com

## License

ZMAppFoundation is available under the MIT license. See the LICENSE file for more info.
