Pod::Spec.new do |s|
  s.name             = 'DaouGeometry2D'
  s.version          = '1.0.0'
  s.summary          = 'DaouGeometry2D'

  s.homepage         = 'https://daou.co.kr/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daou TECH' => 'daoumobile8707@gmail.com' }
  s.source           = { :git => 'https://github.com/DaouMobile/DaouGeometry2D', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.swift_version    = '5.0'
  
  s.source_files = 'Sources/**/*.swift'
  s.dependency 'DaouAngle', '1.0.1'
end
