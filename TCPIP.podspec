Pod::Spec.new do |s|
  s.name = 'TCPIP'
  s.version = '0.1'
  s.license = 'MIT'
  s.summary = 'TCP/IP for Swift 2 (Linux ready)'
  s.homepage = 'https://github.com/Zewo/TCPIP'
  s.authors = { 'Paulo Faria' => 'paulo.faria.rl@gmail.com' }
  s.source = { :git => 'https://github.com/Zewo/TCPIP.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'Dependencies/Tide/*.c', 'TCPIP/**/*.swift'

  s.xcconfig =  {
    'SWIFT_INCLUDE_PATHS' => '$(SRCROOT)/TCPIP/Dependencies'
  }

  s.preserve_paths = 'Dependencies/*'

  s.requires_arc = true
end