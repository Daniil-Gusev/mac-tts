// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift
// required to build this package.

import PackageDescription

let package = Package(
  name: "MacTtsPackage",
  platforms: [
    .macOS(.v11)
  ],
  products: [
    // Products define the executables and libraries a package
    // produces, and make them visible to other packages.
    .executable(
      name: "mactts",
      targets: ["mactts"])
  ],
  dependencies: [
    // Dependencies declare other packages that this package
    // depends on.
  ],
  targets: [
    // Targets are the basic building blocks of a package.
    // A target can define a module or a test suite.
    // Targets can depend on other targets in this package,
    // and on products in packages this package depends on.
    .executableTarget(
      name: "mactts",
      path: "Sources/MacTtsPackage",
      sources: [
        "logger.swift", "statestore.swift", "main.swift",
      ],
      swiftSettings: [
        .unsafeFlags(["-suppress-warnings"])
      ]

    )
  ]
)
