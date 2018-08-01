#
#  Be sure to run `pod spec lint Beerchip-MellowMashroom-SDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "Beerchip-MellowMashroom-SDK"

 s.version      = "0.1.2"

  s.summary      = "It Contains beerchip view. It contains a View/Redeem button to open the pod functionality"

  s.description  = "This framework contains beerchip view. This view contains View/Redeem button. if we click this button, the actual pod functionality will open."

  s.homepage     = "http://vmokshagroup.com"

  s.license      = "MIT"

  s.author       = { "Srinivasulu Budharapu" => "srinivasulu.budharapu@vmokshagroup.com" }

  s.platform     = :ios, "9.0"

  s.ios.deployment_target = "11.0"

  s.source       = { :git => "https://github.com/Srinivasulu3264/Beerchip-MellowMashroom-SDK.git", :tag => "0.1.2" }


  s.source_files  = "Beerchip-MellowMashroom-SDK", "Beerchip-MellowMashroom-SDK/**/*.{h,m, swift}"

  s.resources = "Beerchip-MellowMashroom-SDK/**/*.{xcassets,png,jpeg,jpg,storyboard,xib}"

  s.resource_bundle = {
      'Beerchip-MellowMashroom-SDK' => 
        'Beerchip-MellowMashroom-SDK/**/*.{xcassets,png,jpeg,jpg,storyboard,xib}'
    }


  s.framework  = "UIKit"

   s.requires_arc = true

  `echo "3.2" > .swift-version`  



end
