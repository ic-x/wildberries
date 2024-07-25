// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "UISystem",
    defaultLocalization: "en-US",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "UISystem",
            targets: ["UISystem"]),
    ],
    targets: [
        .target(
            name: "UISystem",
            resources: [.process("Resources")]),
    ]
)
