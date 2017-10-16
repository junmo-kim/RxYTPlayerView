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

public class RxYTPlayerViewDelegateProxy
    : DelegateProxy<YTPlayerView, YTPlayerViewDelegate>
    , DelegateProxyType
    , YTPlayerViewDelegate {
    
    public static func registerKnownImplementations() {}
    
    public static func setCurrentDelegate(_ delegate: YTPlayerViewDelegate?, to object: ParentObject) {
        object.delegate = delegate
    }
    
    public static func currentDelegate(for object: ParentObject) -> YTPlayerViewDelegate? {
        return object.delegate
    }
}
