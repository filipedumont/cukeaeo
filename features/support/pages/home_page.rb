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

  link(:track_order, :xpath => "//span[@class='tl_linkWrap tl_trackOrder']/a")

  link(:intl_modal, :id => 'tl_international_link')

  link(:intl_modal_shipping, :id => 'intl_shipping_opt')
  span(:intl_modal_shipping_value, :xpath => "//a[@id='intl_shipping_opt']/span[@class='opt_callout']")
  link(:intl_modal_currency, :id => 'intl_currency_opt')
  span(:intl_modal_currency_value, :xpath => "//a[@id='intl_currency_opt']/span[@class='opt_callout']")
  link(:intl_modal_lang, :id => 'intl_lang_opt')
  span(:intl_modal_lang_value, :xpath => "//a[@id='intl_lang_opt']/span[@class='opt_callout']")

  button(:intl_submit_btn, :id => 'international_splash_submit')

  def check_page
    title.include?("American Eagle Outfitters")
  end

  def check_page_user
    welcome_msg_logged_in.include?("Hello,")
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
      Capybara.current_session.fill_in('pass', :with => user_password)
      Capybara.current_session.click_on('Log In')
    end
    sleep 1
  end

  def navigate_to_section section
    Capybara.current_session.find(:xpath, "//a/span[@class='catLabel' and text()='#{section}']").click
  end

  def select_nav_category category
    Capybara.current_session.find(:xpath, "//a/span[@class='catLabel' and text()='#{section}']").click
  end

  def change_intl_settings option, value
    intl_modal
    sleep 2
    case option
      when 'Shipping'
        intl_modal_shipping
      when 'Currency'
        intl_modal_currency
      when 'Language'
        intl_modal_lang
    end
    sleep 2
    select_ value
    intl_submit_btn
  end

  def check_intl_settings_update option, value
    sleep 2
    case option
      when 'Shipping'
        intl_modal_shipping_value.include?(value)
      when 'Currency'
        intl_modal_currency_value.include?(value)
      when 'Language'
        intl_modal_lang_value.include?(value)
    end
  end

  private
  def select_ option
    Capybara.current_session.execute_script("$(\".selectList\").find(\"li:contains('#{option}')\").mousedown();")
  end
end

