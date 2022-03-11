// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Unlocker",
    platforms: [.macOS(.v10_12)],
    products: [
        .executable(name: "unlocker", targets: ["unlocker"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.3")
    ],
    targets: [
        .executableTarget(
            name: "unlocker",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "unlockerTests",
            dependencies: [
                "unlocker"
            ])
    ]
)
