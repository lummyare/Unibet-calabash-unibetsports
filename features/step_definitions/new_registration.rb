When(/^I click on continue button$/) do
  sleep 2
  touch "button marked:'Continue'"
  sleep 1
end

Then(/^I should navigate the registration form$/) do
  sleep 3
  check_element_exists "label marked:'Registration'"
  sleep 1
end

When(/^I scroll to bottom page and click continue without filling the form$/) do
  wait_for(:timeout => 30) do

    scroll("webView",:down)
    sleep 1
    scroll("webView",:down)
    sleep 1
    scroll("webView",:down)
    sleep 1
    element_exists "webView css:'.submit-button' {textContent CONTAINS 'Continue'}"
    sleep 1

    # wait_poll(:until_exists => "webView css:'.submit-button'",:timeout => 20) do
    #   scroll("webView",:down)
    # sleep 2
    touch "webView css:'.submit-button'"
    sleep 2
  end
end

Then(/^Error messages should be populated on the empty text fields$/) do
  sleep 1
  check_element_exists("webView css:'div'{textContent CONTAINS 'Your e-mail is not valid'}")
  sleep 2
end