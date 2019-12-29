source 'git@github.com:Noobish1/whattowearspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!
platform :ios, '10.0'

target 'WhatToWearCommonModels' do
    pod 'WhatToWearCommonCore', '2.0.0'
    pod 'Tagged', '0.4.0'
    
    # Debug pods
    pod 'SwiftLint', '0.37.0', :configurations => 'Debug'
    
    target 'WhatToWearCommonModelsTests' do
        inherit! :search_paths
        pod 'Quick', '2.2.0'
        pod 'Nimble', '8.0.4'
        pod 'WhatToWearCommonTesting', '2.0.0'
        pod 'WhatToWearCommonCore', '2.0.0'
        pod 'R.swift', '5.0.3'
        
        # Have to do this so the tests run, I don't know why
        pod 'TaggedTime', '0.4.0'
    end
end
