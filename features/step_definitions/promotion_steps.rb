Then /^I go over the threshold "(.*?)"$/ do |amount|
  click 'modalCloseLink'
  bag_total = 0
  while bag_total < amount.delete('$').to_f
    bag_total = find(:xpath, '//span[@class=\'bagOrderTotal\']').text.delete('$ ').to_f
    steps %{
            And I open the PDP for 'men_shirt'
            When I select size 'S'
            And I click on ''+ Add to Bag' input field
           }
  end

end