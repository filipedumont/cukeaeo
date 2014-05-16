class FavoritesPage
  include PageObject

  link(:sign_in, :xpath => "//div[@class='util_controls']/a")
  text_field(:user_email, :name => 'email')
  text_field(:user_password, :name => 'aeAccountPass')
  button(:sign_in_user, :value => 'Sign In')

  div(:welcome_msg_logged_in, :class => 'tl_loginName')

  def check_page_user
    current_url.include?("favorites")
    welcome_msg_logged_in.include?("Hello,")
  end

  def login_with user_email, user_password
    sign_in
    sleep 1
    self.user_email = user_email
    self.user_password = user_password
    sign_in_user
  end
end