source 'git@github.com:Noobish1/whattowearspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!
platform :ios, '10.0'

target 'WhatToWearCommonModels' do
    pod 'WhatToWearCommonCore', :git => 'git@github.com:Noobish1/whattowearcommoncore.git', :tag => '1.16.0'
    
    # Debug pods
    pod 'SwiftLint', '0.26.0', :configurations => 'Debug'
    
    target 'WhatToWearCommonModelsTests' do
        inherit! :search_paths
        pod 'Quick', '1.3.2'
        pod 'Nimble', '7.3.1'
        pod 'WhatToWearCommonTesting', :git => 'git@github.com:Noobish1/whattowearcommontesting.git', :tag => '1.4.0'
    end
end

post_install do | installer |
    # Set swift versions on pods
    updated_pods = ['WhatToWearCommonCore', 'WhatToWearCommonTesting']
    
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
            
            if updated_pods.include? target.name
                config.build_settings['SWIFT_VERSION'] = '4.2'
            else
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end
