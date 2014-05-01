#AEO-863
@NOT
Feature: Making Promo codes shorter and all letter combo
  As a promo code user,
  I would like a shorter, all letter promotion code
  so that it is easier for me to remember during checkout.

  Acceptance criteria:
  1) Discount code should accept 2 to 20 digits alpha-numerical codes.
     Also it can be either promo code or coupon code
  2) When discount code is entered then it should remain persistent at all checkpoints
  3) Promo code should be non case sensitive

  Pre-Requisites to run the test:
   - Have a new alphanumeric coupon that is not expired
   - Have an old numeric coupon that is not expired

  Scenario: Allow new promo code to work on Bag Bar
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then I expand the Bag Bar
    Then I click on "Enter Code" link
    Then I input "alphaTest2013" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "This is a custom unqualified message" text should appear

  Scenario: Allow new promo code to work on checkout
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then I expand the Bag Bar
    Then I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    Then I input "alphaTest2013" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "This is a custom unqualified message" text should appear

  Scenario: Allow new promo code to work on bag
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then I open My Bag
    Then I input "alphaTest2013" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "This is a custom unqualified message" text should appear

  Scenario: Allow old promo code to work on Bag Bar
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then I expand the Bag Bar
    Then I click on "Enter Code" link
    Then I input "82162731" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "The Friends & Family 25% Off has been applied." text should appear

  Scenario: Allow old promo code to work on checkout
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then I expand the Bag Bar
    Then I click on "▸ Checkout" link
    Then I click on "Guest Checkout" link
    Then I input "82162731" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "This is a custom unqualified message" text should appear

  Scenario: Allow old promo code to work on bag
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then I open My Bag
    Then I click on "Enter Code" link
    Then I input "82162731" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "The Friends & Family 25% Off has been applied." text should appear