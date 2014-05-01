#PTC-938
@april_release
  Feature: Billing address should be displayed when doing a purchase with only electronic delivery
    As a guest customer I need to be able to input my billing address
    so that the credit card will be able to fulfill the order


  Scenario: As a guest user I should be able to input a billing address when using CC as a payment method
    Given I open the AE website
    Then I click on "E-Gift Card" link
    Then I fill the "Electronic" Gift Card form
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    Then I should see "Electronic Shipping"

