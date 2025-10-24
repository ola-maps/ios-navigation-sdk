#
# Be sure to run `pod lib lint ola-mapbox-direction.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OlaMapDirection'
  s.version          = '1.0.2.4'
  s.summary          = 'Forked MapLibre Direction SDK'
  s.description      = <<-DESC
  Forked MapBox Direction SDK for OlaMap Navigation SDK
                       DESC
  s.homepage         = 'https://github.com/ola-map/ios-ola-map-direction'
  s.author        = { 'OlaMaps Team' => 'support@olamaps.io' }
  s.license       = { :type => 'Copyright', :file => 'LICENSE' }
  s.source           = { :git => 'git@github.com:ola-map/ios-ola-map-direction.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.dependency 'OlaMapPolyline', "1.0.1"
  s.source_files = 'OlaMapDirection/Classes/**/*'
end
