#PTC-901 PTC-710 PTC-677
  @april_release
  Feature: Mexico restriction message
    As a Mexican customer I should be warned about a restriction on the limit amount of the cart
    when I go over that limit I should be redirected to the bag review page.

  Scenario: I should be warned of the restriction message on adding items to bag
    Given I open the AE website
    And I change the shipping country to "Mexico"
    Then I make my cart go over "$300"
    Then I should see "Mexico Shipping Restriction"
    When I click on "CONTINUE" link
    Then I should see "Shopping Bag"