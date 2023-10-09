
## 🏃Steps 

This app is open source and ready for you to contribute! Built fully with SwiftUI and open to contributers of any experience level (beginners welcome🙂)!

# Getting Started
* Read the [Code of Conduct](https://github.com/brittanyarima/Steps/blob/main/CODE_OF_CONDUCT.md)
* Read the [CONTRIBUTING.md](https://github.com/brittanyarima/Steps/blob/main/CONTRIBUTING.md) guidelines
* Download Xcode 15 or later, and macOS 14.0 or later
* Browse the open [issues](https://github.com/brittanyarima/Steps/issues) and **comment** which you would like to work on
* Fork this repo
* Clone the repo to your machine
* In the same folder that contains the `StepsConfigTemplate.xcconfig`, run this command, in Terminal, to create a new Xcode configuration file (which properly sets up the signing information)

```sh
cp StepsConfigTemplate.xcconfig StepsConfig.xcconfig
```

* In the StepsConfig.xcconfig file, fill in your `DEVELOPMENT_TEAM` & `BUNDLE_ID`
   * Example: `DEVELOPMENT_TEAM = IdNumber` & `BUNDLE_ID = com.name.steps`
   * You can find your Team ID by logging into the Apple Developer Portal
   * This is only needed when running on a real device for iOS, this works with both free or paid Apple Developer accounts.
   * 
    * You will need to do this AGAIN to set up the Widget extension 
   
```sh
cp StepsWidgetConfigTemplate.xcconfig StepsWidgetConfig.xcconfig
```
* ❗️Make sure you at .widget to this `PRODUCT_BUNDLE_IDENTIFIER` ie. com.name.steps.widget
* Build the project

* Checkout a new branch (from the `dev` branch) to work on an issue
Checkout any issue labeled `hacktoberfest` to start contributing.

* Start contributing!
* Submit PR to merge with `dev` branch
* If you've never contributed to open-source before there are a ton of great tutorials out there to help get you started
* Issues labeled `good-first-issue` are great for beginners.


<p align="center">
<img src="https://user-images.githubusercontent.com/76922883/209883943-03fc014d-778a-429d-8817-79d5a665ba0d.jpg" width="200"/>
<img src="https://user-images.githubusercontent.com/76922883/209884023-aca50258-92ee-4dcf-89db-5e69ee6d3076.jpg" width="200"/>
<img src="https://user-images.githubusercontent.com/76922883/209884047-f5b8bf5f-7ee5-43f1-bedc-6c7786197a13.jpg" width="200"/>
<img src="https://user-images.githubusercontent.com/76922883/209884076-f3ebcd7b-5dc2-49c2-9762-83e50c19e102.jpg" width="200"/>
<img src="https://user-images.githubusercontent.com/76922883/209884112-f3ad71cd-2fb7-4473-a1d3-8fbdb3c37a00.jpg" width="200"/>
<img src="https://user-images.githubusercontent.com/76922883/209884150-6c2d5d16-c84d-475a-a797-b0f5b2288a41.mp4" width="200"/>
</p>

**Tech Used**
- 🎨 SwiftUI
- ❤️‍🩹 HealthKit
- 📊 Swift Charts
- 🔔 Local Notifications
- 🗂️ MVVM
- 💾 App Storage

  
# Contributors  
<a href="https://github.com/brittanyarima/Steps/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=brittanyarima/Steps" />
</a>

Made with [contrib.rocks](https://contrib.rocks).


# License 
This project is licensed under [MIT License](https://github.com/brittanyarima/Steps/blob/main/LICENSE).
