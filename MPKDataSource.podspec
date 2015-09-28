Pod::Spec.new do |s|
  s.name         = "MPKDatasource"
  s.version      = "0.0.1"
  s.summary      = "Flexible data sources for UITableView"
  s.homepage     = "https://github.com/mikerudoy/MPKDatasource"
  s.license      = { :type => 'MIT', :file => 'LICENSE'  }
  s.author       = { "Mike Rudoy" => "mike.rudoi@gmail.com" }
  s.source       = { :git => "https://github.com/mikerudoy/MPKDatasource.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = '*.{h,m}'
  s.frameworks   = 'UIKit'
  s.social_media_url = "https://twitter.com/rudoyM"
end
