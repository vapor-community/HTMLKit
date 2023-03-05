// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "HTMLKit",
    platforms: [
      .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "HTMLKit",
            targets: ["HTMLKit", "HTMLKitComponents", "HTMLKitVapor"]
        ),
        .plugin(
            name: "ComponentsPlugin",
            targets: ["ComponentsPlugin"]
        ),
        .plugin(
            name: "ConverterPlugin",
            targets: ["ConverterPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/miroslavkovac/Lingo.git", from: "3.1.0"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.1"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.65.2"),
        .package(url: "https://github.com/vapor-community/eagerbeaver.git", branch: "0.0.0-alpha.2")
    ],
    targets: [
        .target(
            name: "HTMLKit",
            dependencies: [
                .product(name: "Lingo", package: "Lingo"),
                .product(name: "Collections", package: "swift-collections")
            ],
            exclude: ["Abstraction/README.md", "Framework/README.md"]
        ),
        .target(
            name: "HTMLKitConverter",
            dependencies: [
                .target(name: "HTMLKit"),
                .product(name: "EagerBeaver", package: "eagerbeaver")
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
        .target(
            name: "HTMLKitVapor",
            dependencies: [
                .target(name: "HTMLKit"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Lingo", package: "lingo")
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
        .testTarget(
            name: "HTMLKitVaporTests",
            dependencies: [
                .target(name: "HTMLKitVapor"),
                .target(name: "HTMLKit"),
                .product(name: "XCTVapor", package: "vapor")
            ],
            resources: [
                .process("Localization")
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
