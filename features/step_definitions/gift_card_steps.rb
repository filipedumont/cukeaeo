Then(/^I fill the "(.*?)" Gift Card form$/) do |gift_type|
  select_from_drop_down('gc_amt', '$25')
  click_and_scroll("id", 'right_col')
  fill_in 'TO', :with => 'Test Recipient'
  fill_in 'FROM', :with => 'Test Sender'
  unless gift_type.downcase.eql? 'normal'
    fill_in 'EMAIL', :with => 'test@test.com'
    fill_in 'EMAIL_CONF', :with => 'test@test.com'
    if gift_type.downcase.eql? 'mobile'
      fill_in 'PHONE_NUMBER', :with => '1231234567'
    end
  end

  click_and_scroll('id', 'TCCHK')
end