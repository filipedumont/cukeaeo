class MyAccount
  include PageObject

  def check_page
    title.include?("My Account")
  end
end