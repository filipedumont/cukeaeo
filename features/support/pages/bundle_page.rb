class BundlePage
  include PageObject

  div(:bundle_page, :id => 'faceSection')

  div(:color_box, :class => 'swatches')
  div(:size_box, :class => 'sizeSelections')

  button(:qv_add_to_bag, :name =>'addToBagBttn')

  def check_page
    bundle_page_element.exists?
  end

  def invoke_qv product
    open_qv product
    sleep 2
  end

  private
  def open_qv product
    Capybara.current_session.execute_script("$(\"a[href*='#{product}']\").find(\".js_qvLink\")[0].click();")
    sleep 2
    if color_box_element.exists?
      Capybara.current_session.execute_script("$(\"img.swatch\")[0].click();")
    end
    sleep 2
    if size_box_element.exists?
      Capybara.current_session.execute_script("$(\"a.sizeBttn\")[0].click();")
    end
  end
end