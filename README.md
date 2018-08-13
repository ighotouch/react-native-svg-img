
# react-native-svg-img

## Getting started

`$ npm install react-native-svg-img --save`

Add `<uses-permission android:name="android.permission.INTERNET" />` to Manifest file on android

### Mostly automatic installation

`$ react-native link react-native-svg-img`

#### IOS

1. In Xcode, Go to `Build Phases` add `libxml2.tbd` in `Link binary with libraries`
2. In Xcode, add `$(SRCROOT)/usr/include/libxml2` In Header Search Paths (Under search paths column in Build Settings)

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-svg-img` and add `RNSvgImage.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNSvgImage.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.rctsvg.RNSvgImagePackage;` to the imports at the top of the file
  - Add `new RNSvgImagePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-svg-img'
  	project(':react-native-svg-img').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-svg-img/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-svg-img')
  	```

## Usage
```javascript
import SvgImageView from 'react-native-svg-img';

// TODO: What to do with the module?
SvgImageView;

<SvgImageView
	width={200}
	height={200}
	source={require('./imagePath.svg')}
/>
```

  
