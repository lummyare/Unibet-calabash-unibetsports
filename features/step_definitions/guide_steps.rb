Then(/^I should see the Guide screen$/) do
  if ENV['PLATFORM']=="ios"
    sleep 1
    element_exists("view marked:'TV guide'")
    sleep(STEP_PAUSE)
  elsif ENV['PLATFORM']=="android"
    sleep 1
    element_exists("* marked:'epg_grid'")
    touch "* marked:'Guide'"
    sleep(STEP_PAUSE)
    end
end

When(/^I select a channel$/) do
  if ENV['PLATFORM']=="ios"
    sleep 1
    touch "YVEPGServiceItem index:0"
    sleep 3
    touch  "UITableViewCellContentView index:0"
    sleep(STEP_PAUSE)
  elsif ENV['PLATFORM']=="android"
    sleep 1
    touch "com.youview.widget.YVTextViewFSMERegFont:5"
    sleep(STEP_PAUSE)
  end

end

Then(/^I wait for the selected channel to show$/) do
  if ENV['PLATFORM']=="ios"
    sleep 1
    element_exists("view text:'OTHER EPISODES ON TV'")
    sleep(STEP_PAUSE)
  elsif ENV['PLATFORM']=="android"
    sleep 1
    element_exists("* marked:'imageView1'")
    sleep(STEP_PAUSE)
  end

end