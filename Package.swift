// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PythonKit",
    products: [
        .executable(
            name: "PythonTool",
            targets: ["PythonTool"]
        ),
        .library(
            name: "PythonKit",
            targets: ["PythonKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pvieito/LoggerKit.git", .branch("master")),
        .package(url: "https://github.com/apple/swift-argument-parser", .branch("main")),
        .package(url: "https://github.com/kewlbear/Python-iOS.git", .branch("main")),
    ],
    targets: [
        .target(
            name: "PythonTool",
            dependencies: ["LoggerKit", "PythonKit", .product(name: "ArgumentParser", package: "swift-argument-parser")],
            path: "PythonTool"
        ),
        .target(
            name: "PythonKit",
            dependencies: ["Python-iOS"],
            path: "PythonKit"
        ),
        .testTarget(
            name: "PythonKitTests",
            dependencies: ["PythonKit"]
        ),
    ]
)
