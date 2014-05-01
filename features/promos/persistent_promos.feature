#PTC-12
@NOT
Feature: Promo codes should persistent through the whole session/devices and soft login
  As a user, I want promotion codes to remain persistent throughout session for all devices
  so that I don't have to enter them again at the checkout process.
  when customer applies promotion code to their cart in bag bar,
  the promo code doesn't reman persistent irrespective of any entry points (Bag bar, bag review and checkout).

  Acceptance criteria:

  1) The promo code should remain persistent throughout all entry points which includes bag bar, bag review and checkout
  2) It should also remain persistent in all sessions (like soft log in) across all devices (mobile, tablets and desktops)

  Scenario: Soft login (from promo link) should persist after you login
    Given I open the link "promo_link"
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "1316a30" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "-$10.00" text should appear
    Then I login with "test@ae.com" "test1234543" on the top bar
    Then The "-$10.00" text should appear

  Scenario: Soft login (from promo link) should persist after you login fails
    Given I open the link "promo_link"
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "1316a30" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "-$10.00" text should appear
    Then I login with "test@ae.com" "test1234543" on the top bar
    Then The "-$10.00" text should appear
    And The "The entered username or password is invalid" text should appear

  Scenario: Add items and promos as guest and login with email top nav
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "1316a30" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "-$10.00" text should appear
    Then I login with "test@ae.com" "test1234543" on the top bar
    Then The "-$10.00" text should appear

  Scenario: Add items and promos as guest and fail login with email top nav
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "1316a30" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "-$10.00" text should appear
    Then I login with "test@ae.com" "test1234543" on the top bar
    Then The "-$10.00" text should appear
    And The "The entered username or password is invalid" text should appear

  Scenario: Add items and promos as guest and login with email checkout
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "1316a30" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "-$10.00" text should appear
    Then I click on "▸ Checkout" link
    Then I input "test@ae.com" on the field "email"
    And I input "test1234" on the field "aeAccountPass"
    When I click on "Sign In" input field
    Then The "-$10.00" text should appear

  Scenario: Add items and promos as guest and fail login with email checkout
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "1316a30" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "-$10.00" text should appear
    Then I click on "▸ Checkout" link
    Then I input "test@ae.com" on the field "email"
    Then The "-$10.00" text should appear

  Scenario: Promo from desktop login/logout should persist thru mobile checkout
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "1316a30" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "-$10.00" text should appear
    Then I click on "Sign In" link
    Then I login with "test@ae.com" "test1234"
    Then The "-$10.00" text should appear
    And I logout from desktop
    Given I open the mobile AE website
    And I login with "test@ae.com" "test1234" on the mobile site
    And I open the mobile bag status
    Then The "-$10.00" text should appear

  Scenario: Checkout as Guest user
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "1316a30" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "-$10.00" text should appear
    Then I click on "▸ Checkout" link
    When I click on "Guest Checkout" input field
    Then The "-$10.00" text should appear

  Scenario: Checkout page with promo, add item to bag
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "1316a30" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "-$10.00" text should appear
    Then I click on "▸ Checkout" link
    When I click on "Guest Checkout" input field
    Then The "-$10.00" text should appear
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field

  #Scenario: Expired promotion
  Scenario: Promotions should persist after you login through facebook

  Scenario: Promotions should disappear after logout, reset the state to a new guest user
