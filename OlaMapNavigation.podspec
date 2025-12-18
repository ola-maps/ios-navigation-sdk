Pod::Spec.new do |spec|
  spec.name          = 'OlaMapNavigation'
  spec.version       = '1.6.88'
  spec.summary       = 'OlaMaps PlatformSDK for Navigation and Maps'
  spec.description   = 'Navigation SDK provides a comprehensive toolkit for integrating basic & advanced navigation capabilities into your iOS applications.'
  spec.homepage      = 'https://maps.olakrutrim.com/'
  spec.author        = { 'OlaMaps Team' => 'support@olamaps.io' }
  spec.license       = { :type => 'Copyright', :file => 'LICENSE' }
  spec.source        = { :git => 'https://github.com/ola-maps/ios-navigation-sdk.git', :tag => spec.version.to_s }
  spec.swift_version = '5.0'
  spec.ios.deployment_target = '13.0'

  spec.ios.vendored_frameworks = 
    "Frameworks/Mapbox.xcframework",
    "Frameworks/OlaMapNavigation.xcframework",
    "Frameworks/OlaTurf.xcframework",
    "Frameworks/OlaMapPolyline.xcframework",
    "Frameworks/OlaMapDirection.xcframework",
    "Frameworks/Moengage-9.16.2/MoEngageAnalytics.xcframework",
    "Frameworks/Moengage-9.16.2/MoEngageCore.xcframework",
    "Frameworks/Moengage-9.16.2/MoEngageMessaging.xcframework",
    "Frameworks/Moengage-9.16.2/MoEngageObjCUtils.xcframework",
    "Frameworks/Moengage-9.16.2/MoEngageSDK.xcframework",
    "Frameworks/Moengage-9.16.2/MoEngageSecurity.xcframework"

end
