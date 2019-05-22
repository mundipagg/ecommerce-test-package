Feature: Sub Scenarios

  #I add a product to cart
  @javascript @smartStep
  Scenario: I add a product to cart
    Given I go to product page
    Then I click on add to cart button

  #I go to user form
  @javascript @smartStep
  Scenario: I go to user form
    Given I go to user form page

  #I fill user data
  @javascript @smartStep
  Scenario: I fill user data
    Given I fill user form data

  #I go to checkout
  @javascript @smartStep
  Scenario: I go to checkout
    Given I go to checkout page

  #I select credit card payment method
  @javascript @smartStep
  Scenario: I select credit card payment method
    Given I select Mundipagg credit card

  #I fill credit card data
  @javascript @smartStep
  Scenario: I fill credit card data
    Given I fill credit card form data
    Then I check if card brand is selected

  #I place order
  @javascript @smartStep
  Scenario: I place order
    Given I click in place order button
    And I check if order was placed
