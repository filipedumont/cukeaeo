require 'Capybara'
require 'Capybara/cucumber'
require 'selenium-webdriver'

Before do
  @browser = Capybara.current_session.driver.browser
end
