import PackageDescription

let package = Package(
    name: "YourFramework",
    platforms: [
        .iOS(.v12),   // Adjust the version as needed
        .macOS(.v10_12),
        // Add other platforms (watchOS, tvOS) as needed
    ],
    products: [
        .library(name: "YourFramework", targets: ["YourFramework"]),
    ],
    targets: [
        .binaryTarget(
            name: "YourFramework",
            url: "https://example.com/path/to/YourFramework.xcframework.zip", // Replace with the actual URL
            checksum: "sha256:yourchecksum"  // Replace with the actual checksum
        ),
    ]
)