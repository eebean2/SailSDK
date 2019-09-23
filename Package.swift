// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SailSDK",
    products: [
        .library(
            name: "SailSDK",
            targets: ["SailSDK"]),
    ],
    dependencies: [], // None for the moment
    targets: [
        .target(
            name: "SailSDK",
            dependencies: []),
        .testTarget(
            name: "SailSDKTest",
            dependencies: ["SailSDK"]),
    ]
)
