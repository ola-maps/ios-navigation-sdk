// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "OlaMapNavigation",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "OlaMapNavigation", 
        targets: [
            "OlaMapNavigationSDK",
            "OlaMapDirection",
            "MapLibre",
            "OlaTurf",
            "MoEngageSecurity",
            "MoEngageSDK",
            "MoEngageObjCUtils",
            "MoEngageMessaging",
            "MoEngageCore",
            "MoEngageAnalytics"
        ]),
    ],
    dependencies: [
        .package(url: "https://github.com/moengage/MoEngage-iOS-SDK.git", from: "9.16.2"),
    ],
    targets: [
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
        .binaryTarget(
            name: "MoEngageAnalytics",
            path: "MoEngageAnalytics.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageCore",
            path: "MoEngageCore.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageMessaging",
            path: "MoEngageMessaging.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageObjCUtils",
            path: "MoEngageObjCUtils.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageSDK",
            path: "MoEngageSDK.xcframework"
        ),
        .binaryTarget(
            name: "MoEngageSecurity",
            path: "MoEngageSecurity.xcframework"
        ),
        
    ]
)