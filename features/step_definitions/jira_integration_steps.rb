

Then /^I should see "(.*?)"$/ do |text|
  sleep 1
 page.should have_content(%r{#{text}}i)
end

Then /^I should not see "(.*?)"$/ do |text|
  sleep 1
  page.should have_no_content(%r{#{text}}i)
end