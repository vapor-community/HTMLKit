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
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.1"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.65.2")
    ],
    targets: [
        .target(
            name: "HTMLKit",
            dependencies: [
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "Logging", package: "swift-log"),
            ],
            exclude: ["Abstraction/README.md", "Framework/README.md"]
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
                    description: "Converts HTML markup into Swift syntax."),
                permissions: [.writeToPackageDirectory(reason: "The command needs the permission to create the file.")]
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
                    description: "Deploys the CSS and JS files for the HTMLKit components."
                ),
                permissions: [.writeToPackageDirectory(reason: "The command needs the permission to create the files.")]
            ),
            dependencies: [
                .target(name: "DeployCommand")
            ]
        )
    ]
)
