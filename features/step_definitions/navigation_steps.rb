Given(/^I open the AE website$/) do
  visit_page HomePage
  on_page(HomePage).check_international_splash
end

And(/^I open the PDP for "(.*?)"$/) do |pdp_type|
  products = {
      :men_shirt => '1177_7702_196',
      :men_jeans => '0113_2937_461',
      :men_cologne => '0803_2110_966'
  }


  visit "/browse/product.jsp?productId=#{products[pdp_type.to_sym]}"

  begin
    page.should_not have_content('Our Apologies')
  rescue
    raise "The PDP Item you are trying to open is no longer available"
  end

end

And(/^I click on "(.*?)" input field$/) do |value_tag|
  click_and_scroll('xpath', "//input[@value='#{value_tag}']")
  page.has_xpath? "//input[@value='#{value_tag}']"
end
And(/^I click on "(.*?)" link$/) do |text|
  click_and_scroll('link', text)
end

Then(/^I login with "(.*?)" "(.*?)"$/) do |login, password|
on_page(HomePage).login_with login, password
end

Then /^I logout from desktop$/ do
  find(:xpath, '//span[@class=\'tl_welcome_message\']').click
  click_link 'Sign Out'
end

When /^I wait until the processing icon disappears$/ do
  page.has_no_xpath "//img[@id='ajaxIconOverlay']"
end

When /^I open the Account Settings$/ do
  find(:xpath, "//span[text()='Account Settings']").click
end

Then(/^I click on the "(.*?)" edit button$/) do |section|
  find(:xpath, "//a[@title='Edit #{section}']").click
end

And(/^I change the shipping country to "(.*?)"$/) do |country|
  click_link 'tl_international_link'
  click_link 'intl_shipping_opt'
  select_from_drop_down('intlCountry', country)
  find(:id, 'international_splash_submit').click
  if find(:id, 'international_splash_submit').visible?
    find(:id, 'international_splash_submit').click
  end
end

Then(/^I should be on "(.*?)" page$/) do |current_page|
  _page = Kernel::const_get(current_page)
  on_page(_page).check_page
end

When(/^I facebook login with "(.*?)" "(.*?)"$/) do |login, password|
  on_page(HomePage).facebook_login_with login, password
end

And(/^I fill the "(.*?)" field with "(.*?)"$/) do |field, value|
  on_page(CreateAccountPage).fill_element field, value
end


And (/^I create a basic account$/) do
  steps %{
    And I fill the "first_name" field with "Filipe"
    And I fill the "last_name" field with "Doe"
    And I fill the "email" field with "filipe@ae.com"
    And I fill the "email_confirmation" field with "filipe@ae.com"
    And I fill the "password" field with "test123"
    And I fill the "password_confirmation" field with "test123"
    And I fill the "birthday_month" field with "May"
    And I fill the "birthday_day" field with "07"
    And I fill the "birthday_year" field with "1987"
  }
  on_page(CreateAccountPage).create_account
end

