Given(/^I land on Login screen$/) do
 2.times {
  set_location(latitude: 51.50722, longitude: -0.12750) }

  k=set_location place:'Tower of London'
  if
    k !=true
  # set_location place:'London' ==true
    fail 'Location not set to London'
  sleep 2
@loginPage.verify_logIn_page "Log in with your Unibet account"
  sleep 1
  else
 puts 'Location set success'
  end

end

And(/^I enter an invalid login credentials$/) do
  user = CREDENTIALS[:invalid_user]
  @loginPage.login(user[:username], user[:password],)
  sleep 1

end

And(/^I click log in button$/) do
  touch "button marked:'Log in'"
  sleep 1
end

Then(/^invalid username and password message should be visible$/) do
  sleep 1
  if element_exists "*  marked:'Invalid username or password.'"
    puts 'Invalid username and password entered'
  else
    fail 'Invalid username & password message should be displayed'
  end
  sleep 1
end

And(/^I enter a username without password$/) do
  user = CREDENTIALS[:no_password]
  @loginPage.login(user[:username], user[:password],)
  sleep 1
end

Then(/^the Log in button should be disabled$/) do
  state = query("button marked:'Log in'", :isEnabled)[0]
  state = state.to_i
  if state!=1
    puts 'Log in button is disabled'
  elsif
    state==1
    fail 'Log in button should not be enabled'
    screenshot_and_raise 'Log in button should not be enabled'
  end

end

And(/^I enter an valid login credentials$/) do
  user = CREDENTIALS[:valid_user]
@loginPage.login(user[:username], user[:password],)
end

Then(/^Log in should be successful$/) do
  if
  element_exists "CircleIndicator"
    puts 'Circle indicator is visible'
  end

end

Given(/^i forgot my password$/) do
  sleep 1
  check_element_exists "* marked:'Forgot?'"

end

And(/^I click the Forgot button$/) do
  sleep 1
  touch "* marked:'Forgot?'"
end

Then(/^I navigate to Get new password page$/) do
  sleep 1
  check_element_exists "* marked:'Get a new password'"
end

When(/^I click back button$/) do
  sleep 1
  touch "button index:0"
end

Then(/^I should navigate back to log in page$/) do
  sleep 1
  if
  element_exists "* marked:'Register'"
    puts 'Landed back on log in screen'
  else
    fail 'Not on Landing Page'
  end

end

Given(/^I am a new user$/) do
  check_element_exists "* marked:'Register'"
end

And(/^I click on Register button$/) do
  touch "* marked:'Register'", :timeout => 5
end

Then(/^I should land on Registration Screen$/) do
  check_element_exists "* marked:'Registration'"
end

When(/^I click the close button$/) do
  touch "button marked:'image close white'"
end

Then(/^I should go back to Log in Screen$/) do
  sleep 2
  @loginPage.verify_logIn_page "Log in with your Unibet account"
  sleep 1
end

Given(/^I set location to london$/) do
  set_location(latitude: 51.50722, longitude: -0.12750)
  set_location(place:'Tower of London')
end