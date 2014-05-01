Then /^I make my cart go over "(.*?)"$/  do |price|
  steps %{
  And I open the PDP for "men_jeans"
  And I select size "32, 32"
}
  bag_total = 0.0
  price_f = price.delete('$').strip.to_f

  while bag_total < price_f
    begin
      step "I click on \"+ Add to Bag\" input field"
      sleep 1
      bag_total = find('span.bagOrderTotal').text.delete('$').strip.to_f
    rescue => error
      if error.message.include? 'not clickable'
        break
      else
        raise error
      end
    end
  end

end