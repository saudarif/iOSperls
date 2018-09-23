//
//  MediaView.swift
//  Patterns
//
//  Created by Syed Saud Arif on 23/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation
import AVKit

class MyAVPlayerView : NSView, DocumentView {
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    
    func initWithDocumentPath( _ path: String) {
        if let url = URL.init(string: path) {
            let player = AVPlayer.init(url: url)
            let playerLayer = AVPlayerLayer.init(player: player)
            playerLayer.frame = self.bounds
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
            self.layer?.addSublayer(playerLayer)
        }
    }
    
}


class MyGraphicsView : NSImageView, DocumentView {
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    
    func initWithDocumentPath( _ path: String) {
        if let url = URL.init(string: path) {
            image = NSImage.init(contentsOf: url)
        }
    }
    
}
