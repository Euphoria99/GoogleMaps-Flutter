# Googlemapsflutter

# google_maps_flutter: ^2.1.3

Usage: <br />
To use this plugin, add google_maps_flutter as a dependency in your pubspec.yaml file.

*In android/app/build.gradle:* <br />
 Set the minSdkVersion , compileSdkVersion , targetSdkVersion .
(Note: some extra permission included along for geolocator)


*Specify your API key in the application manifest android/app/src/main/AndroidManifest.xml:*

```
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>

```
# geolocator: ^8.2.0

*Permissions (for geolocator)*

``` 
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

```


*For iOS*
```

<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location when open.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to location when in the background.</string><key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location when open.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to location when in the background.</string>

```
#

*For detailed Docs* 

[google_maps_flutter](https://pub.dev/packages/google_maps_flutter)

[geolocator](https://pub.dev/packages/geolocator)