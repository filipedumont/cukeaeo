@smoke
Feature: Account management with user sign in
@tc-1
  Scenario: Sign in user from the HomePage
    Given I open the AE website
    When I login with "v-navesv-ave@ae.com" "test123" from the "HomePage"
    Then I should be on the user "MyAccountPage"
@tc-2 @NOT
  Scenario: Sign in user with Facebook account
    Given I open the AE website
    When I facebook login with "v-francf-ave@ae.com" "Eagle123" from the "HomePage"
    Then I should be on the user "HomePage"
@tc-3
  Scenario: User create a new account
    Given I open the AE website
    When I click on "Create Account" link
    And I create a basic account
    Then I should be on the user "MyAccountPage"
@tc-17
  Scenario: Sign in user from Favorites landing page
    Given I open the AE website
    When I click on "My Favorites" link
    And I login with "v-navesv-ave@ae.com" "test123" from the "FavoritesPage"
    Then I should be on the user "FavoritesPage"
@tc-18 @NOT
  Scenario: Write a new product review from PDP Page
    Given I open the AE website
    When I navigate to "PDPPage" with the product "0419_3099_001"
    And I write a basic review for the product
    Then I should be on "ReviewProductPage" page
@tc-19
  Scenario: User signed in through the AE Modules
    Given I open the AE website
    When I login with "v-navesv-ave@ae.com" "test123" from the "HomePage"
    And I move to "AerieHomePage" module
    Then I should be logged in "AerieHomePage"
    When I move to "FactoryHomePage" module
    Then I should be logged in "FactoryHomePage"
@tc-20 @review
  Scenario: Sign in with product on bag overwrite previously saved items on cart
    Given I open the AE website
    When I navigate to "PDPPage" with the product "0803_2110_966"
    And I add a product into the bag
    And I checkout from bag bar in the "PDPPage"
    When I login with "v-navesv-ave@ae.com" "test123" from the "PDPPage"
    Then I should see my item added on the bag