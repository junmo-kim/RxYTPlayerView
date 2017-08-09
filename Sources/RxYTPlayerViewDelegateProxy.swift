//
//  RxYTPlayerViewDelegateProxy.swift
//  RxYTPlayerView
//
//  Created by Junmo KIM on 2017. 8. 9..
//
//

import Foundation
import youtube_ios_player_helper
import RxSwift
import RxCocoa

class RxYTPlayerViewDelegateProxy: DelegateProxy, DelegateProxyType, YTPlayerViewDelegate {
    
    static func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let playerView = object as! YTPlayerView
        return playerView.delegate
    }
    
    static func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let playerView = object as! YTPlayerView
        playerView.delegate = delegate as? YTPlayerViewDelegate
    }
}
