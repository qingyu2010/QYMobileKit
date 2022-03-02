#
# Be sure to run `pod lib lint QYMobileKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QYMobileKit'
  s.version          = '0.3.0'
  s.summary          = 'Base framework for iOS developer'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  iOS移动开发基础框架（封装为更符合国人思维的Framework）
                       DESC

  s.homepage         = 'https://github.com/qingyu2010/QYMobileKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qingyu2010' => '578622889@qq.com' }
  s.source           = { :git => 'https://github.com/qingyu2010/QYMobileKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'QYMobileKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'QYMobileKit' => ['QYMobileKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
