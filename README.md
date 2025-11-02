# SwiftFileTreeRenderer

A Swift library for rendering file trees and directory structures with result builder. Useful for CLI tools, documentation generators, and any application that needs to visualize or process file hierarchies.

## Features
- define file trees with swift's Result Builders.
- Support for symbolic links
- Support mocking FileManager for testing

## Installation

### Swift Package Manager (SPM)
Add the following to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/mjhgh/SwiftFileTreeRenderer.git", from: "1.0.0")
```

Then add `SwiftFileTreeRenderer` as a dependency for your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "SwiftFileTreeRenderer", package: "FileTreeRenderer")
    ]
)
```

## Example Usage

```swift
import SwiftFileTreeRenderer
// 

let tree = FileTree {
  Dir("Sources") {
    Dir("MyApp") {
      File("main.swift", content: "import Foundation")      
      File("lib.swift", content: "public func greet() { print(\"Hello, World!\") }")
    }
  }
  Dir("Resources") {
    FileSymbolicLink("MyLogo.jpg", destination: "/some/path/MyLogo.jpg")
  }
  File("README.md", content: "README.md Stuff")
}
// use default Foundation FileManager
try tree.render()

// customize cwd and FileManager
try tree.render(fileManager: mockFileManager, at: "/mock/path")

```

## Running Tests

To run the test suite:

```sh
swift test
```

## License

MIT License.
