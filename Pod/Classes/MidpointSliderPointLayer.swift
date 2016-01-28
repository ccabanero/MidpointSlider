//
//  MidpointSliderPointLayer.swift
//  Pods
//
//  Created by Clint Cabanero on 1/28/16.
//
//

import UIKit
import QuartzCore

class MidpointSliderPointLayer: CALayer {
    
    weak var midpointSlider: MidpointSlider?
    
    // draw the mid-point thumb
    override func drawInContext(ctx: CGContext) {
        
        if let slider = midpointSlider {
            
            let thumbFrame = bounds.insetBy(dx: 9, dy: 9)
            let cornerRadius = thumbFrame.height * slider.curvaceousness / 2.0
            let thumbPath = UIBezierPath(roundedRect: thumbFrame, cornerRadius: cornerRadius)
            
            // Draw thumb Fill
            CGContextSetFillColorWithColor(ctx, slider.thumbTintColor.CGColor)
            CGContextAddPath(ctx, thumbPath.CGPath)
            CGContextFillPath(ctx)
            
            
            // Draw thumb Outline
            CGContextSetStrokeColorWithColor(ctx, slider.trackTintColor.CGColor)
            CGContextSetLineWidth(ctx, slider.thumbOutlineWidth)
            CGContextAddPath(ctx, thumbPath.CGPath)
            CGContextStrokePath(ctx)
        }
    }
}
