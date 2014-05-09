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
    When I facebook login with "login" "password"
    Then I should be on "HomePage" page