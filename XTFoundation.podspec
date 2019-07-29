#
# Be sure to run `pod lib lint XTFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XTFoundation'
  s.version          = '0.0.1'
  s.summary          = '核心库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jj89757hhb/ZD_Repo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huhuabin' => 'hhbwork@163.com' }
  s.source           = { :git => 'https://github.com/jj89757hhb/ZD_Repo.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'XTFoundation/Classes/XTFoundation.h'

  s.subspec 'XTDefine' do |ss| 
    ss.source_files = 'XTFoundation/Classes/XTDefine/**/*'  
  end

  s.subspec 'XTCategory' do |ss|
    ss.source_files = 'XTFoundation/Classes/XTCategory/**/*'
    ss.dependency 'XTFoundation/XTDefine'
  end

  s.subspec 'XTUtils' do |ss|
    ss.source_files = 'XTFoundation/Classes/XTUtils/**/*'
    ss.dependency 'XTFoundation/XTDefine'
    ss.dependency 'XTFoundation/XTCategory'
  end
  
  
  # s.resource_bundles = {
  #   'XTFoundation' => ['XTFoundation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
