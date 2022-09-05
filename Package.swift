// swift-tools-version:5.6

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
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.1"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "HTMLKit",
            dependencies: [
                .product(name: "Lingo", package: "Lingo"),
                .product(name: "Collections", package: "swift-collections")
            ]
        ),
        .testTarget(
            name: "HTMLKitTests",
            dependencies: ["HTMLKit"],
            resources: [
                .process("Localization"),
                .process("Conversion")
            ]
        )
    ]
)
