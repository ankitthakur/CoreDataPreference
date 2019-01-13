#
#  Be sure to run `pod spec lint CoreDataDefaults.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name             = "CoreDataDefaults"
  s.summary          = "Using Core Data similar to UserDefault"
  s.version          = "1.0.0"
  s.homepage         = "https://github.com/ankitthakur/CoreDataPreference"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Ankit Thakur" => "ankitthakur85@icloud.com" }
  s.source           = {
    :git => "https://github.com/ankitthakur/CoreDataPreference.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/ankitthakur'

  s.ios.deployment_target = '8.4'
  # s.osx.deployment_target = '10.9'
  s.swift_version = '4.2'

  s.requires_arc = true
  s.ios.source_files = 'CoreDataDefaults/**/*.{h,m,swift}'
  s.ios.resources = 'CoreDataDefaults/**/*.xcdatamodeld'


  s.ios.frameworks = 'CoreData', 'Foundation'

  # s.dependency 'EncryptedCoreData, :git => https://github.com/project-imas/encrypted-core-data, :commit => b97ffaf2f19dad4d1558bc9b0668cc2e09d17347'
  # s.dependency 'SwiftyBeaver'
end
