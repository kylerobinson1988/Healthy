//
//  Animation.swift
//  Assets
//
//  Created by Kyle Robinson on 9/6/16.
//  Copyright © 2016 StateFarm. All rights reserved.
//

import UIKit

public enum CurveType {
    case Linear
}

public class AnimatedView: UIView {
    
    public var delay: NSTimeInterval = 0
    public var duration: NSTimeInterval = 0
    public var curve: CurveType = .Linear
    public var fps: Double = 30
    
    public var progress: NSTimeInterval { return keyFrame / duration }
    
    private var timer: NSTimer?
    private var keyFrame: NSTimeInterval = 0
    private var speed: NSTimeInterval { return 1 / fps }
    
    private var paused: Bool = true
    
    public func start(reset: Bool = true) {
        
        setNeedsDisplay()
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(speed, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        keyFrame = reset ? 0 : keyFrame
        paused = false
        
    }
    
    public func pause() {
        
        timer?.invalidate()
        if paused { start(false) } else { paused = true }
        
    }
    
    public func stop(reset: Bool = true) {
        
        timer?.invalidate()
        keyFrame = reset ? 0 : keyFrame
        paused = true
        
    }
    
    public func finish() {
        
        timer?.invalidate()
        paused = false
        keyFrame = duration
        
    }
    
    public func clearOut(time: NSTimeInterval) {
        
        timer?.invalidate()
        keyFrame = time
        paused = true
        
    }
    
    func update() {
        
        keyFrame += speed * (duration - keyFrame) * 3
        
        if keyFrame > duration - 0.0001 { keyFrame = duration }
        
        setNeedsDisplay()
        
        guard keyFrame < duration else { return stop(false) }
        
    }
    
}