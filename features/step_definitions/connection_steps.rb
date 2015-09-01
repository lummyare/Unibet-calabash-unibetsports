Then(/^I wait for connection to fail$/) do
  sleep 10
  step 'I wait for "Connection failed" to appear'
end

Then(/^I wait for successful connection$/) do
  sleep 10
  step 'I wait for "Successfully connected" to appear'
end