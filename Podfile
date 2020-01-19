source 'git@github.com:Noobish1/whattowearspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

def main_pods
    pod 'WhatToWearCommonCore', :git => 'https://github.com/Noobish1/WhatToWearCommonCore.git', :branch => 'feature/using-backend'
    pod 'Tagged', '0.4.0'
    
    # Debug pods
    pod 'SwiftLint', '0.37.0', :configurations => 'Debug'
end

def testing_pods
    pod 'Quick', '2.2.0'
    pod 'Nimble', '8.0.4'
    pod 'WhatToWearCommonTesting', :git => 'https://github.com/Noobish1/WhatToWearCommonTesting.git', :branch => 'feature/using-backend'
    pod 'WhatToWearCommonCore', :git => 'https://github.com/Noobish1/WhatToWearCommonCore.git', :branch => 'feature/using-backend'
    pod 'R.swift', '5.0.3'
    
    # Have to do this so the tests run, I don't know why
    pod 'TaggedTime', '0.4.0'
end

target 'WhatToWearCommonModels' do
    platform :ios, '10.0'
    
    main_pods
    
    target 'WhatToWearCommonModelsTests' do
        inherit! :search_paths

        testing_pods
    end
end

target 'WhatToWearCommonModels-Mac' do
    platform :osx, '10.14'
    
    main_pods
end
