# Uncomment the next line to define a global platform for your project
 platform :ios, '14.0'

target 'MovieDB' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire', '~> 5.10.2'
  pod 'Kingfisher', '~> 8.6.0'
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_STRICT_CONCURRENCY'] = 'minimal'
    end
  end
end
