require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
  initialize_all
  start_test_server_in_background
end

After do |scenario|
  if scenario.failed?
    screenshot_embed
  end
  shutdown_test_server
end
