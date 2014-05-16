class TrackOrderPage
  include PageObject

  text_field(:order_no, :id => 'orderNumber')
  text_field(:order_email, :id => 'emailAddress')

  button(:track_order, :value => 'Track Order')

  div(:order_details, :xpath => "//div[@class='orderTrackStyle']")

  def track_order_no order_no, order_email
   sleep 3
    self.order_no = order_no
    self.order_email = order_email
    track_order
    sleep 2
  end

  def check_order
    order_details?
  end
end