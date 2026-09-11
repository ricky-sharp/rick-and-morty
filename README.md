# Rick and Morty

## Version
### 1.0

## Build Requirements

### Xcode 26.6 (17F113)

### Swift 6.3.3

### SDKs
+ iOS 26.5 (23F81a)

## Runtime Requirements
+ iOS 26.0

## Framework Dependencies
+ [`Foundation`](https://developer.apple.com/documentation/foundation)
+ [`SwiftUI`](https://developer.apple.com/documentation/swiftui)
+ [`Swift Testing`](https://developer.apple.com/documentation/testing)

## Future Improvements
+ Deal with error 1 to show "NoResultsView" instead of "ErrorView"
+ Initial load of results
+ Only search after a pause in modifying the search phrase (e.g. 0.25 to 0.5 seconds)
+ Add proper paging (working with next and prev properities)
+ Image caching
+ On-device AI to generate accessible content for images (just on the detail screen)
+ About screen
+ Fill in unit tests for proper coverage
+ Add UI tests (look at using WireMock)
+ Statistics gathering (e.g. MixPanel)
