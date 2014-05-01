#AEO-864
@NOT
Feature: Individual promo code error messages for each type of promo codes
  As a user, I want individual promo code error messages to be created for each type of promo codes
  so that I can have better understanding about its usage during shopping.
  Acceptance criteria:
  1) If promo code is invalid/expire then error message should appear in red box above discount code field text.
     Also text should be driven dynamically.
  2) When promo code gets accepted successfully then promo message should appear in green box.
     Also there should be no change in implementation of current behavior.
  3) When promo code does not get accepted then promo message should appear in gray box.
     Also there should be no change in implementation of current behavior.
  4) It should have the ability to display individual error messages for 15 active promo codes.

  Pre-Requisites to run tests:
   - Have Expired Coupon Code
   - Have Valid Coupon Code

Scenario: Coupon code is invalid
  Given I open the AE website
 And I open the PDP for "men_shirt"
    And I select size "M"
  And I click on "Add to bag" input field
  Then I expand the Bag Bar
  Then I click on "Enter Code" link
  Then I input "invalid coupon" on the field "CouponCode"
  When I click on "Apply Code" input field
  Then The "Invalid Coupon Code" text should appear

Scenario: Coupon code is expired
  Given I open the AE website
 And I open the PDP for "men_shirt"
    And I select size "M"
  And I click on "Add to bag" input field
  Then I expand the Bag Bar
  Then I click on "Enter Code" link
  Then I input "expired coupon" on the field "CouponCode"
  When I click on "Apply Code" input field
  Then The "Expired Coupon Code" text should appear

  Scenario: Coupon is qualified
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "Add to bag" input field
    And I open the PDP for "0166_7615_050"
    When I select size "S"
    And I click on "Add to bag" input field
    Then I expand the Bag Bar
    Then I click on "Enter Code" link
    Then I input "BOGO coupon" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "Bag is qualified" text should appear

  Scenario: Coupon is unqualified
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "Add to bag" input field
    Then I expand the Bag Bar
    Then I click on "Enter Code" link
    Then I input "BOGO coupon" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "Bag is not qualified" text should appear

  Scenario: Coupon is qualified, then I remove products from bag and unqualifies the coupon

    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "Add to bag" input field
    Then I expand the Bag Bar
    Then I click on "Enter Code" link
    Then I input "BOGO coupon" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "Bag is qualified" text should appear
    When I remove product "men_shirt" from the bag
    Then The "Bag is not qualified" text should appear

