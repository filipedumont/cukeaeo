@NOT
Feature: Time Stamp Promo Code Error Message
  As a User when I enter an expired coupon
  The message should be clear for when the promotion expired including Time and Time Zone

 Scenario: New timestamped expired error message on bag bar apply coupon
   Given I open the AE website
  And I open the PDP for "men_shirt"
    And I select size "M"
   And I click on "+ Add to Bag" input field
   Then The bag should have "1" item(s)
   When I expand the Bag Bar
   And I click on "Enter Code" link
   Then I input "DateTest" on the field "CouponCode"
   When I click on "Apply Code" input field
   Then The "Sorry, this Discount Code is redeemable between Sep 01, 2013 at 10:27 am EDT and Sep 19, 2013 at 10:26 am EDT." text should appear

 Scenario: New timestamped expired error message on checkout apply coupon
   Given I open the AE website
  And I open the PDP for "men_shirt"
    And I select size "M"
   And I click on "+ Add to Bag" input field
   Then I expand the Bag Bar
   Then I click on "▸ Checkout" link
   Then I click on "Guest Checkout" link
   Then I input "DateTest" on the field "CouponCode"
   When I click on "Apply Code" input field
   Then The "Sorry, this Discount Code is redeemable between Sep 01, 2013 at 10:27 am EDT and Sep 19, 2013 at 10:26 am EDT." text should appear

  Scenario: Allow new promo code to work on bag
    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then I open My Bag
    Then I click on "Enter Code" link
    Then I input "DateTest" on the field "CouponCode"
    When I click on "Apply Code" input field
    Then The "Sorry, this Discount Code is redeemable between Sep 01, 2013 at 10:27 am EDT and Sep 19, 2013 at 10:26 am EDT." text should appear