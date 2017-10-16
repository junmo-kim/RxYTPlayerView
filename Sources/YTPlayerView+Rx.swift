//
//  YTPlayerView+Rx.swift
//  RxYTPlayerView
//
//  Created by Junmo KIM on 2017. 8. 9..
//
//

import Foundation
import youtube_ios_player_helper
import RxSwift
import RxCocoa
import RxOptional

extension Reactive where Base: YTPlayerView {
    
    public var delegate: DelegateProxy<YTPlayerView, YTPlayerViewDelegate> {
        return RxYTPlayerViewDelegateProxy.proxy(for: base)
    }
    
    public var ready: Observable<Void> {
        return delegate
            .sentMessage(#selector(YTPlayerViewDelegate.playerViewDidBecomeReady(_:)))
            .map { $0[0] as? YTPlayerView }
            .map { _ in }
    }
    
    public var state: Observable<YTPlayerState> {
        let selector = #selector((YTPlayerViewDelegate.playerView(_:didChangeTo:)) as
            ((YTPlayerViewDelegate) -> (YTPlayerView, YTPlayerState) -> Void)?)
        return delegate
            .sentMessage(selector)
            .map { arguments -> YTPlayerState? in
                guard arguments.count >= 2 else { return nil }
                guard let rawValue = arguments[1] as? Int else { return nil }
                return YTPlayerState(rawValue: rawValue)
            }
            .filterNil()
    }
    
    public var quality: Observable<YTPlaybackQuality> {
        let selector = #selector((YTPlayerViewDelegate.playerView(_:didChangeTo:)) as
            ((YTPlayerViewDelegate) -> (YTPlayerView, YTPlaybackQuality) -> Void)?)
        return delegate
            .sentMessage(selector)
            .map { arguments -> YTPlaybackQuality? in
                guard arguments.count >= 2 else { return nil }
                guard let rawValue = arguments[1] as? Int else { return nil }
                return YTPlaybackQuality(rawValue: rawValue)
            }
            .filterNil()
    }
    
    public var error: Observable<YTPlayerError> {
        return delegate
            .sentMessage(#selector(YTPlayerViewDelegate.playerView(_:receivedError:)))
            .map { arguments -> YTPlayerError? in
                guard arguments.count >= 2 else { return nil }
                guard let rawValue = arguments[1] as? Int else { return nil }
                return YTPlayerError(rawValue: rawValue)
            }
            .filterNil()
    }
    
    public var playTime: Observable<CGFloat> {
        return delegate
            .sentMessage(#selector(YTPlayerViewDelegate.playerView(_:didPlayTime:)))
            .map({ $0[1] as? CGFloat })
            .filterNil()
    }
}
