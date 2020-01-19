// swift-tools-version:5.1
import PackageDescription

let name = "WhatToWearCommonModels"

let package = Package(
    name: name,
    platforms: [
        .iOS(.v10),
        .macOS(.v10_14)
    ],
    products: [.library(name: name, targets: [name])],
    dependencies: [
        .package(url: "https://github.com/Noobish1/whattowearcommoncore.git", .branch("feature/using-backend")),
        .package(url: "https://github.com/pointfreeco/swift-tagged.git", from: "0.4.0"),
    ],
    targets: [
        .target(name: name, dependencies: ["WhatToWearCommonCore", "Tagged"], path: name),
    ]
)
