#PTC-884
  @april_release
  Feature: VGC should be retained in the bag after user signs out
    As a customer I would like for the VGC to persist on my bag after I sign out

  Scenario: After re-sign in VGC should be present
    Given I open the AE website
    Then I click on "E-Gift Card" link
    Then I fill the "Electronic" Gift Card form
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    And I click on "▸ Checkout" link
    And I login with "v-navesv-ave@ae.com" "test123"
    When I logout from desktop
    And I click on "Sign In" link
    And I login with "v-navesv-ave@ae.com" "test123"
    Then The bag should have "1" item(s)