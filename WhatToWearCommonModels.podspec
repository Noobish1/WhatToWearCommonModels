Pod::Spec.new do |s|
    s.name                      = "WhatToWearCommonModels"
    s.version                   = "2.0.0"
    s.summary                   = "Common model files for both WhatToWear and WhatToWearBackend"
    s.homepage                  = "https://github.com/Noobish1/whattowearcommonmodels"
    s.license                   = "MIT"
    s.author                    = { "Blair McArthur" => "blair.mcarthur@icloud.com" }
    s.platform                  = :ios, '10.0'
    s.source                    = { :git => "https://github.com/Noobish1/whattowearcommonmodels.git", :tag => s.version.to_s }
    s.requires_arc              = true
    s.source_files              = "WhatToWearCommonModels/**/*.swift"
    s.module_name               = "WhatToWearCommonModels"
    s.swift_version             = "5.0"
    s.dependency "WhatToWearCommonCore"
    s.dependency "Tagged"
end
