//
// Graphs.swift
// Assets
//
// Created by Kyle Robinson on 9/6/16.
// Copyright © 2016 StateFarm. All rights reserved.
//

import UIKit

public enum GraphType: String {
    case Lines, Bars, StackBars
}

@IBDesignable public class DesignableGraph: AnimatedView {
    
    public var type: GraphType = .Bars { didSet { setNeedsDisplay() } }
    public var groupings: [Grouping] = [] {
        
        didSet {
            
            noDataLabel.hidden = groupings.count > 0
            maxValueLabel.text = groupings.count > 0 ? "\(Int(maxValue))" : "0"
            minValueLabel.text = groupings.count > 0 ? "\(Int(minValue))" : "0"
            
            for v in groupingLabels.arrangedSubviews { v.removeFromSuperview() }
            
            for grouping in groupings {
                
                let label = UILabel()
                label.text = grouping.name
                label.textAlignment = .Center
                label.textColor = textColor
                label.font = .systemFontOfSize(12)
                groupingLabels.addArrangedSubview(label)
                
            }
            
        }
        
    }
    
    public var maxValue: CGFloat {
        return groupings.reduce(0) {
            let top = type == .Bars ? $1.max : $1.total
            return $0 < top ? top : $0
        }
    }
    
    public var minValue: CGFloat {
        return groupings.reduce(CGFloat(DBL_MAX)) {
            let bottom = type == .Bars ? 0 : $1.min
            return $0 > bottom ? bottom : $0
        }
    }
    
    @IBInspectable public var graphType: String = "Line" {
        didSet { type = GraphType(rawValue: graphType) ?? .Lines }
    }
    
    @IBInspectable public var name: String = "" { didSet { graphNameLabel.text = name } }
    @IBInspectable public var textColor: UIColor = .whiteColor() { didSet { setNeedsDisplay() } }
    @IBInspectable public var barColor: UIColor = .whiteColor() { didSet { setNeedsDisplay() } }
    @IBInspectable public var barColors: [UIColor] = [.whiteColor()] { didSet { setNeedsDisplay() } }
    @IBInspectable public var startColor: UIColor = .grayColor() { didSet { setNeedsDisplay() } }
    @IBInspectable public var endColor: UIColor = .grayColor() { didSet { setNeedsDisplay() } }
    @IBInspectable public var startPosition: CGPoint = CGPoint(x: 0.5, y: 0) { didSet { setNeedsDisplay() } }
    @IBInspectable public var endPosition: CGPoint = CGPoint(x: 0.5, y: 1) { didSet { setNeedsDisplay() } }
    @IBInspectable public var linePadding: CGFloat = 15 { didSet { setNeedsDisplay() } }
    @IBInspectable public var textPadding: CGFloat = 15 { didSet { setNeedsDisplay() } }
    @IBInspectable public var cornerRadius: CGFloat = 10 { didSet { setNeedsDisplay() } }
    
    public lazy var graphNameLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFontOfSize(12)
        label.textColor = self.textColor
        return label
        
    }()
    
    public lazy var maxValueLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFontOfSize(12)
        label.textColor = self.textColor
        return label
        
    }()
    
    public lazy var minValueLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFontOfSize(12)
        label.textColor = self.textColor
        return label
        
    }()
    
    public lazy var noDataLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFontOfSize(12)
        label.textColor = self.textColor
        return label
        
    }()
    
    public lazy var groupingLabels: UIStackView = {
        
        let stack = UIStackView()
        stack.distribution = .EqualSpacing
        return stack
        
    }()
    
    public override func prepareForInterfaceBuilder() {
        
        groupings = Array(count: 30, repeatedValue: 1000).map { Grouping(value: CGFloat(arc4random_uniform($0) + $0 / 2)) }
        
    }
    
    public override func drawRect(rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        barColor.set()
        CGContextSetLineCap(context, .Round)
        CGContextSetLineJoin(context, .Round)
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
        //Gradient: FIrst we draw a gradient layer over the background of the graph.
        
        let gl = CAGradientLayer()
        
        gl.frame = layer.bounds
        gl.colors = [startColor.CGColor, endColor.CGColor]
        gl.startPoint = startPosition
        gl.endPoint = endPosition
        
        gl.setNeedsDisplay()
        gl.renderInContext(context)
        
        // Top and Bottom Lines
        
        CGContextSetLineWidth(context, 1)
        
        CGContextMoveToPoint(context, linePadding, 30)
        CGContextAddLineToPoint(context, rect.width - linePadding, 30)
        
        CGContextMoveToPoint(context, linePadding, rect.height - 25)
        CGContextAddLineToPoint(context, rect.width - linePadding, rect.height - 25)
        
        CGContextStrokePath(context)
        
        // Dash Mid Line
        
        UIColor(white: 1, alpha: 0.3).set()
        CGContextSetLineDash(context, 0, [5,2], 2)
        
        CGContextMoveToPoint(context, linePadding, CGRectGetMidY(rect))
        CGContextAddLineToPoint(context, rect.width - linePadding, CGRectGetMidY(rect))
        
        CGContextStrokePath(context)
        
        //Content
        
        CGContextSetLineDash(context, 0, nil, 0)
        
        let graphRect = CGRect(x: textPadding, y: 55, width: rect.width - textPadding * 2, height: rect.height - 105)
        
        switch type {
        case .Lines: drawLinesGraph(context, rect: graphRect)
        case .Bars: drawBarsGraph(context, rect: graphRect)
        case .StackBars: break
        }
        
        groupingLabels.frame = CGRect(x: textPadding, y: rect.height - 25, width: rect.width - textPadding, height: 25)
        addSubview(groupingLabels)
        
        graphNameLabel.frame = CGRect(x: textPadding, y: 0, width: rect.width - textPadding * 2, height: 30)
        
        maxValueLabel.frame = CGRect(x: textPadding, y: 30, width: 200, height: 25)
        
        minValueLabel.frame = CGRect(x: textPadding, y: rect.height - 50, width: 200, height: 25)
        
        noDataLabel.frame = CGRectOffset(graphRect, 0, -20)
        addSubview(noDataLabel)
        
    }
    
    func drawLinesGraph(context: CGContextRef?, rect: CGRect) {
        
        let spacingX = rect.width / CGFloat(groupings.count)
        let spacingY = rect.height / CGFloat(maxValue)
        
        //Gradient
        
        var lines: [[CGPoint]] = []
        
        for (i, grouping) in groupings.enumerate() {
            
            if lines.count == i { lines.append([]) }
            
            let x = rect.minX + spacingX * CGFloat(i) + (spacingX / 2)
            
            for (i, _) in grouping.values.enumerate() {
                
                let y = rect.maxY - spacingY * grouping.stacked(i)
                lines[i].append(CGPoint(x: x, y: y))
                
            }
            
        }
        
        for line in lines {
            
            guard let last = line.last else { continue }
            
            CGContextSaveGState(context)
            
            CGContextMoveToPoint(context, last.x, last.y)
            CGContextMoveToPoint(context, rect.maxX - (spacingX / 2), rect.maxY)
            CGContextAddLineToPoint(context, rect.minX + (spacingX / 2), rect.maxY)
            
            for point in line {
                CGContextAddLineToPoint(context, point.x, point.y)
            }
            
            endColor.set()
            
            CGContextClip(context)
            
            let gradient = CGGradientCreateWithColors(nil, [endColor.CGColor, endColor.colorWithAlphaComponent(0.1).CGColor], nil)
            
            CGContextDrawLinearGradient(context, gradient, CGPoint(x: rect.midX, y: 0), CGPoint(x: rect.midX, y: rect.maxY), [])
            CGContextRestoreGState(context)
            
        }
        
        //Lines
        
        var lastPoints: [CGPoint] = []
        
        for (i, grouping) in groupings.enumerate() {
            
            var points: [CGPoint] = []
            
            let x = rect.minX + spacingX * CGFloat(i) + (spacingX / 2)
            
            for (i, _) in grouping.values.enumerate() {
                
                let y = rect.maxY - spacingY * grouping.stacked(i)
                
                points.append(CGPoint(x: x, y: y))
                
                if lastPoints.count > i {
                    
                    textColor.set()
                    CGContextMoveToPoint(context, lastPoints[i].x, lastPoints[i].y)
                    CGContextAddLineToPoint(context, x, y)
                    CGContextStrokePath(context)
                    
                }
                
                textColor.set()
                
                CGContextFillEllipseInRect(context, CGRect(x: x - 3, y: y - 3, width: 6, height: 6))
                
            }
            
            lastPoints = points
            
        }
        
        // Dots
        
        startColor.set()
        
        for (i, grouping) in groupings.enumerate() {
            
            let x = rect.minX + spacingX * CGFloat(i) + (spacingX / 2)
            
            for (i, _) in grouping.values.enumerate() {
                
                let y = rect.maxY - spacingY * grouping.stacked(i)
                
                CGContextFillEllipseInRect(context, CGRect(x: x - 2, y: y - 2, width: 4, height: 4))
                
            }
            
        }
        
    }
    
    func drawBarsGraph(context: CGContextRef?, rect: CGRect) {
                
        let spacingX = rect.width / CGFloat(groupings.count)
        let spacingY = rect.height / CGFloat(maxValue)
        
        CGContextSetLineWidth(context, 4)
        
        for (i, grouping) in groupings.enumerate() {
            
            let cX = rect.minX + spacingX * CGFloat(i) + (spacingX / 2)
            let barSpacing: CGFloat = 6
            let barStart: CGFloat = cX - CGFloat(grouping.values.count) / 2 * barSpacing
            
            for (i, value) in grouping.values.enumerate() {
                
                let x = barStart + CGFloat(i) * barSpacing
                let y = rect.maxY - spacingY * CGFloat(value) * CGFloat(progress)
                
                endColor.set()
                
                CGContextMoveToPoint(context, x, rect.minY)
                CGContextAddLineToPoint(context, x, rect.maxY)
                
                CGContextStrokePath(context)
                
                textColor.set()
                
                CGContextMoveToPoint(context, x, y)
                CGContextAddLineToPoint(context, x, rect.maxY)
                
                CGContextStrokePath(context)
                
            }
            
        }
        
    }
    
}


public struct Grouping {
    
    public var type: GraphType = .Lines
    
    public var name: String
    public var values: [CGFloat] = []
    public var total: CGFloat { return values.reduce(0) { $0 + $1 } }
    public var max: CGFloat { return values.reduce(0) { $0 < $1 ? $1 : $0 } }
    public var min: CGFloat { return values.reduce(0) { $0 > $1 ? $1 : $0 } }
    
    public init(name: String = "", value: CGFloat) {
        
        self.name = name
        self.values = [value]
        
    }
    
    public init(name: String = "", values: [CGFloat]) {
        
        self.name = name
        self.values = values
        
    }
    
    public func stacked(i: Int) -> CGFloat {
        
        return (0...i).reduce(0) { $0 + values[$1] }
        
    }
    
}