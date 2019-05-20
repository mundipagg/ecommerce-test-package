Feature: Create order with two credit card

  Background:
    Given a new session
    And I define failure screenshot dir as "./failureScreenshots"

  @javascript
  Scenario: I create an credit card order
    Given I add a product to cart
    And I go to user form
    And I fill user data
    And I go to checkout
    And I select credit card payment method
    And I fill credit card data
    And I place order
    #And Check the installments
    #And Check order value with interest



