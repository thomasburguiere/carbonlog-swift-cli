// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "carbonCLI",
  dependencies: [
    .package(url: "https://github.com/thomasburguiere/carbonlog-swift-lib", from: "0.3.0"),
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "carbonCLI",
      dependencies: [
        .product(name: "CarbonLogLib", package: "carbonlog-swift-lib"),
        .product(name: "ArgumentParser", package: "swift-argument-parser")
        ]
    )
  ]
)
