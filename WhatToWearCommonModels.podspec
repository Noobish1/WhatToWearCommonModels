Pod::Spec.new do |s|
    s.name                      = "WhatToWearCommonModels"
    s.version                   = "1.8.1"
    s.summary                   = "Common model files for both WhatToWear and WhatToWearBackend"
    s.homepage                  = "https://bitbucket.org/BlairMcArthur/whattowearcommonmodels"
    s.license                   = "MIT"
    s.author                    = { "Blair McArthur" => "blair.mcarthur@icloud.com" }
    s.platform                  = :ios, '10.0'
    s.source                    = { :git => "https://bitbucket.org/BlairMcArthur/whattowearcommonmodels.git", :tag => s.version.to_s }
    s.requires_arc              = true
    s.source_files              = "WhatToWearCommonModels/**/*.swift"
    s.module_name               = "WhatToWearCommonModels"
    s.swift_version             = "4.2"
    s.dependency "WhatToWearCommonCore"
end
