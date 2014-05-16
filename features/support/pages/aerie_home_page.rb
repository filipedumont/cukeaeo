class AerieHomePage
  include PageObject

  page_url "#{Capybara.app_host}/aerie"
  
  div(:welcome_msg_logged_in, :class => 'tl_loginName')

  def check_page_user
    welcome_msg_logged_in.include?("Hello,")
  end
end