Feature: Create order with boleto

  Background:
    Given a new session
    And I define failure screenshot dir as "./failureScreenshots"

  @javascript
  Scenario: I create a boleto order
    Given I add a product to cart
    And I go to user form
    And I fill user data
    And I go to checkout
    And I select boleto payment method
    And I place order with boleto