# MidpointSlider

[![Version](https://img.shields.io/cocoapods/v/MidpointSlider.svg?style=flat)](http://cocoapods.org/pods/MidpointSlider)
[![License](https://img.shields.io/cocoapods/l/MidpointSlider.svg?style=flat)](http://cocoapods.org/pods/MidpointSlider)
[![Platform](https://img.shields.io/cocoapods/p/MidpointSlider.svg?style=flat)](http://cocoapods.org/pods/MidpointSlider)
![Swift 2.0](https://img.shields.io/badge/swift-2.0-orange.svg)

MidpointSlider is a custom iOS control that allows the user to pull left or right from the slider's center when choosing a value.

![screenshot](/imgs/MidpointSlider.gif)

## Requirements

* Xcode 7.x
* Swift 2.x
* iOS Deployment Target (earliest supported version) is 8.3

## Installation

####Cocoa Pods

MidpointSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod "MidpointSlider"
```

For example, the Podfile in your project directonary may look like the following:

````
platform :ios, '8.3'
use_frameworks!

target 'YourProjectName' do
    pod 'MidpointSlider'
end
````

####Manual Installation

Alternatively, you can manually copy the following files directly into your Xcode project:

![screenshot](/imgs/MidpointSlider_manualInstall.png)

## Usage (Programmatically)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Alternatively, see the code sample below:

````
// STEP 1: Import the MidpointSlider.
import MidpointSlider

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // STEP 2: Instantiate a new MidPointSlider.
        let midpointSlider = MidpointSlider(frame: CGRect(x: 40, y: 300, width: 300, height: 30))

        // STEP 3: Set the minimum and maximum values for the slider and the starting value.
        midpointSlider.minimumValue = -100
        midpointSlider.maximumValue = 100
        midpointSlider.currentValue = 70

        // Optional: Set the color of the MidpointSlider to match the look and feel of your app.
        midpointSlider.trackTintColor = UIColor.orangeColor()

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

__Step 5__. Add an Import statement for the library and Implement your action method.  

For example:

````
import MidpointSlider

...

@IBAction func handleValueChanged(sender: MidpointSlider)  {

    let sliderValue = midpointSlider.currentValue

    print("Value changed to : \(sliderValue))")
}
````

## Author

Clint Cabanero
* Twitter: [@clintcabanero](http://twitter.com/clintcabanero) 
* GitHub: [ccabanero](http:///github.com/ccabanero)

## License

MidpointSlider is available under the MIT license. See the LICENSE file for more info.

