@smoke
Feature: Add Products on the bag

  @tc-4
  Scenario: Add Product on Bag from PDP
    Given I open the AE website
    When I navigate to "PDPPage" with the product "0803_2110_966"
    And I add a product into the bag
    Then I should have my bag updated
  @tc-5 @review
  Scenario: Add Product on Bag from QV
    Given I open the AE website
    When I navigate to "Men" section from "HomePage"
    And I click on "Polos" link
    Then I should be on "BundlePage" page
    When I add the product "1165_6721_100" from QV module
    Then I should have my bag updated
  @tc-22
  Scenario: Add Product from the Bundle Page
    Given I open the AE website
    When I navigate to "Men" section from "HomePage"
    And I click on "Polos" link
    Then I should be on "BundlePage" page
    When I add the product "1165_6721_100" from QV module
    Then I should have my bag updated
  @tc-25
  Scenario: Hit multiple pages ?
    Given I open the AE website
    Then I navigate to "Men" section from "HomePage"
    And I click on "Polos" link
    And I navigate to "PDPPage" with the product "0803_2110_966"