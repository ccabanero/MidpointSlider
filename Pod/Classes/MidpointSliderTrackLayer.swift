//
//  MidpointSliderTrackLayer.swift
//  Pods
//
//  Created by Clint Cabanero on 1/28/16.
//
//

import UIKit
import QuartzCore

class MidpointSliderTrackLayer: CALayer {
    
    weak var midpointSlider: MidpointSlider?
    
    // draw the track
    override func drawInContext(ctx: CGContext) {
        
        if let slider = midpointSlider {
            
            // Clip the track
            let cornerRadius = bounds.height * slider.curvaceousness / 2.0
            let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            CGContextAddPath(ctx, path.CGPath)
            
            // Fill the track
            CGContextSetFillColorWithColor(ctx, slider.trackBackgroundColor.CGColor)
            CGContextAddPath(ctx, path.CGPath)
            CGContextFillPath(ctx)
            
            // Fill the highlighted range
            CGContextSetFillColorWithColor(ctx, slider.trackTintColor.CGColor)
            let lowerValuePosition = CGFloat(slider.positionForValue((slider.maximumValue + slider.minimumValue) / 2))
            let upperValuePosition = CGFloat(slider.positionForValue(slider.currentValue))
            let rect = CGRect(x: lowerValuePosition, y: 0.0, width: upperValuePosition - lowerValuePosition, height: bounds.height)
            CGContextFillRect(ctx, rect)
        }
    }
}
