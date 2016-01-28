//
//  MidpointSlider.swift
//  Pods
//
//  Created by Clint Cabanero on 1/28/16.
//
//

import UIKit
import QuartzCore

@IBDesignable
public class MidpointSlider: UIControl {
    
    //
    // MARK: - Configurable Slider Properties
    //
    
    // Slider min value
    @IBInspectable public var minimumValue: Double = -10.0 {
        didSet {
            initialize()
        }
    }
    
    // Slider max value
    @IBInspectable public var maximumValue: Double = 10.0 {
        didSet {
            initialize()
        }
    }
    
    // Slider current value
    @IBInspectable public var currentValue: Double = 7.0 {
        didSet {
            initialize()
        }
    }
    
    // the color shown between the midpoint and the slider
    @IBInspectable public var trackTintColor: UIColor = UIColor(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1.0) {
        didSet {
            initialize()
        }
    }
    
    // the color of the track (background)
    var trackBackgroundColor = UIColor(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1.0)
    
    //
    // MARK: - Properties not intended for updating by user
    //
    
    // the inside color of the thumb circle
    let thumbTintColor = UIColor.whiteColor()
    
    // the width of the outline for the thumb circle
    let thumbOutlineWidth = CGFloat(1.5)
    
    let curvaceousness : CGFloat = 1.0
    
    var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }
    
    // for tracking the touch locations
    var previousLocation = CGPoint()
    
    //
    // Mark: - Component Layers and Properties
    //
    
    // the track of the slider
    let trackLayer = MidpointSliderTrackLayer()
    
    // this layer is for drawing the midpoint of the slider
    let trackMidpointLayer = MidpointSliderPointLayer()
    
    // what user slides/moves along the track to change the currentValue
    let thumbLayer = MidpointSliderThumbLayer()
    
    //
    // MARK: - UIControl initialization
    //
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    /*
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    private func initialize() {
        // adding layers
        trackLayer.midpointSlider = self                                // back reference
        trackLayer.contentsScale = UIScreen.mainScreen().scale          // ensure looks good in retina display
        layer.addSublayer(trackLayer)
        
        trackMidpointLayer.midpointSlider = self                        // back reference
        trackMidpointLayer.contentsScale = UIScreen.mainScreen().scale
        layer.addSublayer(trackMidpointLayer)
        
        thumbLayer.midpointSlider = self                                // back reference
        thumbLayer.contentsScale = UIScreen.mainScreen().scale          // ensure looks good on retina display
        layer.addSublayer(thumbLayer)
    }
    
    // for supporting initialization programmatically
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    // for supporting use in Storyboard
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    override public var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let maximumSliderHeight = 30.0
        
        if (self.frame.size.height > CGFloat(31.0)) {
            
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: CGFloat(maximumSliderHeight))
            
        } else {
            
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
        }
        
        self.setNeedsDisplay()
    }
    
    // utility - positions/fits the control's layers on screen
    func updateLayerFrames() {
        
        // position the track layer
        trackLayer.frame = bounds.insetBy(dx: 0.0, dy: bounds.height / 2.3)
        trackLayer.setNeedsDisplay()
        
        // position the midpoint layer
        let midpointLayerPosition = CGFloat(positionForValue((maximumValue + minimumValue) / 2))
        trackMidpointLayer.frame = CGRect(x: midpointLayerPosition - thumbWidth / 2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        trackMidpointLayer.setNeedsDisplay()
        
        // position the thumb layer
        let thumbLayerPosition = CGFloat(positionForValue(currentValue))
        thumbLayer.frame = CGRect(x: thumbLayerPosition - thumbWidth / 2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        thumbLayer.setNeedsDisplay()
    }
    
    // utility - For a slider value, provides its position
    func positionForValue(value: Double) -> Double {
        return Double(bounds.width - thumbWidth) * (value - minimumValue) /
            (maximumValue - minimumValue) + Double(thumbWidth / 2.0)
    }
    
    //
    // MARK: - UIControl Tracking Touch Methods
    //
    
    // For handlinw when user touches the control
    override public func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        
        // translate touch event into control's coordinate space
        previousLocation = touch.locationInView(self)
        
        // evaluate if the touch was inside the thumbLayer's frame, set the thumbLayers highlighted state
        if thumbLayer.frame.contains(previousLocation) {
            thumbLayer.highlighted = true
        }
        
        return thumbLayer.highlighted
    }
    
    // Utility for ensuring the slider value is within the control's minimumValue and maxiumValue properties - this also ensures the thumbLayer does not move off slider
    func boundValue(value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double {
        return min(max(value, lowerValue), upperValue)
    }
    
    // For handling when users 'drags' along the control
    override public func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        
        // translate touch event into control's coordinate space
        let location = touch.locationInView(self)
        
        // number of pixels the user's touch travels
        let deltaLocation = Double(location.x - previousLocation.x)
        
        // scaled delta value based on the slider's min/max values
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / Double(bounds.width - thumbWidth)
        
        previousLocation = location
        
        // update the value
        if thumbLayer.highlighted {
            
            currentValue += deltaValue
            currentValue = boundValue(currentValue, toLowerValue: minimumValue, upperValue: maximumValue)
        }
        
        // update the UI
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        updateLayerFrames()
        
        CATransaction.commit()
        
        // notify any subscribed targets (e.g. any UIViewController that uses this slider)
        sendActionsForControlEvents(.ValueChanged)
        
        return true
    }
    
    // For handling when user is no longer touching and dragging on the control
    override public func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        thumbLayer.highlighted = false
        thumbLayer.setNeedsDisplay()
    }
}
