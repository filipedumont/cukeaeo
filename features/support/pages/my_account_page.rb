class MyAccountPage
  include PageObject

  def check_page
    title.include?("My Account")
  end

  def check_page_user
    current_url.include?("account_home")
  end
end