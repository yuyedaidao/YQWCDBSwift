#
# Be sure to run `pod lib lint YQWCDBSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YQWCDBSwift'
  s.version          = '0.1.1'
  s.summary          = 'YQWCDBSwift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '畅媒未来版公共模块-YQWCDBSwift'

  s.homepage         = 'https://github.com/yuyedaidao/YQWCDBSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wyqpadding@gmail.com' => 'wyqpadding@gmail.com' }
  s.source           = { :git => 'https://github.com/yuyedaidao/YQWCDBSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'YQWCDBSwift/Classes/**/*'
  
#  s.resource_bundles = {
#    'YQWCDBSwift' => ['YQWCDBSwift/Assets/*.png']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  # s.dependency 'Moya/RxSwift', '~> 12.0'
  # s.dependency 'SnapKit', '~> 4.0.0'
  # s.dependency 'RxCoreData', '~> 0.5.1'
  # s.dependency 'RxDataSources', '~> 3.0'
  s.dependency 'WCDB.swift', '1.0.8.2'
  s.dependency 'SwiftyBeaver'
end
