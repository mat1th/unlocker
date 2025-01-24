// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Unlocker",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        .executable(name: "unlocker", targets: ["unlocker"]),
        .library(name: "UnlockerCore", targets: ["UnlockerCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
    ],
    targets: [
        .executableTarget(
            name: "unlocker",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "UnlockerCore",
                "SwiftLintPlugin",
            ],
            swiftSettings: [
                // Enable to validate if project is compatible with swift 6.0 Concurrency
                .enableExperimentalFeature("StrictConcurrency"),
            ]
        ),
        .target(
            name: "UnlockerCore",
            dependencies: ["SwiftLintPlugin"]
        ),
        .testTarget(
            name: "UnlockerCoreTests",
            dependencies: [
                "UnlockerCore",
            ]
        ),
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.58.2/SwiftLintBinary.artifactbundle.zip",
            checksum: "f2de7c148dba39bf0ad55ada8f60b15dde383c643c69f7eb2448bd2ed532f659"
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool(),
            dependencies: ["SwiftLintBinary"]
        ),
    ]
)
