// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Compound",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Compound", targets: ["Compound"])
    ],
    dependencies: [
// Use the Github hosted version of Tchap Compound-design--tokens
//       .package(url: "https://github.com/tchapgouv/compound-design-tokens", branch: "angelo-uikit-ev2"),
// Use the local version of Tchap Compound-design--tokens
        .package(path: "../../tchap-x-compound/compound-design-tokens"),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect", from: "26.0.0"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols", from: "7.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", exact: "1.18.7")
    ],
    targets: [
        .target(
            name: "Compound",
            dependencies: [
                .product(name: "CompoundDesignTokens", package: "compound-design-tokens"),
                .product(name: "SwiftUIIntrospect", package: "SwiftUI-Introspect"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ]
        ),
        .testTarget(
            name: "CompoundTests",
            dependencies: [
                "Compound",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            exclude: [
                "__Snapshots__"
            ]
        )
    ]
)
