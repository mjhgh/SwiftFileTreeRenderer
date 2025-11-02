// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftFileTreeRenderer",
  platforms: [.macOS(.v14)],
  products: [.library(name: "SwiftFileTreeRenderer", targets: ["FileTreeRenderer"])],
  dependencies: [],
  targets: [
    .target(name: "FileTreeRenderer"),
    .testTarget(
      name: "FileTreeRendererTest",
      dependencies: ["FileTreeRenderer"]
    ),
  ]
)
