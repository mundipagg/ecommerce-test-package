Feature: Create order with boleto

  Background:
    Given a new session
    And I define failure screenshot dir as "./failureScreenshots"

  @javascript
  Scenario: I create a boleto order
    # I add a product to cart
    Given I wait for 2 seconds
    And I am on "/index.php"
    And I wait for 2 seconds
    And I am on "/fusion-backpack.html"
    And I wait for text "add to cart" to appear, for 10 seconds
    And I click in element "#product-addtocart-button"
    And I wait for text "added" to appear, for 10 seconds
    Then I wait for 3 seconds

    #  I go to user form
    Given I am on "/checkout"
    Then I wait for text "Email" to appear, for 20 seconds

    #  I fill user data
    Given I use jquery to fill element "#customer-email" with a random email
    And I wait for 5 seconds
    And I wait for text "First Name" to appear, for 10 seconds
    And I use jquery to fill element "input[name='firstname']" with value "Test"
    And I use jquery to fill element "input[name='lastname']" with value "Test"
    And I use jquery to fill element "input[name='street[0]']" with value "Rua test"
    And I use jquery to fill element "input[name='street[1]']" with value "Número test"
    And I use jquery to fill element "input[name='street[2]']" with value "Bairro test"
    And I use jquery to fill element "input[name='city']" with value "City test"
    And I use jquery to set "<option selected='selected' data-title='Brazil' value='BR'>Brazil</option>" to element "select[name='country_id']" with value "BR"
    And I use jquery to fill element "select[name='region_id']" with value "502"
    And I use jquery to fill element "input[name='postcode']" with value "69152055"
    And I use jquery to fill element "input[name='telephone']" with value "2122222222"
    And I use jquery to fill element "input[name='vat_id']" with value "16674352306"
    And I wait for 3 seconds
    And I use jquery to click in first element start with "input[name^='ko_unique_']"
    Then I use jquery to set "<option selected='selected' data-title='Rio de Janeiro' value='502'>Rio de Janeiro</option>" to element "select[name='region_id']" with value "502"

    #  I go to checkout
    Given I wait for 6 seconds
    And I use jquery to click in element ".button.action.continue.primary"
    Then I wait for text "Mundipagg" to appear, for 20 seconds

    #  I select boleto payment method
    And I wait for 5 seconds
    And I use jquery to click in element "#mundipagg_billet"
    And I wait for 4 seconds

    #  I place order with boleto
    Given I wait for 5 seconds
    Then I use jquery to click in element "#mundipagg_billet-submit"
    Given I wait for 25 seconds
    And I wait for text "Thank you for your purchase" to appear, for 30 seconds