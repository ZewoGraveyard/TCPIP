TCPIP
=====

[![Swift 2.0](https://img.shields.io/badge/Swift-2.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platforms OS X | iOS](https://img.shields.io/badge/Platforms-OS%20X%20%7C%20iOS-lightgray.svg?style=flat)](https://developer.apple.com/swift/)
[![CocoaPods Compatible](https://img.shields.io/badge/CocoaPods-Compatible-4BC51D.svg?style=flat)](https://cocoapods.org/pods/TCPIP)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-Compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://tldrlegal.com/license/mit-license)
[![Travis](https://img.shields.io/badge/Build-Passing-4BC51D.svg?style=flat)](https://travis-ci.org/Zewo/TCPIP)
[![codecov.io](http://codecov.io/github/Zewo/TCPIP/coverage.svg?branch=master)](http://codecov.io/github/Zewo/TCPIP)
[![Slack Status](https://zewo-slackin.herokuapp.com/badge.svg)](https://zewo-slackin.herokuapp.com)

**TCPIP** is a TCP/IP library for **Swift 2**.

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

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build TCPIP.

To integrate **TCPIP** into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/Zewo/Specs.git'
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

pod 'TCPIP', '0.1'
```
> Don't forget  `source 'https://github.com/Zewo/Specs.git'`. This is very important. It should always come before the official CocoaPods repo.

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate **TCPIP** into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Zewo/TCPIP" == 0.1
```

### Command Line Application

To use **TCPIP** in a command line application:

- Install the [Swift Command Line Application](https://github.com/Zewo/Swift-Command-Line-Application-Template) Xcode template
- Follow [CocoaPods](#cocoapods) or [Carthage](#carthage) instructions.

## Community

[![Slack](http://s13.postimg.org/ybwy92ktf/Slack.png)](https://zewo-slackin.herokuapp.com)

Join us on [Slack](https://zewo-slackin.herokuapp.com).

License
-------

**TCPIP** is released under the MIT license. See LICENSE for details.
