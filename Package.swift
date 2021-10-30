// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HTMLKit",
    platforms: [
      .macOS(.v10_14),
    ],
    products: [
        .library(
            name: "HTMLKit",
            targets: ["HTMLKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/miroslavkovac/Lingo.git", from: "3.1.0"),
    ],
    targets: [
        .target(
            name: "HTMLKit",
            dependencies: ["Lingo"]
        ),
        .testTarget(
            name: "HTMLKitTests",
            dependencies: ["HTMLKit"],
            resources: [
                .process("Localization")
            ]
        )
    ]
)
