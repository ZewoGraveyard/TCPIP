import PackageDescription

let package = Package(
    name: "TCPIP",
    targets: [Target(name: "TCPIP", dependencies: ["CTide"])]
)
