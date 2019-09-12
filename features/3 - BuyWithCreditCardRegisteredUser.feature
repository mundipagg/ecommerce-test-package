Feature: Create order with credit card for a registered user

  Background:
    Given a new session
    And I define failure screenshot dir as "./failureScreenshots"

  @javascript
  Scenario: I create a credit card order for a registered user, save the credit card and use it
    Given I create a new user
    And I add a product to cart
    And I select the shipping method
    And I select credit card payment method
    And I select the saved card option
    And I fill credit card data
    And I place order with credit card
    #Using saved credit card
    Then I add a product to cart
    And I select the shipping method
    And I select credit card payment method
    And I select a saved credit card
    And I place order with credit card