#PTC-927
  @april_release
  Feature: DPO needs to be included in the info box when selected
    As a diplomatic shopper I need to select DPO as my shipping "country"
    so that I can receive my orders without any problem

  Scenario: DPO should be included in the drop down list
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    Then I should see "Country, APO/FPO/DPO"
    Then I should see "First Name"
    Then I should see "Last Name"
    Then I should see "Address"