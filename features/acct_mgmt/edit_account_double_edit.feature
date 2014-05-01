#PTC-83
  @NOT
Feature: Under Account Settings - No More than one section should be allowed for editing

  Scenario: I try to edit more than one area under the Account Settings at once and should not be allowed to
    Given I open the AE website
    And I click on "Sign In" link
    And I login with "v-navesv-ave@ae.com" "test123"
    When I open the Account Settings
    Then I click on the "Account" edit button
    Then The "FIRST NAME" text should appear
    When I click on the "Password" edit button
    Then The "CURRENT PASSWORD" text should appear
    And The "FIRST NAME" text should not be visible