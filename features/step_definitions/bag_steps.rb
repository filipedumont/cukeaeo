Then(/^I expand the Bag Bar$/) do
  unless find_by_id('bagBar')[:class].include? 'condensed'
    find(:xpath, '//span[@class=\'bagBarActions\']').click
  end
end

Then(/^I open My Bag$/) do
  page.execute_script('window.scrollTo(0,0)')
  click_link "My Bag : #{find(:xpath, '//span[@class=\'count\']').text}"
  sleep 0.2
  click_link "My Bag : #{find(:xpath, '//span[@class=\'count\']').text}"
end

When(/^I remove product "(.*?)" from the bag$/) do |arg1|
  pending
end

Then(/^The bag should have "(.*?)" item\(s\)$/) do |amount|
  sleep 1
  find(:xpath, '//span[@class=\'bagCount\']').text.should(eq amount)
end