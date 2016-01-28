//
//  MidpointSliderThumbLayer.swift
//  Pods
//
//  Created by Clint Cabanero on 1/28/16.
//
//

import UIKit

class MidpointSliderThumbLayer: CALayer {
    
    var highlighted = false
    weak var midpointSlider: MidpointSlider?
    
    // draw the thumb
    override func drawInContext(ctx: CGContext) {
        
        if let slider = midpointSlider {
            
            let thumbFrame = bounds.insetBy(dx: 2.0, dy: 2.0)
            let cornerRadius = thumbFrame.height * slider.curvaceousness / 2.0
            let thumbPath = UIBezierPath(roundedRect: thumbFrame, cornerRadius: cornerRadius)
            
            // Draw thumb Fill
            CGContextSetFillColorWithColor(ctx, slider.thumbTintColor.CGColor)
            CGContextAddPath(ctx, thumbPath.CGPath)
            CGContextFillPath(ctx)
            
            // Draw inside dot
            let thumbFrame2 = bounds.insetBy(dx: 7, dy: 7)
            let cornerRadius2 = thumbFrame2.height * slider.curvaceousness / 2.0
            let thumbPath2 = UIBezierPath(roundedRect: thumbFrame2, cornerRadius: cornerRadius2)
            CGContextSetFillColorWithColor(ctx, slider.trackTintColor.CGColor)
            CGContextAddPath(ctx, thumbPath2.CGPath)
            CGContextFillPath(ctx)
            
            // Draw thumb Outline
            CGContextSetStrokeColorWithColor(ctx, slider.trackTintColor.CGColor)
            CGContextSetLineWidth(ctx, slider.thumbOutlineWidth)
            CGContextAddPath(ctx, thumbPath.CGPath)
            CGContextStrokePath(ctx)
        }
    }
}

extension UIColor {
    
    // Returns the RGB components of a color as a tuple
    func rgb() -> (red:Float, green:Float, blue:Float, alpha:Float)? {
        
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            
            //
            print("red: \(fRed) green: \(fGreen) blue: \(fBlue) alpha: \(fAlpha)")
            
            let iRed = Float(fRed * 255.0)
            let iGreen = Float(fGreen * 255.0)
            let iBlue = Float(fBlue * 255.0)
            let iAlpha = Float(fAlpha * 255.0)
            
            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}
