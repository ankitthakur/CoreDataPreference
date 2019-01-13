#
#  Be sure to run `pod spec lint CoreDataDefaults.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |spec|
  spec.name          = 'CoreDataDefaults'
  spec.version       = '0.0.3'
  spec.license       = { :type => 'BSD' }
  spec.homepage      = 'https://github.com/ankitthakur/CoreDataPreference'
  spec.authors       = { "Ankit Thakur" => "ankitthakur85@gmail.com" }
  spec.summary       = 'Using Core Data similar to UserDefault'
  spec.source        = { :git => 'https://github.com/ankitthakur/CoreDataPreference.git', :tag => 'v0.0.3' }
  spec.module_name   = 'CoreDataDefaults'
  spec.swift_version = '4.2'

  spec.ios.deployment_target  = '9.0'
  spec.osx.deployment_target  = '10.10'

  spec.source_files       = 'CoreDataDefaults/*.swift'
  spec.ios.source_files   = 'CoreDataDefaults/*.swift'

  spec.framework      = 'SystemConfiguration'
  spec.ios.framework  = 'UIKit'
  spec.osx.framework  = 'AppKit'

  # spec.dependency 'SomeOtherPod'
end
