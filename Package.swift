// swift-tools-version:5.9

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
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.1"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.65.2")
    ],
    targets: [
        .target(
            name: "HTMLKit",
            dependencies: [
                .product(name: "Collections", package: "swift-collections")
            ],
            exclude: ["Abstraction/README.md", "Framework/README.md"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency=complete")
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
        .target(
            name: "HTMLKitVapor",
            dependencies: [
                .target(name: "HTMLKit"),
                .product(name: "Vapor", package: "vapor"),
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency=complete")
            ]
        ),
        .target(
            name: "Minifier",
            path: "Sources/Utilities"
        ),
        .testTarget(
            name: "HTMLKitTests",
            dependencies: [
                .target(name: "HTMLKit")
            ],
            resources: [
                .copy("Localization")
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
            ],
            resources: [
                .copy("Localization")
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
                .copy("Localization")
            ]
        ),
        .testTarget(
            name: "UtilitiesTests",
            dependencies: [
                .target(name: "Minifier"),
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
                .target(name: "HTMLKitComponents"),
                .target(name: "Minifier")
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
