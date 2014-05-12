class HomePage
  include PageObject

  page_url "#{Capybara.app_host}"

  button(:international_splash_submit, :id => 'international_splash_submit')
  button(:close_modal, :class => 'close_text')

  link(:sign_in, text: 'Sign In')
  link(:create_account, text: 'Create Account')
  text_field(:user_email, :name => 'email')
  text_field(:user_password, :name => 'aeAccountPass')
  button(:sign_in_user, :value => 'Sign In')

  div(:facebook_sign_in, :class => 'fb_login_bttn')
  button(:facebook_login, :value => 'Log In')

  div(:welcome_msg_logged_in, :class => 'tl_loginName')

  def check_page
    title.include?("American Eagle Outfitters")
  end


  def check_international_splash
    if international_splash_submit_element.exists?
      international_splash_submit
    elsif close_modal_element.exists?
      close_modal
    end
  rescue => error
    unless error.message.include? 'Unable to find'
      p error
    end
  end

  def login_with user_email, user_password
    sign_in
    self.user_email = user_email
    self.user_password = user_password
    sign_in_user
  end

  def facebook_login_with user_email, user_password
    sign_in
    facebook_sign_in_element.click

    popup = Capybara.current_session.driver.browser.window_handles.last
    Capybara.current_session.driver.browser.switch_to.window(popup)
    
    Capybara.current_session.within_window popup do 
      Capybara.current_session.fill_in('email', :with => user_email)
      Capybara.current_session.fill_in('pass', :with =>user_password)
      Capybara.current_session.click_on('Log In')
    end
  end

end

