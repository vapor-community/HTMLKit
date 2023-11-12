// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Example",
    platforms: [.macOS(.v13)],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.77.2"),
        .package(url: "https://github.com/vapor-community/HTMLKit.git", from: "3.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "Example",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "HTMLKit", package: "HTMLKit"),
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .testTarget(
            name: "ExampleTests",
            dependencies: [
                .target(name: "Example"),
                .product(name: "XCTVapor", package: "vapor")
            ]
        )
    ]
)
