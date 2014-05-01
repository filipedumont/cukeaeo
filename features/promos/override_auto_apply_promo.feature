#PTC-13
@NOT
Feature: Accessibility to override auto applied promotion code
  As a user,
  I want accessibility to override auto applied promotion codes with manual code
  so that I can use best promo available to me while shopping

  Scenario: 2 Coupons, select coupon 2, reapply coupon 1
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "Coupon1" on the field "CouponCode"
    And I click on "Apply Code" input field
    And I input "Coupon2" on the field "CouponCode"
    And I click on "Apply Code" input field
    When I click on "Use Instead" input field
    Then The "-$15.00" text should appear
    When I click on "Use Instead" input field
    Then The "-$15.00" text should appear

  Scenario: 3 Coupons, 2 stackable, 1 non-stackable
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Given I input "StackCoupon1" on the field "CouponCode"
    And I click on "Apply Code" input field
    Then The "-$15.00" text should appear
    Given I input "StackCoupon2" on the field "CouponCode"
    And I click on "Apply Code" input field
    Then The "-$25.00" text should appear
    Given I input "NonStackCoupon1" on the field "CouponCode"
    And I click on "Apply Code" input field
    When I click on "Use Instead" input field
    Then The "-$20.00" text should appear


  Scenario: 3 Coupons, 1 stackable, 1 non-stackable, 1 stackable
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Given I input "StackCoupon1" on the field "CouponCode"
    And I click on "Apply Code" input field
    Then The "-$15.00" text should appear
    Given I input "NonStackCoupon1" on the field "CouponCode"
    And I click on "Apply Code" input field
    Given I input "StackCoupon2" on the field "CouponCode"
    And I click on "Apply Code" input field
    When I click on "Use Instead" input field
    Then The "-$20.00" text should appear

  Scenario: Select newly entered coupon.
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Given I input "StackCoupon1" on the field "CouponCode"
    And I click on "Apply Code" input field
    Then The "-$15.00" text should appear
    Given I input "NonStackCoupon1" on the field "CouponCode"
    And I click on "Apply Code" input field
    Given I input "StackCoupon2" on the field "CouponCode"
    And I click on "Apply Code" input field
    When I click on "Use Instead" input field
    Then The "-$20.00" text should appear