class CheckoutPage
  include PageObject

  div(:cart_item, :class => 'cartcontent')
  text_field(:first_name, :id => 'firstNameShipAddField')
  text_field(:last_name, :id => 'lastNameShipAddField')
  text_field(:address_1, :id => 'address1ShipAddField')
  text_field(:address_2, :id => 'address2ShipAddField')
  text_field(:city, :id => 'cityShipAddField')
  text_field(:zip_code, :id => 'zipShipAddField')

  label(:standard_shipping, :id => 'chkOutStandardShipLabel')
  span(:primary_address, :class => 'primaryAddIndicator')

  button(:payment_info_btn, :id => 'shippingFormSubmit')

  text_field(:cc_nbr_field, :id => 'ccNumberCCField')
  text_field(:cc_security_code, :id => 'ccSecCodeCCField')

  text_field(:email_info, :id => 'emailBillAddField')
  text_field(:confirm_email_info, :id => 'confirmEmailBillAddField')
  text_field(:phone_info, :id => 'billingPhoneBillAddField')

  button(:review_order, :id => 'billingFormSubmit')
  button(:submit_order, :id => 'placeOrderFormSubmit')

  def check_product
    cart_item_element.exists?
  end

  def fill_basic_guest_form
    select_country 'United States'
    self.first_name = 'filipe'
    self.last_name = 'doe'
    self.address_1 = 'test address'
    self.city = 'Pittsburgh'
    select_state 'Pennsylvania'
    self.zip_code = '15203'
    standard_shipping_element.click
    payment_info_btn

    sleep 2

    fill_cc_info

    sleep 2

    review_order

    sleep 2

    submit_order

  end

  def fill_basic_signed_form
    primary_address_element.click
    standard_shipping_element.click
    payment_info_btn
    sleep 2
    review_order
    sleep 2
    submit_order
  end


  private
  #workaround for using pseudoSelectors
  def select_country(option)
    Capybara.current_session.execute_script(
        "var list = $(\".selectList\");
      $(list).find(\"li:contains('#{option}')\").mousedown();"
    );
  end
  def select_state(option)
    Capybara.current_session.execute_script(
        "var list = $(\".selectList:contains('-Select-')\");
      $(list).find(\"li:contains('#{option}')\").mousedown();"
    );
  end
  def fill_cc_info
    self.cc_nbr_field = '4111111111111111'
    self.cc_security_code = '123'
    self.email_info = 'v-francf-ave@ae.com'
    self.confirm_email_info = self.email_info
    self.phone_info = '4123724025'
  end
end