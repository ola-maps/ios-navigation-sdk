// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "OlaMapNavigation",
     version: "1.0.1",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "OlaMapNavigation", targets: ["OlaMapNavigationSDK", "OlaMapDirection", "MapLibre", "OlaTurf"]),
    ],
    dependencies: [
        .package(url: "https://github.com/moengage/MoEngage-iOS-SDK.git", from: "moengage-9.16.2"),
    ],
    targets: [
        .target(
            name: "OlaMapNavigation",
            dependencies: [
                "MoEngage-iOS-SDK"
            ]
        ),
        .binaryTarget(
            name: "OlaMapNavigationSDK",
            path: "OlaMapNavigationSDK.xcframework"
        ),
        .binaryTarget(
            name: "OlaMapDirection",
            path: "OlaMapDirection.xcframework"
        ),
        .binaryTarget(
            name: "MapLibre",
            path: "MapLibre.xcframework"
        ),
        .binaryTarget(
            name: "OlaTurf",
            path: "OlaTurf.xcframework"
        ),
    ]
)