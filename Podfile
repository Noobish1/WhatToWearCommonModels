source 'git@github.com:Noobish1/whattowearspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!
platform :ios, '10.0'

target 'WhatToWearCommonModels' do
    pod 'WhatToWearCommonCore', :git => 'git@github.com:Noobish1/whattowearcommoncore.git', :tag => '1.18.1'
    pod 'Tagged', '0.3.0'
    
    # Debug pods
    pod 'SwiftLint', '0.26.0', :configurations => 'Debug'
    
    target 'WhatToWearCommonModelsTests' do
        inherit! :search_paths
        pod 'Quick', '2.0.0'
        pod 'Nimble', '8.0.1'
        pod 'WhatToWearCommonTesting', :git => 'git@github.com:Noobish1/whattowearcommontesting.git', :tag => '1.6.0'
        
        # Have to do this so the tests run, I don't know why
        pod 'TaggedTime', '0.3.0'
    end
end

post_install do | installer |
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
            config.build_settings['SWIFT_VERSION'] = '4.2'
        end
    end
end
