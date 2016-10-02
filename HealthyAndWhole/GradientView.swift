//
//  GradientView.swift
//  Assets
//
//  Created by Kyle Brooks Robinson on 9/2/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor(white: 0.9, alpha: 1)
    @IBInspectable var endColor: UIColor = UIColor(white: 0.7, alpha: 1)
    @IBInspectable var startPosition: CGPoint = CGPoint(x: 0.5, y: 0)
    @IBInspectable var endPosition: CGPoint = CGPoint(x: 0.5, y: 1)
    @IBInspectable var cornerRadius: CGFloat = 10
    
    override func drawRect(rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        UIColor(white: 1, alpha: 0.5).set()
        CGContextSetLineCap(context, .Round)
        CGContextSetLineJoin(context, .Round)
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
        let gl = CAGradientLayer()
        
        gl.frame = layer.bounds
        gl.colors = [startColor.CGColor, endColor.CGColor]
        gl.startPoint = startPosition
        gl.endPoint = endPosition
        
        gl.setNeedsDisplay()
        gl.renderInContext(context)
        
    }
    
}
