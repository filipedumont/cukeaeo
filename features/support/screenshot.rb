require 'fileutils'

After do |scenario|
  @path = Time.now.strftime('%Y_%m_%d')
  Dir.mkdir("html-report/#{@path}") unless File.exists?("html-report/#{@path}")
  if scenario.failed?
    time = Time.now.strftime('%H%M%S')
    page.driver.browser.save_screenshot("html-report/#{@path}/#{time}_#{scenario.__id__}.png")
    embed("#{@path}/#{time}_#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end
  #clearing cookies after each scenario
  browser = Capybara.current_session.driver.browser
  if browser.respond_to?(:clear_cookies)
    # Rack::MockSession
    browser.clear_cookies
  elsif browser.respond_to?(:manage) and browser.manage.respond_to?(:delete_all_cookies)
    # Selenium::WebDriver
    browser.manage.delete_all_cookies
  else
    raise "Don't know how to clear cookies. Weird driver?"
  end

end

at_exit do
  #moving report to correct folder
  FileUtils.mv 'html-report/report.html', "html-report/#{Time.now.strftime('%Y_%m_%d')}/#{Time.now.strftime('%H_%M_%S')}_report.html"
end


# Other variants:
#
# Only take screenshot on failures
#
#   After do |scenario|
#     embed_screenshot("screenshot-#{Time.new.to_i}") if scenario.failed?
#   end
#
# Only take screenshot for scenarios or features tagged @screenshot
#
#   After(@screenshot) do
#     embed_screenshot("screenshot-#{Time.new.to_i}")
#   end
