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
        ),
        .plugin(
            name: "ConverterPlugin",
            targets: ["ConverterPlugin"]
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
        .target(
            name: "Converter",
            dependencies: [
                .target(name: "HTMLKit")
            ]
        ),
        .testTarget(
            name: "HTMLKitTests",
            dependencies: [
                .target(name: "HTMLKit")
            ],
            resources: [
                .process("Localization")
            ]
        ),
        .testTarget(
            name: "ConverterTests",
            dependencies: [
                .target(name: "Converter")
            ],
            resources: [
                .process("Conversion")
            ]
        ),
        .executableTarget(
            name: "ConvertCommand",
            dependencies: [
                .target(name: "Converter")
            ],
            path: "Sources/Commands"
        ),
        .plugin(
            name: "ConverterPlugin",
            capability: .command(intent: .custom(verb: "convert", description: "Convert html content"), permissions: [.writeToPackageDirectory(reason: "The command needs the permission to create the converted file.")]),
            dependencies: [
                .target(name: "ConvertCommand")
            ]
        )
    ]
)
