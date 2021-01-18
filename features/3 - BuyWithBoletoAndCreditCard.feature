Feature: Create order's with boleto and credit card

  Background:
    Given a new session
    And I define failure screenshot dir as "./failureScreenshots"

  @javascript
  Scenario: I create a boleto credit card order
    # I add a product to cart
    Given I wait for 1 seconds
    And I am on "/index.php"
    And I wait for 2 seconds
    And I am on "/fusion-backpack.html"
    And I wait for text "add to cart" to appear, for 10 seconds
    And I click in element "#product-addtocart-button"
    And I wait for text "added" to appear, for 10 seconds
    Then I wait for 3 seconds

    # I go to user form
    And I am on "/checkout"
    And I wait for text "Email" to appear, for 20 seconds

    # I fill user data
    And I use jquery to fill element "#customer-email" with a random email
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
    And I wait for 1 seconds
    And I use jquery to click on element "input[name='ko_unique_1']"
    Then I use jquery to set "<option selected='selected' data-title='Rio de Janeiro' value='502'>Rio de Janeiro</option>" to element "select[name='region_id']" with value "502"

    # I go to checkout
    And I wait for 5 seconds
    And I use jquery to click on element ".button.action.continue.primary"
    And I wait for text "Mundipagg" to appear, for 20 seconds

    # I select credit payment method
    Given I wait for 5 seconds
    And I use jquery to click on element "#mundipagg_billet_creditcard"
    And I check if element "#mundipagg_billet_creditcard-submit" exists

    # I fill boleto credit card data
    Given I use jquery to fill element "input[name='payment[bcc_amount]']" with value "32,00"
    And I wait for 10 seconds
    And I use jquery to fill element "input[name='payment[cc_number]']" with value "4000000000000010"
    And I use jquery to fill element "input[name='payment[cc_owner]']" with value "Test Name"
    And I use jquery to set "<option value='12'>12 - December</option>" to element "select[name='payment[cc_exp_month]']" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "select[name='payment[cc_exp_year]']" with value "2029"
    And I use jquery to set "<option value='2' interest='0'>2x of $16.00 without interest (Total: $32.00)</option>" to element "select[name='payment[cc_installments]']" with value "2"
    And I use jquery to fill element "input[name='payment[cc_cid]']" with value "123"
    Then I wait for 3 seconds

    # I place order with boleto credit card
    Given I wait for 2 seconds
    Then I use jquery to click on element "#mundipagg_billet_creditcard-submit"
    Given I wait for 20 seconds
    And I wait for text "Thank you for your purchase" to appear, for 30 seconds
    Given I wait for 20 seconds
    And I wait for element "#mundipagg-link-boleto" to appear, for 20 seconds











