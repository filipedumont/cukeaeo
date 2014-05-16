@smoke
  Feature: Basic Browse functions
@tc-26
    Scenario: Find valid stores through the PDP Page
      Given I open the AE website
      When I navigate to "PDPPage" with the product "0803_2110_966"
      And I search for a store with the "15203" code
      Then I should see a list of valid stores
@tc-27
    Scenario: User track an order
    Given I open the AE website
    When I track an order with number "J9102753" and email "v-navesv-ave@ae.com"
    Then I should see the order status
@tc-28
    Scenario: User change the international shipping settings
    Given I open the AE website
    When I open the international modal
    And I change the "Shipping" to "Argentina"
    Then I should see the settings applied for "Shipping" to "Argentina"
@tc-29
Scenario: User change the international currency settings
  Given I open the AE website
  When I open the international modal
  And I change the "Currency" to "Argentine Peso"
  Then I should see the settings applied for "Currency" to "Argentine Peso"
@tc-30
Scenario: User change the international language settings
  Given I open the AE website
  When I open the international modal
  And I change the "Language" to "Español"
  Then I should see the settings applied for "Language" to "Español"