
# react-native-svg-image

## Getting started

`$ npm install react-native-svg-image --save`

### Mostly automatic installation

`$ react-native link react-native-svg-image`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-svg-image` and add `RNSvgImage.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNSvgImage.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.rctsvg.RNSvgImagePackage;` to the imports at the top of the file
  - Add `new RNSvgImagePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-svg-image'
  	project(':react-native-svg-image').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-svg-image/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-svg-image')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNSvgImage.sln` in `node_modules/react-native-svg-image/windows/RNSvgImage.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Svg.Image.RNSvgImage;` to the usings at the top of the file
  - Add `new RNSvgImagePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNSvgImage from 'react-native-svg-image';

// TODO: What to do with the module?
RNSvgImage;
```
  