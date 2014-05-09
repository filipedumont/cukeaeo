class HomePage
  include PageObject

  page_url "#{Capybara.app_host}"

  button(:international_splash_submit, :id => 'international_splash_submit')
  button(:close_modal, :class => 'close_text')

  link(:sign_in, text: 'Sign In')
  text_field(:user_email, :name => 'email')
  text_field(:user_password, :name => 'aeAccountPass')
  button(:sign_in_user, :value => 'Sign In')

  span(:facebook_sign_in, :class => 'fb_login_action_text')
  text_field(:facebook_user_email, :id => 'email')
  text_field(:facebook_user_password, :id => 'pass')
  button(:facebook_login, :value => 'Log In')


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
    attach_to_window Capybara.current_session.driver.browser
    facebook_sign_in_element.click
    facebook_user_email = user_email
    facebook_user_password = user_password
    facebook_login
  end
end
