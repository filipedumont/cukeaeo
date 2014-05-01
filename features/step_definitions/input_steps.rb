Then(/^I input "(.*?)" on the field "(.*?)"$/) do |input_text, field_name|
  fill_in field_name, :with => input_text
end

Then(/^The "(.*?)" text should appear$/) do |text|
  page.should have_content text
end

And(/^The "(.*?)" text should not be visible$/) do |text|
  page.should_not have_content text
end

