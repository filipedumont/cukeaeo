#PTC-894
@april_release
  Feature: Shoprunner should not be available for PO boxes
    As a logged in user, proceed to checkout. When selecting a saved address with PO Box it shouldn't display ShopRunner
    header or Ineligible Tag but information is being shown there.



    Scenario: Shoprunner tags are removed from checkout page when address is PO box
      Given I open the AE website
      And I open the PDP for "men_cologne"
      And I click on "+ Add to Bag" input field
      Then The bag should have "1" item(s)
      And I click on "▸ Checkout" link
      Then I click on "Guest Checkout" link
      And I fill out the checkout form with "PO Box" address
      Then I should not see "NOT ELIGIBLE"
      And I should not see "SHOPRUNNER"