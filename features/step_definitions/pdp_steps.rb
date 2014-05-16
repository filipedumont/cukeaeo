When(/^I select size "(.*?)"$/) do |size|
  sleep 1
  msize = Array.new
  if size.include? ','
    msize = size.split(',')
  else
    msize << size
  end
  #Defining available sizes for a range of clothing types
  msize.each_with_index do |siz, i|
    if %{XS S M M-Tall L L-Tall XL XL-Tall XXL XXXL}.include? siz.strip.upcase
      sizes = ['XS', 'S', 'M','M-Tall', 'L','L-Tall', 'XL', 'XL-Tall', 'XXL', 'XXXL']
    elsif %{28 29 30 31 32 33 34 35 36 37 38 40 42 44 46 48}.include? siz.strip.upcase
      sizes = ['28', '29', '30', '31', '32', '33', '34', '35', '36', '37,' '38', '40', '42', '44', '46', '48']
    elsif %{A B AA C D DD}.include? siz.strip.upcase
      sizes = ['A', 'B', 'AA', 'C', 'D', 'DD']
    end
    #Checks if the size selected is available on store.
    #This prevents false negatives from happening
    current_size = siz.strip.upcase
    #Initializing error variable to avoid an exception
    error = 'test'
    #Iterating until you can click on a element. This problem came to light because chromedriver is not
    #auto-scrolling to show the full element.
    until error.nil?
      begin
        while find(:xpath, "//div[@id='size_#{i}']/a[@data-sizename='#{current_size}']")[:class].include? 'disabled'
          sizes.delete current_size
          current_size = sizes[0]
        end
        find(:xpath, "//div[@id='size_#{i}']/a[@data-sizename='#{current_size}']").click
        error = nil
      rescue => error
        #Checks for error message to include the expected message otherwise raises the error again
        #to move out of the throw-catch binds
        if error.message.include? 'Element is not clickable at point'
          x_axis = error.message.match(/( [0-9]{2,4})/).to_s.to_i - 200
          page.execute_script("window.scrollTo(0,#{x_axis})")
        else
          raise error
        end
      end

    end

  end
end

And(/^I search for a store with the "(.*?)" code$/) do | code |
  on_page(PDPPage).find_store
  on_page(StoreLocatorPage).search_near_stores code
end

Then(/^I should see a list of valid stores$/) do
  on_page(StoreLocatorPage).check_stores_result
end