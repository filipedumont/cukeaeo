@smoke
  Feature: User Checkout
@tc-6
    Scenario: Basic Checkout with an anon user
      Given I open the AE website
      When I navigate to "PDPPage" with the product "0803_2110_966"
      And I add a product into the bag
      And I checkout from bag bar in the "PDPPage"
      And I proceed with "guest" checkout
      And I fill the basic "guest" checkout
      Then I should be on "PlacedOrderPage" page
@tc-7
  Scenario: Basic Checkout with a signed in user
    Given I open the AE website
  When I navigate to "PDPPage" with the product "0803_2110_966"
  And I add a product into the bag
  And I checkout from bag bar in the "PDPPage"
  And I proceed with "signed" checkout
  And I fill the basic "signed" checkout
  Then I should be on "PlacedOrderPage" page