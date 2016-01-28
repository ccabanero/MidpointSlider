# MidpointSlider

[![CI Status](http://img.shields.io/travis/Clint Cabanero/MidpointSlider.svg?style=flat)](https://travis-ci.org/Clint Cabanero/MidpointSlider)
[![Version](https://img.shields.io/cocoapods/v/MidpointSlider.svg?style=flat)](http://cocoapods.org/pods/MidpointSlider)
[![License](https://img.shields.io/cocoapods/l/MidpointSlider.svg?style=flat)](http://cocoapods.org/pods/MidpointSlider)
[![Platform](https://img.shields.io/cocoapods/p/MidpointSlider.svg?style=flat)](http://cocoapods.org/pods/MidpointSlider)
![Swift 2.0](https://img.shields.io/badge/swift-2.0-orange.svg)

MidpointSlider is a custom iOS control that allows the user to pull left or right from the slider's center when choosing a value.

## Installation

####Cocoa Pods

MidpointSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod "MidpointSlider"
```

####Manual Installation

Alternatively, you can manually copy the following files directly into your Xcode project:

![screenshot](/imgs/MidpointSlider_manualInstall.png)

## Usage (Programmatically)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Alternatively, see the code sample below:

__Step 1__. Import the MidpointSlider library.

````
import MidpointSlider 
````

__Step 2__. Instantiate a new MidpointSlider.

````
let midpointSlider = MidpointSlider(frame: CGRect(x: 10, y: 10, width: 300, height: 30))
````

__Step 3__. Set the minimum and maximum values for the slider.  By default, -10 is the minimum value and 10 is the maximum value (with 0 as the midpoint).  However, change these values as needed by your application.

Set the current value for where the slider should start when loaded.  Optionally, set the track tint color to match the look-and-feel of your application.

````
midpointSlider.minimumValue = -100
midpointSlider.maximumValue = 100
midpointSlider.currentValue = 70
midpointSlider.trackTintColor = UIColor.orangeColor()
````

__Step 4__. Add a target and action to handle when user changes the slider value.

````
midpointSlider.addTarget(self, action: "midpointSliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
````

__Step 5__. Add the MidpointSlider to your view.

````
view.addSubview(midpointSlider)
````

__Step 6__. Finally, declare your action method to handle when the slider value changes.

````
func midpointSliderValueChanged(midpointSlider: MidpointSlider) {

    let sliderValue = midpointSlider.currentValue

    print("Value changed to : \(sliderValue))")
}

````

Complete Programmatic Code Sample:

````

// STEP 1: Import the MidpointSlider.
import MidpointSlider

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // STEP 2: Instantiate a new MidPointSlider.
        let midpointSlider = MidpointSlider(frame: CGRect(x: 40, y: 300, width: 300, height: 30))

        // STEP 3: Set the minimum and maximum values for the slider.
        midpointSlider.minimumValue = -100
        midpointSlider.maximumValue = 100
        midpointSlider.currentValue = 70

        // STEP 4: Add a target and action to handle when user changes the slider value.
        midpointSlider.addTarget(self, action: "midpointSliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)

        // STEP 5: Add the MidpointSlider to your view.
        view.addSubview(midpointSlider)
    }

    // STEP 6: Declare your action method to handle when the slider value changes.
    func midpointSliderValueChanged(midpointSlider: MidpointSlider) {

        let sliderValue = midpointSlider.currentValue

        print("Value changed to : \(sliderValue))")
    }
}

````

##Usage (with Storyboards)

MidpointSlider can also be added to your project using Storyboards by performing the following steps:

__Step 1__. In Xcode, drag a UIView to your target scene in your Storyboard. In the __Size Inspector__, change the height of the view to __30__.  Change the width and position to any values that you'd like.  See screenshot below.

![screenshot](/imgs/xcode_screen1.png)

__Step 2__. In the __Identity Inspector__, declare the class as __MidpointSlider__ and press enter.  You will see the MidpointSlider control appear.  See screenshot below.

![screenshot](/imgs/xcode_screen2.png)

__Step 3__. In the __Attributes Inspector__, change the minimum slider value, maximum slider value, current value, and tint color of the MidpointSlider to values that make sense for your application.  See screenshot below.

![screenshot](/imgs/xcode_screen3.png)

__Step 4__. 'Control Button Drag' from the MidpointSlider on your scene to your associated ViewController class.  Choose the following options to create an action method:

* Connection = Action
* Name = handleValueChanged (or any other meaningful action method name)
* Type = MidpointSlider

Click on the __Connect__ button.  See screenshot below.

![screenshot](/imgs/xcode_screen4.png)

__Step 5__. Implement your action method.  

For example:

````
@IBAction func handleValueChanged(sender: MidpointSlider)  {

    let sliderValue = midpointSlider.currentValue

    print("Value changed to : \(sliderValue))")
}
````

See screenshot below.

![screenshot](/imgs/xcode_screen5.png)

## Author

Clint Cabanero

__Connect__:
* Twitter: [@clintcabanero](http://twitter.com/clintcabanero) 
* GitHub: [ccabanero](http:///github.com/ccabanero)

## License

MidpointSlider is available under the MIT license. See the LICENSE file for more info.

