#!/bin/sh

echo "Choose scheme name and update it in SCHEME_XC"
echo "click manage scheme and choose scheme name and find the build configuration BUILD_CONFIG" 
echo "if your features(automation test features) are present in different folder rather than folder where project is present , mention the path in FEATURES_PATH
or else remove the argument."
echo "APPNAME - name of the application usually same as the scheme name"
echo "PROJ_LOC - location of xcode project if thats same as current folder remove this option."
ruby gistfile1.rb
set_location latitude: 51.50722, longitude: -0.12750


SCHEME_XC="UnibetSports-cal"
BUILD_CONFIG="Debug"
FEATURES_PATH="features"
ARCHITECTURE_SELECTED="i386 x86_64"
APPNAME="UnibetSports-cal"
PROJ_LOC="/Users/seunare/ios-apps/UnibetApps.xcworkspace"

if [ $1 = "clean" ]
then
xcodebuild  -workspace "${PROJ_LOC}" -scheme "${SCHEME_XC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator clean build
fi

if [ $1 = "build" ]
then
xcodebuild   -workspace "${PROJ_LOC}" -scheme "${SCHEME_XC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
fi

BUILT_PRODUCTS_DIR=$(xcodebuild -scheme "${SCHEME_XC}" -workspace "${PROJ_LOC}" ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)

APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app

set_location latitude: 51.50722, longitude: -0.12750

echo DEVICE_TARGET='iPad Air (8.4 Simulator)' APP_BUNDLE_PATH=$APP_BUNDLE_PATH_VAR bundle exec cucumber -p ios --tag $2
DEVICE_TARGET='iPad Air (8.4 Simulator)' APP_BUNDLE_PATH=$APP_BUNDLE_PATH_VAR  bundle exec cucumber -p ios --tag $2
