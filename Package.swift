// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "serpent",
    dependencies: [
        .package(url: "https://github.com/Azoy/Sword", .branch("master"))
    ],
    targets: [
        .target(
            name: "serpent",
            dependencies: ["Sword"]),
        .testTarget(
            name: "serpentTests",
            dependencies: ["serpent"]),
    ]
)
