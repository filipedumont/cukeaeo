class StoreLocatorPage
  include PageObject

  text_field(:store_field, :id => 'address')
  button(:find_store, :id => 'find_store')

  element(:international_stores_link, :xpath => "//div[@class='locator_left']/p/a")

  div(:locator_results, :id => 'locator_text')
  div(:error_locator_results, :class => 'toolTip errorTT')

  def search_near_stores code
    self.store_field = code
    find_store
    sleep 2
  end

  def check_stores_result
    !locator_results.include?("Uh oh! We don't have any AEO, Aerie or Factory stores where you live (yet, anyway).")
  end

end