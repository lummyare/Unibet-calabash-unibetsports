#!/bin/sh

APK_PATH=../android5/YouView-debug-6.0.3.73.apk
rm -rf test_servers/
adb uninstall com.youview
adb uninstall com.youview.test
calabash-android resign $APK_PATH
calabash-android build $APK_PATH
adb install $APK_PATH
adb install test_servers/*.apk
bundle exec calabash-android run $APK_PATH -p android --tag $2
