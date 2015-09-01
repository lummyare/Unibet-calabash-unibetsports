calabash-ios-sample-test
========================
Git repository for running ios calabash tests

#### Versions of Xcode and IOS simulator used
source 'http://rubygems.org'
ruby '2.0.0'
gem 'calabash-android', '0.4.20'
gem 'calabash-cucumber', '0.9.169'

IOS

Xcode - Version 5.1.1 (5B1008)
Simulator - Version 7.1 (463.9.41) ( to launch xcode - Choose Xcode > Open Developer Tool > iOS Simulator.)
Ruby 2.0  - use rvm to install ruby

Check and update xcode versions and make sure ios simulator are using ios 7.1  - It can be done using Appstore

Launch simulator from terminal and check ios version is Simulator - Version 7.1 (463.9.41)
it can be launched from terminal using below command -
'open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'


Run below command from terminal

####Before running tests
	'bundle install'

check the version of calabash android and ios gems using 'gem list' command

IOS :

go to ios folder
enter the command 'calabash-ios setup'
make sure calabash setup is done

go to calabash-cross-platform

enter below command

	'sh run_ios.sh clean @test1' - with cleaning and building project

Android

enter below command for running tests:
  	'sh run_android.sh' - with cleaning and building project


