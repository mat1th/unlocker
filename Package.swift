// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Unlocker",
    platforms: [.macOS(.v10_13)],
    products: [
        .executable(name: "unlocker", targets: ["unlocker"]),
        .library(name: "UnlockerCore", targets: ["UnlockerCore"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.4")
    ],
    targets: [
        .executableTarget(
            name: "unlocker",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "UnlockerCore",
                "SwiftLintPlugin"
            ]
        ),
        .target(
            name: "UnlockerCore",
            dependencies: ["SwiftLintPlugin"]
        ),
        .testTarget(
            name: "UnlockerCoreTests",
            dependencies: [
                "UnlockerCore"
            ]
        ),
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.49.0/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "89e427517d6f999e025fccd48696e67bdf2d76e9e0804d115beca169c5019685"
        ),
        .plugin(
          name: "SwiftLintPlugin",
          capability: .buildTool(),
          dependencies: ["SwiftLintBinary"]
        )
    ]
)
