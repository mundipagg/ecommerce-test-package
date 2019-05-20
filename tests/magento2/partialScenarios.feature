#Feature: Partial Scenarios

  #I go to product page
  #@javascript @smartStep
  #Scenario: I go to product page
    #Given I am on "/fusion-backpack.html"
    #And I wait for text "add to cart" to appear, for 10 seconds
    #Then I click in element "#product-addtocart-button"

  #I click on add to cart button
  #@javascript @smartStep
  #Scenario: I click on add to cart button
    #Given I click in element "#product-addtocart-button"
    #And I wait for text "added" to appear, for 10 seconds


