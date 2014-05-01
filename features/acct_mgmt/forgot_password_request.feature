@NOT
Feature: As a user, I want to easily request a new password and be guided throughout the process of creating a new password
  As a user, I want to easily request a new password and be guided throughout the process of creating a new password.

  This scenarios will be only the first part, since login into the email and finding the correct email would cause a useless effort

  Scenario: I enter my email and wrong password the new error message should appear
    Given I open the AE website
    And I click on "Sign In" link
    Then I login with "v-navesv-ave@ae.com" "test"
    Then The "New wrong password text" text should appear

  Scenario: I enter my email and click on reset password
    Given I open the AE website
    And I click on "Sign In" link
    Then I input "v-navesv-ave@ae.com" on the field "email"
    When I click on "Forgot Password" link
    Then The "New wrong password text" text should appear

  Scenario: I enter my email, wrong password and request new password
    Given I open the AE website
    And I click on "Sign In" link
    Then I login with "v-navesv-ave@ae.com" "test"
    Then The "New wrong password text" text should appear
    When I click on "Forgot Password" link
    Then The "New wrong password text" text should appear