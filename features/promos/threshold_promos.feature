#PTC-107
@NOT
Feature: Revise $500 threshold promotions so that its appropriately applicable
  As a customer I should see % and $ off discount given to the merchandise total only if merchandise
  total less gift qualifies for the threshold set.
  i.e $500 & NOT drop the offer once I hit $500, so that,
  the threshold of the promotion applicable for discount is maintained as a good experience.

Scenario: % off, with threshold. Promotion should cap out at max set.

  Given I open the AE website
 And I open the PDP for "men_shirt"
    And I select size "M"
  When I select size "S"
  And I click on "+ Add to Bag" input field
  Then The bag should have "1" item(s)
  When I expand the Bag Bar
  And I click on "Enter Code" link
  Then I input "500threshold" on the field "CouponCode"
  When I click on "Apply Code" input field
  Then I go over the threshold "$500"
  Then The "-$100.00" text should appear
