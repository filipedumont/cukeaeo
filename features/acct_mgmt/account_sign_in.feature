@smoke
Feature: Account management with user sign in
@tc-1
  Scenario: Sign in user from the HomePage
    Given I open the AE website
    When I login with "v-navesv-ave@ae.com" "test123"
    Then I should be on "MyAccount" page
@tc-2
  Scenario: Sign in user with Facebook account
    Given I open the AE website
    When I facebook login with "v-francf-ave@ae.com" "Eagle123"
    Then I should be on "HomePage" page
@tc-3 @skip
  Scenario: User create a new account
    Given I open the AE website
    When I click on "Create Account" link
    And I create a basic account
    Then I should be on "MyAccount" page
