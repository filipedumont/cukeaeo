#PTC-72
  @NOT
Feature: Redirect loop error displayed when International modal is opened from Account Settings.
  The Account edit page is giving a loop on the International settings modal.

Scenario: I edit the location settings and I am not stuck in an redirect loop from the international modal
  Given I open the AE website
  And I click on "Sign in" link
  Then I login with "v-navesv-ave@ae.com" "test123"
  And Open the user drop down menu
  When I click on "My Account" link
  And I click on "Account Settings" link
  Then I click on the edit button for "Edit International Address"
  And I select the country "Brazil"
  And I select the currency "Brazillian Real"
  When I click on "Save" input field
  Then The "Hello, Brazil!" text should appear
  When I click on "CONTINUE SHOPPING" input field
  Then The "Hello, Brazil!" text should not be visible
