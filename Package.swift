// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModernSettings",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "ModernSettingsWindow", targets: ["ModernSettingsWindow"]),
        .executable(name: "LocalizedSettingsNameGenerator", targets: ["LocalizedSettingsNameGenerator"])
    ],
    targets: [
        .target(name: "ModernSettingsWindow", resources: [
            .process("Resources/Localizable.xcstrings", localization: .default)
        ]),
        .executableTarget(name: "LocalizedSettingsNameGenerator", path: "Sources/Tools"),
    ]
)
