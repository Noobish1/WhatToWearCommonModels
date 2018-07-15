source 'git@bitbucket.org:BlairMcArthur/whattowearspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!
platform :ios, '10.0'

target 'WhatToWearCommonModels' do
    pod 'WhatToWearCommonCore', :git => 'git@bitbucket.org:BlairMcArthur/whattowearcommoncore.git', :tag => '1.5.0'
    
    # Debug pods
    pod 'SwiftLint', '0.26.0', :configurations => 'Debug'
end

target 'WhatToWearCommonModelsTests' do
    inherit! :search_paths
    pod 'Quick', '1.3.0'
    pod 'Nimble', '7.1.1'
    pod 'Fakery', '3.3.0'
    pod 'WhatToWearCommonTesting', :git => 'git@bitbucket.org:BlairMcArthur/whattowearcommontesting.git', :tag => '1.0.0'
end
