//
//  ProgressBar.swift
//  Assets
//
//  Created by Kyle Brooks Robinson on 8/29/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable public class ProgressBar: UIView {
    
    //Value from 0-1.
    
    @IBInspectable public var currentValue: CGFloat = 0.5 { didSet { setNeedsDisplay() } }
    @IBInspectable public var fullColor: UIColor = UIColor.clearColor() { didSet { setNeedsDisplay() } }
    @IBInspectable public var progressColor: UIColor = UIColor.redColor() { didSet { setNeedsDisplay() } }
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        let fullPath = UIBezierPath(roundedRect: rect, cornerRadius: frame.size.height / 2)
        
        fullColor.set()
        CGContextAddPath(context, fullPath.CGPath)
        CGContextFillPath(context)
        
        //This rect is the progress bar. Width is calculated by multiplying the frame's width by the percentage the currentValue represents.
        let roundedRect = CGRect(origin: rect.origin, size: CGSize(width: currentValue * frame.size.width, height: rect.height))
        
        let progressPath = UIBezierPath(roundedRect: roundedRect, cornerRadius: frame.size.height / 2)
        
        progressColor.set()
        CGContextAddPath(context, progressPath.CGPath)
        CGContextFillPath(context)
        
    }
    
}
