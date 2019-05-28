Feature: Steps

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

  #I select boleto payment method
  @javascript @smartStep
  Scenario: I select boleto payment method
    Given I select Mundipagg boleto

  #I select boleto credit card payment method
  @javascript @smartStep
  Scenario: I select boleto credit card payment method
    Given I select Mundipagg boleto credit card

  #I fill credit card data
  @javascript @smartStep
  Scenario: I fill credit card data
    Given I fill credit card form data
    Then I check if card brand is selected

  #I fill boleto credit card data
  @javascript @smartStep
  Scenario: I fill boleto credit card data
    Given I fill boleto credit card form data
    Then I check if card brand is selected

  #I place order with credit card
  @javascript @smartStep
  Scenario: I place order with credit card
    Given I click in credit card place order button
    And I check if order was placed

  #I place order with boleto
  @javascript @smartStep
  Scenario: I place order with boleto
    Given I click in boleto place order button
    And I check if order was placed
    And I check if has a link to boleto

  #I place order with boleto credit card
  @javascript @smartStep
  Scenario: I place order with boleto credit card
    Given I click in boleto credit card place order button
    And I check if order was placed
    And I check if has a link to boleto
