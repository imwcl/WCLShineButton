#
#  Be sure to run `pod spec lint WCLShineButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name          = "WCLShineButton"
  s.version       = "1.0.3"
  s.summary       = "This is a UI lib for iOS. Effects like shining."
  s.homepage      = "https://github.com/631106979/WCLShineButton"
  s.license       = 'MIT'
  s.author        = { "W_C__L" => "wangchonglei93@icloud.com" }
  s.platform      = :ios, "8.0" 
  s.source        = { :git => "https://github.com/631106979/WCLShineButton.git", :tag => "1.0.3" }
  s.source_files  = 'WCLShineButton/*.{swift}'
  s.resources     = 'WCLShineButton/WCLShineButton.bundle'
  s.frameworks    = "UIKit"
  s.requires_arc  = true

end
