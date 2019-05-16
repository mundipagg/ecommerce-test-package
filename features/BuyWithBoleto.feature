Feature: Create order with boleto

  Background:
    Given a new session
    And I define failure screenshot dir as "./failureScreenshots"

  @javascript
  Scenario: I test
    Given I am on "/admin"
    When I add a a product

