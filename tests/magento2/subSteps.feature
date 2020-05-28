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
    And I use jquery to fill element "input[name='lastname']" with value "Without Tax"
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
    And I check if element "#mundipagg_creditcard-submit" exists

  #I select Mundipagg boleto
  @javascript @smartStep
  Scenario: I select Mundipagg boleto
    Given I use jquery to click in element "#mundipagg_billet"
    Then I wait for 1 seconds

  #I select Mundipagg boleto credit card
  @javascript @smartStep
  Scenario: I select Mundipagg boleto credit card
    Given I wait for 5 seconds
    And I use jquery to click in element "#mundipagg_billet_creditcard"
    And I check if element "#mundipagg_billet_creditcard-submit" exists

  #I fill credit card form data
  @javascript @smartStep
  Scenario: I fill credit card form data
    Given I use jquery to fill element "input[name='payment[cc_number]']" with value "4000000000000010"
    And I use jquery to fill element "input[name='payment[cc_owner]']" with value "Test Name"
    And I use jquery to set "<option value='12'>12 - December</option>" to element "select[name='payment[cc_exp_month]']" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "select[name='payment[cc_exp_year]']" with value "2029"
    And I use jquery to set "<option value='2' interest='0'>2x of $32.00 without interest (Total: $64.00)</option>" to element "select[name='payment[cc_installments]']" with value "2"
    And I use jquery to fill element "input[name='payment[cc_cid]']" with value "123"
    Then I wait for 3 seconds

  #I fill boleto credit card form data
  @javascript @smartStep
  Scenario: I fill boleto credit card form data
    Given I use jquery to fill element "input[name='payment[bcc_amount]']" with value "20,00"
    And I wait for 10 seconds
    And I use jquery to fill element "input[name='payment[cc_number]']" with value "4000000000000010"
    And I use jquery to fill element "input[name='payment[cc_owner]']" with value "Test Name"
    And I use jquery to set "<option value='12'>12 - December</option>" to element "select[name='payment[cc_exp_month]']" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "select[name='payment[cc_exp_year]']" with value "2029"
    And I use jquery to set "<option value='2' interest='0'>2x of $16.00 without interest (Total: $32.00)</option>" to element "select[name='payment[cc_installments]']" with value "2"
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
    And I use jquery to click in element "#mundipagg_creditcard-submit"
    And I wait for 5 seconds

  #I click in boleto place order button
  @javascript @smartStep
  Scenario: I click in boleto place order button
    Given I wait for 1 seconds
    Then I use jquery to click in element "#mundipagg_billet-submit"

  #I click in boleto credit card place order button
  @javascript @smartStep
  Scenario: I click in boleto credit card place order button
    Given I wait for 2 seconds
    Then I use jquery to click in element "#mundipagg_billet_creditcard-submit"

  @javascript @smartStep
  Scenario: I check order creation
    Given I wait for 20 seconds
    And I wait for text "Thank you for your purchase" to appear, for 30 seconds

  #I check if error was dispatched
  @javascript @smartStep
  Scenario: I check if error was dispatched
    Given I wait for 2 seconds
    And I wait for element ".message-error" to appear, for 20 seconds
    And I wait for 5 seconds

  #I go to registration page
  @javascript @smartStep
  Scenario: I go to registration page
    Given I am on "/customer/account/create/"
    And I wait for text "Create New Customer Account" to appear, for 20 seconds

  #I fill the registration form
  @javascript @smartStep
  Scenario: I fill the registration form
    Given I use jquery to fill element "input[name='firstname']" with value "Test"
    And I use jquery to fill element "input[name='lastname']" with value "Test"
    And I use jquery to fill element "#taxvat" with value "16674352306"
    And I use jquery to fill element "#email_address" with a random email
    And I use jquery to fill element "#password" with value "@teste123"
    And I use jquery to fill element "#password-confirmation" with value "@teste123"
    And I use jquery to click in element "button[title='Create an Account']"
    And I wait for text "Thank you for registering" to appear, for 240 seconds

  #I go to address page
  @javascript @smartStep
  Scenario: I go to address page
    Given I am on "/customer/address/edit/"
    And I wait for text "Add New Address" to appear, for 20 seconds

  #I fill the address form
  @javascript @smartStep
  Scenario: I fill the address form
    Given I use jquery to fill element "#firstname" with value "Test"
    And I use jquery to fill element "#lastname" with value "Test"
    And I use jquery to fill element "#telephone" with value "(21) 2555-5555"
    And I use jquery to fill element "#street_1" with value "Rua A"
    And I use jquery to fill element "#street_2" with value "Número"
    And I use jquery to fill element "#street_3" with value "Bairro A"
    And I use jquery to fill element "#street_4" with value "Complemento 101"
    And I use jquery to fill element "#vat_id" with value "16674352306"
    And I use jquery to fill element "#city" with value "Rio de Janeiro"
    And I use jquery to fill element "#zip" with value "95041210"
    And I use jquery to set "<option selected='selected' data-title='Brazil' value='BR'>Brazil</option>" to element "#country" with value "BR"
    And I use jquery to set "<option selected='selected' data-title='Rio de Janeiro' value='502'>Rio de Janeiro</option>" to element "#region_id" with value "502"
    And I use jquery to click in element "button[title='Save Address']"
    And I wait for text "You Saved The Address" to appear, for 20 seconds

  #I go to shipping page
  @javascript @smartStep
  Scenario: I go to shipping page
    Given I am on "/checkout/#shipping"
    And I wait for text "Flat Rate" to appear, for 20 seconds
    And I use jquery to click in element "input[name='ko_unique_1']"
    And I use jquery to click in element ".continue"
    And I wait for 10 seconds

  #I select the saved card option
  @javascript @smartStep
  Scenario: I select the saved card option
    Given I use jquery to click on element "#creditcard-save"

  #I select a installment option
  @javascript @smartStep
  Scenario: I select a installment option
    Given I use jquery to set "<option value='1' interest='0'>1x of $64.00 without interest (Total: $64.00)</option>" to element "select[name='payment[cc_installments]']" with value "1"
    And I wait for 1 seconds

  #I check the boleto print button
  @javascript @smartStep
  Scenario: I check the boleto print button
    Given I wait for 20 seconds
    And I wait for element "#mundipagg-link-boleto" to appear, for 20 seconds

  #I finish
  @javascript @smartStep
  Scenario: I finish
    Given I wait for 1 seconds
    And I wait for 1 seconds
