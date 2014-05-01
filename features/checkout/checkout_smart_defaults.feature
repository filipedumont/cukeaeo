#PTC-939
 @april_release
  Feature: Checkout should have smart defaults
    As a shopper I should have Visa credit card pre-selected as well the current month and year on the expiration date as well

  Scenario: Visa credit card and current month/year is selected on the credit card payment type
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    And I fill out the checkout form with "US" address
    When I click on "▸ Enter Payment Info" input field
    Then the credit card type should be "Visa"
    And the expiration date should be the current month/year