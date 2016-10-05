# osusume-lunch-ios

## Description
This app helps you decide where to go for lunch in the Tokyo office area. It uses the [osusume-lunch-rails API](https://github.com/pivotal-tokyo/osusume_lunch_rails) for data and services.

## Getting Started
This project requires Xcode 8, iOS 10, and Swift 3.

1.) Install carthage
```
brew install carthage
```

2.) Install project dependencies
```
make update
```

3.) Open project in xcode

## Running Tests
We have included a makefile to help you run tests from the command line.

```
make tests
```

## Setup Backend
Because this app consumes data from the [osusume-lunch-rails API](https://github.com/pivotal-tokyo/osusume_lunch_rails), you'll need to set that up too ;)
