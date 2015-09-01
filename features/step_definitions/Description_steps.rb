
Then(/^I see the scroll till "([^"]*)"$/) do |arg|
  DescriptionPage.new.scroll_table(arg)
end