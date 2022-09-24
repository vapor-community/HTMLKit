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
            targets: ["HTMLKit", "HTMLKitComponents"]
        ),
        .plugin(
            name: "ComponentsPlugin",
            targets: ["ComponentsPlugin"]
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
            name: "HTMLKitConverter",
            dependencies: [
                .target(name: "HTMLKit")
            ]
        ),
        .target(
            name: "HTMLKitComponents",
            dependencies: [
                .target(name: "HTMLKit")
            ],
            resources: [
                .process("Resources")
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
            name: "HTMLKitConverterTests",
            dependencies: [
                .target(name: "HTMLKitConverter")
            ],
            resources: [
                .process("Conversion")
            ]
        ),
        .testTarget(
            name: "HTMLKitComponentsTests",
            dependencies: [
                .target(name: "HTMLKitComponents"),
                .target(name: "HTMLKit")
            ]
        ),
        .executableTarget(
            name: "ConvertCommand",
            dependencies: [
                .target(name: "HTMLKitConverter")
            ],
            path: "Sources/Commands/Converter"
        ),
        .executableTarget(
            name: "DeployCommand",
            dependencies: [
                .target(name: "HTMLKitComponents")
            ],
            path: "Sources/Commands/Components"
        ),
        .plugin(
            name: "ConverterPlugin",
            capability: .command(
                intent: .custom(
                    verb: "convert",
                    description: "Convert html content"),
                permissions: [.writeToPackageDirectory(reason: "The command needs the permission to create the converted file.")]
            ),
            dependencies: [
                .target(name: "ConvertCommand")
            ]
        ),
        .plugin(
            name: "ComponentsPlugin",
            capability: .command(
                intent: .custom(
                    verb: "deploy",
                    description: "Deploy css files"),
                permissions: [.writeToPackageDirectory(reason: "The command needs the permission to create the minified css file.")]
            ),
            dependencies: [
                .target(name: "DeployCommand")
            ]
        )
    ]
)
