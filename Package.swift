// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-fuzzing-example",
    platforms: [
        .macOS("13.3"),
        .iOS(.v15),
        // You can add other platforms like .iOS, .tvOS, etc.
    ],
    products: [
        .executable(
            name: "example-swift",
            targets: ["example-swift"]
        ),
        // ... other products ...
    ],
    dependencies: [
	// .package(url: "https://github.com/swift-server/swift-backtrace.git", .revision("4915cdd24e3300065cda228cb50d35ba00094aa3")),
    .package(url: "https://github.com/zecdev/zcash-swift-payment-uri.git", exact: "0.1.0-beta.10"),

        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .executableTarget(
            name: "example-swift",
            dependencies: [
                .product(name: "ZcashPaymentURI", package: "zcash-swift-payment-uri")
            ],
            exclude: ["Sources/main.swift"],
             cSettings: [
        .unsafeFlags(["-fsanitize=fuzzer-no-link"]),
        ]
        ),
        .testTarget(
            name: "example-swiftTests",
            dependencies: ["example-swift"]),
    ]
)
