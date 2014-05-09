# encoding : ASCII-8BIT

require 'Capybara'
require 'Capybara/cucumber'
require 'rspec'
require 'capybara/poltergeist'
require 'socket'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'page-object'

#Setting default values if no profile is selected
ENV['ENV'] = 'local' unless ENV['ENV']
ENV['BROWSER'] = 'chrome' unless ENV['BROWSER']
ENV['DRIVER'] = 'selenium' unless ENV['DRIVER']

#Setting application web address
if ENV['ENV'].downcase.eql? 'local'
  Capybara.app_host = "http://#{Socket.gethostname}/web"
elsif ENV['ENV'].downcase.eql? 'dev'
  Capybara.app_host = 'http://test.aezone.com/web'
elsif ENV['ENV'].downcase.eql? 'zone'
  Capybara.app_host = 'http://www.aezone.com/web'
end

#Building driver from ENV variables
Capybara.default_driver = "#{ENV['DRIVER']}_#{ENV['BROWSER']}".to_sym

Capybara.register_driver :poltergeist_headless do |app|
  options = {
      :js_errors => true,
      :timeout => 120,
      :debug => false,
      :phantomjs_options => ['--load-images=yes', '--disk-cache=false'],
      :inspector => true,
      :window_size => [1280, 720]
  }
  Capybara::Poltergeist::Driver.new(app, options )
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, :browser => :safari)
end

Capybara.register_driver :selenium_ie do |app|
  Capybara::Selenium::Driver.new(app, :browser => :ie)
end

Capybara.run_server = true

#loading RSpec matchers and expectations
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end

World(RSpec::Matchers)
World(PageObject::PageFactory)