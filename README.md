[Deprecated] TCPIP
=====

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![License][mit-badge]][mit-url]
[![Slack][slack-badge]][slack-url]

**TCPIP** is a TCP/IP library for **Swift 3.0**.

## Features

- [x] No `Foundation` dependency (**Linux ready**)
- [x] Local IP
- [x] Remote IP
- [x] TCP Server Socket
- [x] TCP Client Socket

## Usage

`IP`
----

```swift
// local
do {
    // all network interfaces
    let ip1 = try IP(port: 5555, mode: .IPV4)
    
    // specific network interface
    let ip2 = try IP(networkInterface: "en0", port: 5555, mode: .IPV6)
} catch {
    // something bad happened :(
}

// remote
do {
    let ip3 = try IP(address: "127.0.0.1", port: 5555, mode: .IPV4)
} catch {
    // something bad happened :(
}
```

`TCP`
----

```swift
// server
do {
	let ip = try IP(port: 5555)
	let serverSocket = try TCPServerSocket(ip: ip)
	let clientSocket = try serverSocket.accept()
	
	let yo = try clientSocket.receiveString(untilDelimiter: "\n")
} catch {
    // something bad happened :(
}

// client
do {
	let ip = try IP(address: "127.0.0.1", port: 5555)
	let clientSocket = try TCPClientSocket(ip: ip)
	
	// calls to send append the data to an internal
	// buffer to minimize system calls
	try clientSocket.sendString("yo\n")
	// flush actually sends all data in the buffer
	try clientSocket.flush()
} catch {
    // something bad happened :(
}
```

### Package

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/Zewo/TCPIP.git", majorVersion: 0, minor: 4)
    ]
)

```

### Command Line Application

To use **TCPIP** in a command line application:

- Install the [Swift Command Line Application](https://github.com/Zewo/Swift-Command-Line-Application-Template) Xcode template

## Community

[![Slack](http://s13.postimg.org/ybwy92ktf/Slack.png)](https://zewo-slackin.herokuapp.com)

Join us on [Slack](https://zewo-slackin.herokuapp.com).

License
-------

**TCPIP** is released under the MIT license. See LICENSE for details.

[swift-badge]: https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platform-Mac%20%26%20Linux-lightgray.svg?style=flat
[platform-url]: https://swift.org
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license
[slack-image]: http://s13.postimg.org/ybwy92ktf/Slack.png
[slack-badge]: https://zewo-slackin.herokuapp.com/badge.svg
[slack-url]: http://slack.zewo.io
