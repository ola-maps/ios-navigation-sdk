// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "OlaMapNavigationSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "OlaMapNavigationSDK", targets: ["OlaMapNavigationSDK", "OlaMapDirection", "MapLibre", "OlaTurf", ""]),
    ],
    dependencies: [
        .package(url: " https://github.com/moengage/MoEngage-iOS-SDK.git", from: "9.16.2"),
    ],
    targets: [
        .binaryTarget(
            name: "OlaMapNavigationSDK",
            path: "OlaMapNavigationSDK.xcframework",
        ),
        .binaryTarget(
            name: "OlaMapDirection",
            path: "OlaMapDirection.xcframework",
        ),
        .binaryTarget(
            name: "MapLibre",
            path: "MapLibre.xcframework",
        ),
        .binaryTarget(
            name: "OlaTurf",
            path: "OlaTurf.xcframework",
        ),
    ]
)