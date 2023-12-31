// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMapPackage",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "YandexMapPackage",
            targets: ["YandexMapPackage"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/c-villain/YandexMapsMobile",
            exact: "4.3.1"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "YandexMapPackage",
                dependencies: [
                    .product(name: "YandexMapsMobile", package: "YandexMapsMobile"),
                ],
                linkerSettings: [
                    .linkedFramework("CoreLocation"),
                    .linkedFramework("CoreTelephony"),
                    .linkedFramework("SystemConfiguration"),
                    .linkedLibrary("c++"),
                    .unsafeFlags(["-ObjC"]),
                ])
    ]
)
