// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "carbonCLI",
  dependencies: [
    .package(url: "https://github.com/thomasburguiere/carbonlog-swift-lib", branch: "master")
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "carbonCLI",
      dependencies: [.product(name: "CarbonLogLib", package: "carbonlog-swift-lib")]
    )
  ]
)
