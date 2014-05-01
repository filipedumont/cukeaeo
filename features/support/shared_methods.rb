def select_from_drop_down(locator, option)
  sleep 1
  page.find(:id, locator).click
  begin
    page.first(:xpath, '//ul/li', :text => option, :visible => false).click
  rescue => error
    if error.message.include? 'not visible'
      page.first(:xpath, '//li', :text => option).click
    else
      raise error
    end
  end
end

def click_and_scroll(locator, path)
  error = 'test'
  i = 0
  #Iterating until you can click on a element. This problem came to light because chromedriver is not
  #auto-scrolling to show the full element.
  until error.nil?
    begin
      sleep 2
      first(locator.to_sym, path).click
      error = nil
    rescue => error
      #Checks for error message to include the expected message otherwise raises the error again
      #to move out of the throw-catch binds
      if error.message.include? 'Element is not clickable at point'
        x_axis = error.message.match(/( [0-9]{2,4})/).to_s.to_i - 100
        if i > 0
          x_axis = x_axis * (i+1)
        end
        page.execute_script("window.scrollTo(0,#{x_axis})")
        i+=1
      else
        raise error
      end
    end
  end
end