// swift-tools-version:5.1
import PackageDescription

let name = "WhatToWearCommonModels"

let package = Package(
    name: name,
    products: [.library(name: name, targets: [name])],
    dependencies: [
        .package(url: "https://github.com/Noobish1/whattowearcommoncore.git", from: "2.1.0"),
    ],
    targets: [
        .target(name: name, dependencies: ["WhatToWearCommonCore"], path: name),
    ]
)
