Pod::Spec.new do |s|
  s.name         = "RxYTPlayerView"
  s.version      = "0.1.0"
  s.summary      = "Rx extension for YTPlayerView (YouTube-Player-iOS-Helper)"
  s.homepage     = "https://github.com/junmo-kim/RxYTPlayerView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Junmo KIM" => "me@junmo.kim" }
  s.social_media_url   = "https://www.linkedin.com/in/junmo-kim/"

  s.dependency 'youtube-ios-player-helper', '>= 0.1.6'
  s.dependency 'RxSwift', '>= 3.6'
  s.dependency 'RxCocoa', '>= 3.6'
  s.dependency 'RxOptional', '>= 3.1'

  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/junmo-kim/RxYTPlayerView.git",
                     :tag => s.version.to_s }
  s.source_files = "Sources/*.swift"
end
