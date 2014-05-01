#PTC-912
@may_release
Feature: Implementing 3D secure to checkout
  As a customer, I would like to successfully pass through 3D secure process if I am prompted during checkout

  Scenario: Cardholder enrolled, successful authentication, successful signature verification.
    Given I open the AE website
    And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    And I fill out the checkout form with "US" address
    When I click on "▸ Enter Payment Info" input field
    Then I use the credit card type: "Visa" number: "4000000000000002" exp date: "01/2020" CCV: "402"
    And I fill the contact info with email: "test@test.com" phone number "1231234567"
    And I click on "▸ Review Order" input field
    When I click on "▸ Submit My Order" input field
    Then The "American Eagle wants to ensure your credit card is safe and secure." text should appear
    And I authenticate on 3D Secure modal with "1234" password
    Then The "Order Placed" text should appear

  Scenario: Cardholder enrolled, successful authentication, unsuccessful signature verification.
    Given I open the AE website
    And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    And I fill out the checkout form with "US" address
    When I click on "▸ Enter Payment Info" input field
    Then I use the credit card type: "Visa" number: "4000000000000010" exp date: "01/2020" CCV: "410"
    And I fill the contact info with email: "test@test.com" phone number "1231234567"
    And I click on "▸ Review Order" input field
    When I click on "▸ Submit My Order" input field
    Then The "American Eagle wants to ensure your credit card is safe and secure." text should appear
    And I authenticate on 3D Secure modal with "1234" password
    Then The "We are unable to process your order with entered Credit Card. Please select a different payment type to complete your order." text should appear

  Scenario: Cardholder enrolled, unsuccessful authentication, successful signature verification.
    Given I open the AE website
    And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    And I fill out the checkout form with "US" address
    When I click on "▸ Enter Payment Info" input field
    Then I use the credit card type: "Visa" number: "4000000000000028" exp date: "01/2020" CCV: "428"
    And I fill the contact info with email: "test@test.com" phone number "1231234567"
    And I click on "▸ Review Order" input field
    When I click on "▸ Submit My Order" input field
    Then The "American Eagle wants to ensure your credit card is safe and secure." text should appear
    And I authenticate on 3D Secure modal with "1234" password
    Then The "We are unable to process your order with entered Credit Card. Please select a different payment type to complete your order." text should appear

  Scenario: Cardholder enrolled - Attempted Authentication
    Given I open the AE website
    And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    And I fill out the checkout form with "US" address
    When I click on "▸ Enter Payment Info" input field
    Then I use the credit card type: "Visa" number: "4000000000000101" exp date: "01/2020" CCV: "401"
    And I fill the contact info with email: "test@test.com" phone number "1231234567"
    And I click on "▸ Review Order" input field
    When I click on "▸ Submit My Order" input field
    Then The "American Eagle wants to ensure your credit card is safe and secure." text should appear
    Then The "Order Placed" text should appear

  Scenario: Timeout Encountered while processing the cmpi_lookup transaction
    Given I open the AE website
    And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    And I fill out the checkout form with "US" address
    When I click on "▸ Enter Payment Info" input field
    Then I use the credit card type: "Visa" number: "4000000000000044" exp date: "01/2020" CCV: "428"
    And I fill the contact info with email: "test@test.com" phone number "1231234567"
    And I click on "▸ Review Order" input field
    When I click on "▸ Submit My Order" input field
    And I wait until the processing icon disappears
    Then The "Order Placed" text should appear

  Scenario: Cardholder not enrolled. - Issuing bank not participating
    Given I open the AE website
    And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    And I fill out the checkout form with "US" address
    When I click on "▸ Enter Payment Info" input field
    Then I use the credit card type: "Visa" number: "4000000000000051" exp date: "01/2020" CCV: "451"
    And I fill the contact info with email: "test@test.com" phone number "1231234567"
    And I click on "▸ Review Order" input field
    When I click on "▸ Submit My Order" input field
    And I wait until the processing icon disappears
    Then The "Order Placed" text should appear

  Scenario: Authentication unavailable (Lookup message response)
    Given I open the AE website
    And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    And I fill out the checkout form with "US" address
    When I click on "▸ Enter Payment Info" input field
    Then I use the credit card type: "Visa" number: "4000000000000069" exp date: "01/2020" CCV: "469"
    And I fill the contact info with email: "test@test.com" phone number "1231234567"
    And I click on "▸ Review Order" input field
    When I click on "▸ Submit My Order" input field
    And I wait until the processing icon disappears
    Then The "Order Placed" text should appear

  Scenario: Merchant not able to execute transactions (merchant not active)
    Given I open the AE website
    And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    And I fill out the checkout form with "US" address
    When I click on "▸ Enter Payment Info" input field
    Then I use the credit card type: "Visa" number: "4000000000000077" exp date: "01/2020" CCV: "477"
    And I fill the contact info with email: "test@test.com" phone number "1231234567"
    And I click on "▸ Review Order" input field
    When I click on "▸ Submit My Order" input field
    And I wait until the processing icon disappears
    Then The "Order Placed" text should appear


