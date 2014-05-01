#PTC-19
@NOT
Feature: Making Promo codes shorter and all letter combo
  As a promo code user,
  I would like a shorter, all letter promotion code
  so that, it is easier for me to remember during checkout.

  Scenario Outline: I want to test if letters are working and are not case sensitive

    Given I open the AE website
   And I open the PDP for "men_shirt"
    And I select size "M"
    And I click on "+ Add to Bag" input field
    Then The bag should have "1" item(s)
    When I expand the Bag Bar
    And I click on "Enter Code" link
    Then I input "<coupon_code>" on the field "CouponCode"
    And I click on "Apply Code" input field
    Then The "<expected_result>" text should appear

    Examples:

    |coupon_code     |expected_result                        |
    |alphatest2013   |This is a custom unqualified message|
    |Alphatest2013   |This is a custom unqualified message|
    |ALPHAtest2013   |This is a custom unqualified message|
    |AlPhAtEsT2013   |This is a custom unqualified message|
    |AE              |Your discount code was not recognized. |
    |@e              |Your discount code was not recognized. |
    |10%off@10$      |Your discount code was not recognized. |