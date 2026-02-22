// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModernSettings",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v15),
        .macOS(.v26)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "ModernSettings", targets: ["ModernSettings"]),
        .executable(name: "LocalizedSettingsNameGenerator", targets: ["LocalizedSettingsNameGenerator"])
    ],
    targets: [
        .target(name: "ModernSettings", resources: [
            .process("Resources/Localizable.xcstrings", localization: .default)
        ]),
        .executableTarget(name: "LocalizedSettingsNameGenerator", path: "Sources/Tools")
    ]
)
