//
//  DrawClass.swift
//  drawingExample
//
//  Created by Erling Austvoll on 2015/03/02.
//  Copyright (c) 2015年 Kingston University. All rights reserved.
//

import UIKit

class DrawClass: UIView {
    
    var lines:[Line] = []
    var lastPoint: CGPoint!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        lastPoint = touches.anyObject()?.locationInView(self)
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var newPoint = touches.anyObject()?.locationInView(self)
        lines.append(Line(start: lastPoint, end: newPoint!))
        lastPoint = newPoint
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        CGContextSetRGBStrokeColor(context, 1, 0, 0, 1)
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
    }

}
