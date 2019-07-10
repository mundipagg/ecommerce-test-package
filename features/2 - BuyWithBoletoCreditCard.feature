Feature: Create order with boleto and credit card

  Background:
    Given a new session
    And I define failure screenshot dir as "./failureScreenshots"

  @javascript
  Scenario: I create a boleto credit card order
    Given I add a product to cart
    And I go to user form
    And I fill user data
    And I go to checkout
    And I select boleto credit card payment method
    And I fill boleto credit card data
    And I place order with boleto credit card



