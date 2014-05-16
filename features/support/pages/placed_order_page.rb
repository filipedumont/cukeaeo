class PlacedOrderPage
  include PageObject

  div(:placed_order, :id => 'ty_orderinfo_with_banner' )

  def check_page
    placed_order?
  end
end