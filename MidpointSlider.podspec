#
# Be sure to run `pod lib lint MidpointSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "MidpointSlider"
    s.version          = "1.0.0"
    s.summary          = "MidpointSlider is a custom iOS control that allows the user to pull left or right from the slider's center when choosing a value."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
    s.description      = <<-DESC
    MidpointSlider is a custom iOS control that allows the user to pull left or right from the slider's center when choosing a value.  The slider's minimum and maximum values are configurable as well as the slider tint color.
                        DESC

    s.homepage         = "https://github.com/ccabanero/MidpointSlider"
    # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
    s.license          = 'MIT'
    s.author           = { "Clint Cabanero" => "clintcabanero@gmail.com" }
    s.source           = { :git => "https://github.com/ccabanero/MidpointSlider.git", :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/clintcabanero'

    s.platform     = :ios, '8.0'
    s.requires_arc = true

    s.source_files = 'Pod/Classes/**/*'
    s.resource_bundles = {
        'MidpointSlider' => ['Pod/Assets/*.png']
    }

    # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit', 'QuartzCore'
    # s.dependency 'AFNetworking', '~> 2.3'
end
