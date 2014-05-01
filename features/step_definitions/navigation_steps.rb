Given(/^I open the AE website$/) do
  visit '/'
  page.should have_content 'AEO'
  begin
    if page.has_xpath?('//input[@id=\'international_splash_submit\']')
      find_by_id('international_splash_submit').click
    elsif page.has_xpath?('//span[@class=\'close_text\']')
      find(:xpath, "//span[@class='close_text']").click
    end
  rescue => error
    unless error.message.include? 'Unable to find'
      p error
    end
  end
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
  steps %{
  Then I input "#{login}" on the field "email"
  And I input "#{password}" on the field "aeAccountPass"
  When I click on "Sign In" input field
}
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