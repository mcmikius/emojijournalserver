// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "EmojiJournalServer",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.5.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMinor(from: "1.7.1")),
      .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", from: "8.0.0"),
      .package(url: "https://github.com/IBM-Swift/Configuration.git", from: "3.0.2"),
      .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.0.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-OpenAPI.git", from: "1.0.0"),
      .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-CouchDB.git", .upToNextMinor(from: "3.1.0")),
      .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", .upToNextMinor(from: "1.11.0")),
    ],
    targets: [
      .target(name: "EmojiJournalServer", dependencies: [ .target(name: "Application"), "Kitura" , "HeliumLogger", "CloudEnvironment", "Configuration", "CouchDB", "KituraStencil"]),
      .target(name: "Application", dependencies: [ "Kitura", "CloudEnvironment", "Configuration", "SwiftMetrics", "KituraOpenAPI", "Health", "CouchDB", "KituraStencil"]),

      .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), "Kitura","HeliumLogger", "Configuration"])
    ]
)
