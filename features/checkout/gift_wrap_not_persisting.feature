#PTC-100
  @NOT
Feature: Gift Wrap amt retained but Gift Wrap is not retained
  The Gift Wrap amount is retained where the Gift wrap is not retained when user signout of AE account
  or when session times out. Seeing this issue only with Signed-in users.

Scenario: Gift wrap should retain in bag after log out and log back in
  Given I open the AE website
 And I open the PDP for "men_shirt"
    And I select size "M"
  And I click on "+ Add to Bag" input field
  Then The bag should have "1" item(s)
  When I click on "▸ Checkout" link
  And I login with "v-navesv-ave@ae.com" "test123"
  Then I add a gift wrap for item "1"
  Then The "Gift Wrap:" text should appear
  When I logout from desktop
  And I click on "Sign In" link