# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

target 'RxYTPlayerView' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RxYTPlayerView
  pod 'youtube-ios-player-helper', '~> 0.1.6'
  pod 'RxSwift', '~> 3.6'
  pod 'RxCocoa', '~> 3.6'
  pod 'RxOptional', '~> 3.1'

  target 'RxYTPlayerViewTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  puts 'Removing static analyzer support for pods'
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['OTHER_CFLAGS'] = "$(inherited) -Qunused-arguments -Xanalyzer -analyzer-disable-all-checks"
      config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
    end
  end
end
