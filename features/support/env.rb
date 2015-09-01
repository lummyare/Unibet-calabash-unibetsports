# encoding: utf-8

require_relative 'page_world'

STEP_PAUSE=0.5
puts "selecting #{ENV['PLATFORM']} platform"
if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
  require_relative '../../features/ios/base_page'
  $g_ios=true
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
  require_relative '../../features/android/base_page'
  $g_android=true
end

World(TestModule)
$g_query_str="*" if  ENV['PLATFORM']=="android"
$g_query_str="view" if  ENV['PLATFORM']=="ios"

BasePage.new.set_strings
