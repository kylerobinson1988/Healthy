//
//  Designable.swift
//  Assets
//
//  Created by Kyle Brooks Robinson on 9/2/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

protocol Designable {
    
    var borderColor: UIColor? { get set }
    var locked: Bool { get set }
    
}

extension Designable where Self: UIView {
    
    func prepare(context: CGContextRef?) -> CGContextRef? {
        
        CGContextSetLineCap(context, .Round)
        CGContextSetLineJoin(context, .Round)
        CGContextSetLineWidth(context, 1)
        
        (borderColor ?? UIColor.lightGrayColor()).set()
        
        userInteractionEnabled = !locked
        
        return context
        
    }
    
}

@IBDesignable public class DesignableLabel: UILabel {
    
    @IBInspectable public var lineColor: UIColor = UIColor.darkGrayColor() { didSet { setNeedsDisplay() } }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, 1)
        CGContextSetLineCap(context, .Round)
        
        lineColor.set()
        
        CGContextMoveToPoint(context, 0.5, rect.height - 0.5)
        CGContextAddLineToPoint(context, rect.width - 0.5, rect.height - 0.5)
        
        CGContextStrokePath(context)
        
    }
    
}

@IBDesignable public class DesignableView: UIView {
    
    @IBInspectable public var cornerRadius: CGFloat = 10 { didSet { setNeedsDisplay() } }
    @IBInspectable var fillColor: UIColor = .clearColor() { didSet { setNeedsDisplay() } }
    @IBInspectable var borderColor: UIColor = .clearColor() { didSet { setNeedsDisplay() } }
    @IBInspectable var borderWidth: CGFloat = 0 { didSet { setNeedsDisplay() } }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        let path = UIBezierPath(roundedRect:  CGRectInset(rect, borderWidth / 2, borderWidth / 2), cornerRadius: cornerRadius)
        
        fillColor.set()
        
        CGContextAddPath(context, path.CGPath)
        CGContextFillPath(context)
        
        borderColor.set()
        
        CGContextSetLineWidth(context, borderWidth)
        CGContextAddPath(context, path.CGPath)
        CGContextStrokePath(context)
        
    }
    
}

@IBDesignable public class DesignableImageView: UIImageView {
    
    @IBInspectable public var cornerRadius: CGFloat = 10 { didSet { setNeedsDisplay() } }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
    }
    
}

@IBDesignable class DesignableTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 10 { didSet { setNeedsDisplay() } }
    @IBInspectable var fillColor: UIColor = .clearColor() { didSet { setNeedsDisplay() } }
    @IBInspectable var borderColor: UIColor = .clearColor() { didSet { setNeedsDisplay() } }
    @IBInspectable var borderWidth: CGFloat = 0 { didSet { setNeedsDisplay() } }
    @IBInspectable var leftPadding: CGFloat = 15 { didSet { setNeedsDisplay() } }
    @IBInspectable var rightPadding: CGFloat = 15 { didSet { setNeedsDisplay() } }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        leftView?.frame.size.width = leftPadding
        rightView?.frame.size.width = rightPadding
        
        let context = UIGraphicsGetCurrentContext()
        
        let path = UIBezierPath(roundedRect: CGRectInset(rect, borderWidth / 2, borderWidth / 2), cornerRadius: cornerRadius)
        
        fillColor.set()
        
        CGContextAddPath(context, path.CGPath)
        CGContextFillPath(context)
        
        borderColor.set()
        
        CGContextSetLineWidth(context, borderWidth)
        CGContextAddPath(context, path.CGPath)
        CGContextStrokePath(context)
        
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        
    }

    override func didMoveToWindow() { layoutField() }
    override func prepareForInterfaceBuilder() { layoutField() }
    
    func layoutField() {
        
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: frame.height))
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: frame.height))
        
        leftViewMode = .Always
        rightViewMode = .Always
        
    }
    
}

@IBDesignable class DesignableButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 10 { didSet { setNeedsDisplay() } }
    @IBInspectable var fillColor: UIColor = .clearColor() { didSet { setNeedsDisplay() } }
    @IBInspectable var borderColor: UIColor = .clearColor() { didSet { setNeedsDisplay() } }
    @IBInspectable var borderWidth: CGFloat = 0 { didSet { setNeedsDisplay() } }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        let path = UIBezierPath(roundedRect: CGRectInset(rect, borderWidth / 2, borderWidth / 2), cornerRadius: cornerRadius)
        
        fillColor.set()
        
        CGContextAddPath(context, path.CGPath)
        CGContextFillPath(context)
        
        borderColor.set()
        
        CGContextSetLineWidth(context, borderWidth)
        CGContextAddPath(context, path.CGPath)
        CGContextStrokePath(context)
        
    }
    
}


















