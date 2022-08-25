// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitBloc",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "UIKitBloc",
            targets: ["UIKitBloc"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "UIKitBloc",
            dependencies: []),
        .testTarget(
            name: "UIKitBlocTests",
            dependencies: ["UIKitBloc"]),
    ]
)
