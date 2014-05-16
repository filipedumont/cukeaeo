class PDPPage
  include PageObject

  text_field(:user_email, :name => 'email')
  text_field(:user_password, :name => 'aeAccountPass')
  button(:sign_in_user, :value => 'Sign In')

  span(:quantity_added, :class => 'count')

  button(:add_to_bag, :name => 'addToBagBttn')

  div(:bag_bar, :class => 'headerBar')

  button(:guest_checkout, :class => 'guestCheckoutBtn')

  link(:find_store, :xpath => "//span[@class='tl_linkWrap tl_findStore']/a")

  def open_pdp_with sku
    Capybara.current_session.visit "web/browse/product.jsp?productId=#{sku}"
  end


  def login_with user_email, user_password
    sleep 1
    self.user_email = user_email
    self.user_password = user_password
    sign_in_user
  end

  def verify_product
    quantity_added.to_f > 0
  end

  def bag_bar_checkout
    bag_bar_element.click
    _checkout_bag_bar
  end

  def write_review
    Capybara.current_session.execute_script("$(\"a.strong_bttn:contains('Write a Review')\")[0].click();")
  end

  private
  def _checkout_bag_bar
    Capybara.current_session.execute_script("$(\"a.checkoutLink\")[0].click();")
  end

end