class CreateAccountPage
  include PageObject

  text_field(:first_name, :name => 'firstName')
  text_field(:last_name, :name => 'lastName')
  text_field(:email, :id => 'createAccount_email')
  text_field(:email_confirmation, :id => 'createAccount_confirmEmail')
  text_field(:password, :id => 'createAccount_pass1')
  text_field(:password_confirmation, :id => 'createAccount_confirmPassword')

  # text_field(:birthday_month, :id => 'createAccount_birthMonth')
  # text_field(:birthday_day, :id => 'createAccount_birthDay')
  # text_field(:birthday_year, :id => 'createAccount_birthYear')
  button(:create_account, :name => 'create')


  def fill_element field, value
    if field.to_sym == :first_name
      self.first_name = value
    elsif field.to_sym == :last_name
      self.last_name = value
    elsif field.to_sym == :email
      self.email = value
    elsif field.to_sym == :email_confirmation
      self.email_confirmation = value
    elsif field.to_sym == :password
      self.password = value
    elsif field.to_sym == :password_confirmation
      self.password_confirmation = value
    elsif field.to_sym == :birthday_month
      select_ 'Month', value
    elsif field.to_sym == :birthday_day
      select_ 'Day', value
    elsif field.to_sym == :birthday_year
      select_ 'Year', value
    end
  end

  private
  #workaround for using pseudoSelectors
  def select_(locator, option)
    Capybara.current_session.execute_script(
      "var list = $(\".selectList:contains('#{locator}')\");
      $(list).find(\"li:contains('#{option}')\").mousedown();"
    );
  end
end