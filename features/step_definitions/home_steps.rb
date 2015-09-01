Given(/^I am on Youview Setup page$/) do
  if $g_ios
    @homePage.navigate_to_setup
    @welcomePage.verify_welcome_page
    sleep 2
    @page.click_on_text "Next"
    @welcomePage.accept_terms_conditions
  else
    sleep 2
    if @welcomePage.verify_welcome_page
      sleep 2
      @page.click_on_text "Next"
      @welcomePage.accept_terms_conditions
    end
  end

end

Then(/^I enter wrong connection code$/) do
  code = ['4', 'Y', 'Z', 'V', '2', 'L','Q','K']
  @setupPage.enter_connection_code code
end

Then(/^I enter connection code$/) do
  code=HomePage.new.get_code
  @setupPage.enter_connection_code code
end

When(/^select Enter Connection Code text$/) do
  sleep 1
  @setupPage.select_enter_code
  @setupPage.wait_for_enter_connection_code_screen
end
When(/^select Next button on Enter connection code$/) do
  sleep(STEP_PAUSE)
  @setupPage.select_next
end

Then(/^I wait for Enter Connection Code to appear$/) do
@setupPage.wait_for_connection_code
end

And(/^I skip Enter Connection Code screen$/) do

  if ENV['PLATFORM']=="ios"
    sleep 1
    touch("view marked:'Skip'")
    sleep 1
    touch("view marked:'Continue'")
    sleep(STEP_PAUSE)
  elsif ENV['PLATFORM']=="android"
    sleep 1
    touch("* marked:'Skip'")
    sleep 1
    touch("* marked:'Continue'")
    sleep(STEP_PAUSE)
  end
end

