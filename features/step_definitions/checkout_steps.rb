Then /^I add a gift wrap for item "(.*?)"$/ do |item_position|
  unless page.has_text? 'Gift Receipt'
    find(:xpath, "//span[@class='giftWrapLink']").click
  end
  check "GiftFlag#{item_position.to_i - 1}"
  fill_in "TO_FILED#{item_position.to_i - 1}", :with => 'Test To'
  fill_in "FROM_FILED#{item_position.to_i - 1}", :with => 'Test From'
  steps %{And I click on 'Save' input field}
end

And /^I fill out the checkout form with "(.*?)" address$/ do |country|

  if country.downcase.eql? 'us'
    fill_in "firstNameShipAddField", :with => 'Test'
    fill_in "lastNameShipAddField", :with => 'User'
    fill_in 'address1ShipAddField', :with => '77 Hot Metal Street'
    fill_in 'cityShipAddField', :with => 'Pittsburgh'
    select_from_drop_down('stateShipAddField', 'Pennsylvania')
    fill_in 'zipShipAddField', :with => '15203'
  elsif country.downcase.eql? 'po box'
    fill_in "firstNameShipAddField", :with => 'Test'
    fill_in "lastNameShipAddField", :with => 'User'
    fill_in 'address1ShipAddField', :with => 'PO Box 123'
    fill_in 'cityShipAddField', :with => 'Pittsburgh'
    select_from_drop_down('stateShipAddField', 'Pennsylvania')
    fill_in 'zipShipAddField', :with => '15203'
  end

end

Then /^the credit card type should be "(.*?)"$/ do |cc_type|
  page.should have_css('li.selected', :text => cc_type, :visible => false)
end

And /^the expiration date should be the current month\/year$/ do
  page.should have_css('li.selected', :text => Time.now.strftime('%m'), :visible => false)
  page.should have_css('li.selected', :text => Time.now.strftime('%Y'), :visible => false)
end

Then /^I use the credit card type: "(.*?)" number: "(.*?)" exp date: "(.*?)" CCV: "(.*?)"$/ do |cc_type, cc_number, cc_expire_date, ccv|
  select_from_drop_down('ccTypeCCField', cc_type)
  fill_in 'ccNumberCCField', :with => cc_number
  expire_date = cc_expire_date.split '/'
  select_from_drop_down('expMonthCCField', expire_date[0])
  select_from_drop_down('expYearCCField', expire_date[1])
  if page.has_xpath? "//input[@id='ccSecCodeCCField']"
    fill_in 'ccSecCodeCCField', :with => ccv
  end
end

And /^I fill the contact info with email: "(.*?)" phone number "(.*?)"$/ do |email, phone|
  fill_in 'emailBillAddField', :with => email
  fill_in 'confirmEmailBillAddField', :with => email
  fill_in 'billingPhoneBillAddField', :with => phone
end

And /^I authenticate on 3D Secure modal with "(.*?)" password$/ do |password|
  fill_in 'external.field.password', :with => password
  click_and_scroll('xpath', "//input[@name='UsernamePasswordEntry']")
end