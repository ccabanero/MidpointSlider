//
//  ViewController.swift
//  MidpointSlider
//
//  Created by Clint Cabanero on 01/27/2016.
//  Copyright (c) 2016 Clint Cabanero. All rights reserved.
//

import UIKit

// Step 1: Import the MidpointSlider.
import MidpointSlider

class ViewController: UIViewController {

    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Step 2: Create a MidpointSlider.
        let midpointSlider = MidpointSlider(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        midpointSlider.center = self.view.center
        
        // Step 3: Set the minimum and maximum values for the slider and the starting value.
        midpointSlider.minimumValue = -10
        midpointSlider.maximumValue = 10
        midpointSlider.currentValue = 10
        
        // Step 4 (Optional): Set the color of the MidpointSlider to match the look and feel of your app.
        midpointSlider.trackTintColor = UIColor.orangeColor()
        
        // Step 5: Add a target and action to handle when the user changes the MidpointSlider value.
        midpointSlider.addTarget(self, action: "midpointSliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        // Step 6: Add the MidpointSlider to your view.
        view.addSubview(midpointSlider)
    }

    // Step 7: Implement what should happen when the MidpointSlider value changes.
    func midpointSliderValueChanged(midpointSlider: MidpointSlider) {
        
        // get the current slider value
        let sliderValue = midpointSlider.currentValue
        
        // show value in the console
        print("Value changed to : \(sliderValue))")
        
        // updat the label with the current value
        sliderValueLabel.text = "\(Double(round(10*sliderValue)/10))"
    }
}

