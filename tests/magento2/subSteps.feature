Feature: Substeps

  #I go to product page
  @javascript @smartStep
  Scenario: I go to product page
    Given I wait for 1 seconds
    And I am on "/fusion-backpack.html"
    And I wait for text "add to cart" to appear, for 10 seconds

  #I click on add to cart button
  @javascript @smartStep
  Scenario: I click on add to cart button
    And I click in element "#product-addtocart-button"
    And I wait for text "added" to appear, for 10 seconds
    Then I wait for 3 seconds

  #I go to user form page
  @javascript @smartStep
  Scenario: I go to user form page
    Given I am on "/checkout"
    Then I wait for text "Email" to appear, for 20 seconds

  #I fill user form data
  @javascript @smartStep
  Scenario: I fill user form data
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
    And I wait for 1 seconds
    And I use jquery to click in element "input[name='ko_unique_1']"
    Then I use jquery to set "<option selected='selected' data-title='Rio de Janeiro' value='502'>Rio de Janeiro</option>" to element "select[name='region_id']" with value "502"


   #I fill user form data without taxvat
  @javascript @smartStep
  Scenario: I fill user form data without taxvat
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
    And I wait for 1 seconds
    And I use jquery to click in element "input[name='ko_unique_1']"
    Then I use jquery to set "<option selected='selected' data-title='Rio de Janeiro' value='502'>Rio de Janeiro</option>" to element "select[name='region_id']" with value "502"

  #I go to checkout page
  @javascript @smartStep
  Scenario: I go to checkout page
    Given I wait for 5 seconds
    And I use jquery to click in element ".button.action.continue.primary"
    Then I wait for text "Mundipagg" to appear, for 20 seconds

  #I select Mundipagg credit card
  @javascript @smartStep
  Scenario: I select Mundipagg credit card
    Given I wait for 5 seconds
    And I use jquery to click in element "#mundipagg_creditcard"
    And I check if element "#creditCardPlaceOrder" exists

  #I select Mundipagg boleto
  @javascript @smartStep
  Scenario: I select Mundipagg boleto
    Given I use jquery to click in element "#mundipagg_billet"
    Then I wait for 1 seconds

  #I select Mundipagg boleto credit card
  @javascript @smartStep
  Scenario: I select Mundipagg boleto credit card
    Given I use jquery to click in element "#mundipagg_billet_creditcard"
    Then I wait for 1 seconds

  #I fill credit card form data
  @javascript @smartStep
  Scenario: I fill credit card form data
    Given I use jquery to fill element "input[name='payment[cc_number]']" with value "4299742836791151"
    And I use jquery to fill element "input[name='payment[cc_owner]']" with value "Test Name"
    And I use jquery to set "<option value='12'>12 - December</option>" to element "select[name='payment[cc_exp_month]']" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "select[name='payment[cc_exp_year]']" with value "2029"
    And I use jquery to set "<option value='2' interest='0'>2x of $32.00 without interest (Total: $64.00)</option>" to element "select[name='payment[cc_installments]']" with value "2"
    And I use jquery to fill element "input[name='payment[cc_cid]']" with value "123"
    Then I wait for 3 seconds

  #I fill boleto credit card form data
  @javascript @smartStep
  Scenario: I fill boleto credit card form data
    Given I use jquery to fill element "input[name='payment[cc_billet_amount]']" with value "20"
    And I wait for 3 seconds
    And I use jquery to fill element "input[name='payment[cc_number]']" with value "4299742836791151"
    And I use jquery to fill element "input[name='payment[cc_owner]']" with value "Test Name"
    And I use jquery to set "<option value='12'>12 - December</option>" to element "select[name='payment[cc_exp_month]']" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "select[name='payment[cc_exp_year]']" with value "2029"
    And I use jquery to set "<option value='2' interest='0'>2x of $22.00 without interest (Total: $44.00)</option>" to element "select[name='payment[cc_installments]']" with value "2"
    And I use jquery to fill element "input[name='payment[cc_cid]']" with value "123"
    Then I wait for 3 seconds

  #I check if card brand is selected
  @javascript @smartStep
  Scenario: I check if card brand is selected
    Given I check if card brand is selected in element ".brands.visa"

  #I click in credit card place order button
  @javascript @smartStep
  Scenario: I click in credit card place order button
    Given I wait for 2 seconds
    And I use jquery to click in element "#creditCardPlaceOrder"
    And I wait for 5 seconds

  #I click in boleto place order button
  @javascript @smartStep
  Scenario: I click in boleto place order button
    Given I wait for 1 seconds
    Then I use jquery to click in element "#boletoPlaceOrder"

  #I click in boleto credit card place order button
  @javascript @smartStep
  Scenario: I click in boleto credit card place order button
    Given I wait for 1 seconds
    Then I use jquery to click in element "#boletoCreditCardPlaceOrder"

  #I check if has a link to boleto
  @javascript @smartStep
  Scenario: I check if has a link to boleto
    Given I wait for 2 seconds
    And I wait for element "#mundipagg-link-boleto" to appear

  #I check if order was placed
  @javascript @smartStep
  Scenario: I check if order was placed
    Given I wait for 10 seconds
    And I wait for text "order" to appear, for 20 seconds
    And I wait for 5 seconds

  #I check if error was dispatched
  @javascript @smartStep
  Scenario: I check if error was dispatched
    Given I wait for 2 seconds
    And I wait for element ".message-error" to appear, for 20 seconds
    And I wait for 5 seconds

  #I finish
  @javascript @smartStep
  Scenario: I finish
    Given I wait for 1 seconds
    And I wait for 1 seconds