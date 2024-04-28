// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DaouGeometry2D",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DaouGeometry2D",
            targets: ["DaouGeometry2D"]),
    ],
    dependencies: [
        .package(url: "https://github.com/DaouMobile/DaouAngle",
                 branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DaouGeometry2D",
            dependencies: [
                "DaouAngle"
            ]
        ),
        .testTarget(
            name: "DaouGeometry2DTests",
            dependencies: [
                "DaouGeometry2D",
                "DaouAngle"
            ]),
    ]
)
