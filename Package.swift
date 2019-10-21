// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HTMLKit",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "HTMLKit",
            targets: ["HTMLKit"]),
        .library(
            name: "HTMLKitVapor",
            targets: ["HTMLKitVapor"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),

        .package(url: "https://github.com/miroslavkovac/Lingo.git", from: "3.0.5"),
//        .package(url: "https://github.com/vapor-community/markdown.git", .upToNextMajor(from: "0.4.0")),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-alpha.3"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "HTMLKit",
            dependencies: ["Lingo"]),
        .target(
            name: "HTMLKitVapor",
            dependencies: ["HTMLKit", "Vapor"]),
        .testTarget(
            name: "HTMLKitTests",
            dependencies: ["HTMLKit"]),
    ]
)
