Feature: Substeps

  #I go to product page
  @javascript @smartStep
  Scenario: I go to product page
    Given I wait for 1 seconds
    And I am on "/index.php/aviator-sunglasses.html"
    And I wait for text "Aviator Sunglasses" to appear, for 10 seconds

  #I click on add to cart button
  @javascript @smartStep
  Scenario: I click on add to cart button
    And I click in element ".add-to-cart-buttons .button.btn-cart"
    And I wait for text "added" to appear, for 10 seconds
    Then I wait for 3 seconds

  #I go to user form page
  @javascript @smartStep
  Scenario: I go to user form page
    Given I am on "/index.php/checkout/onepage/"
    And I wait for 5 seconds
    And I click in element "#onepage-guest-register-button"
    Then I wait for text "Billing Information" to appear, for 20 seconds

  #I fill user form data
  @javascript @smartStep
  Scenario: I fill user form data
#    Given I use jquery to fill element "#billing:email" with a random email
    Given I use jquery to fill element "input[name='billing[email]']" with value "teste@teste.com"
    And I wait for 5 seconds
    And I wait for text "First Name" to appear, for 10 seconds
    And I use jquery to fill element "input[name='billing[firstname]']" with value "Test"
    And I use jquery to fill element "input[name='billing[lastname]']" with value "Test"
    And I use jquery to fill element "input[title='Street Address']" with value "Rua test"
    And I use jquery to fill element "input[title='Street Address 2']" with value "Número test"
    And I use jquery to fill element "input[title='Street Address 3']" with value "Bairro test"
    And I use jquery to fill element "input[name='billing[city]']" with value "City test"
    And I use jquery to set "<option selected='selected' value='BR'>Brazil</option>" to element "select[name='billing[country_id]']" with value "BR"
    And I use jquery to set "<option value='485'>Rio de Janeiro</option>" to element "select[name='billing[region_id]']" with value "485"
    And I use jquery to fill element "input[name='billing[postcode]']" with value "69152055"
    And I use jquery to fill element "input[name='billing[telephone]']" with value "2122222222"
    And I use jquery to fill element "input[name='billing[vat_id]']" with value "16674352306"
    And I wait for 1 seconds

   #I fill user form data without taxvat
  @javascript @smartStep
  Scenario: I fill user form data without taxvat
    Given I use jquery to fill element "input[name='billing[email]']" with a random email
    And I wait for 5 seconds
    And I wait for text "First Name" to appear, for 10 seconds
    And I use jquery to fill element "input[name='billing[firstname]']" with value "Test"
    And I use jquery to fill element "input[name='billing[lastname]']" with value "Test"
    And I use jquery to fill element "input[title='Street Address']" with value "Rua test"
    And I use jquery to fill element "input[title='Street Address 2']" with value "Número test"
    And I use jquery to fill element "input[title='Street Address 3']" with value "Bairro test"
    And I use jquery to fill element "input[name='billing[city]']" with value "City test"
    And I use jquery to set "<option selected='selected' value='BR'>Brazil</option>" to element "select[name='billing[country_id]']" with value "BR"
    And I use jquery to set "<option value='485'>Rio de Janeiro</option>" to element "select[name='billing[region_id]']" with value "485"
    And I use jquery to fill element "input[name='billing[postcode]']" with value "69152055"
    And I use jquery to fill element "input[name='billing[telephone]']" with value "2122222222"
    And I wait for 1 seconds

  #I go to checkout page
  @javascript @smartStep
  Scenario: I go to checkout page
    Given I wait for 5 seconds
    And I use jquery to click in element "#billing-buttons-container button"
    And I wait for text "Flat Rate" to appear, for 20 seconds
    And I use jquery to click in element "#s_method_flatrate_flatrate"
    And I use jquery to click in element "#shipping-method-buttons-container button"
    Then I wait for text "Credit card" to appear, for 20 seconds

  #I select Mundipagg credit card
  @javascript @smartStep
  Scenario: I select Mundipagg credit card
    Given I wait for 3 seconds
    And I use jquery to click in element "#p_method_paymentmodule_creditcard"
    Then I wait for text "Installments" to appear, for 20 seconds

  #I select Mundipagg boleto
  @javascript @smartStep
  Scenario: I select Mundipagg boleto
    Given I use jquery to click in element "#p_method_paymentmodule_boleto"
    Then I wait for 1 seconds

  #I select Mundipagg boleto credit card
  @javascript @smartStep
  Scenario: I select Mundipagg boleto credit card
    Given I use jquery to click in element "#p_method_paymentmodule_boletocc"
    Then I wait for 1 seconds

  #I fill credit card form data
  @javascript @smartStep
  Scenario: I fill credit card form data
    Given I use jquery to fill element "#paymentmodule_creditcard_creditcard_1_mundicheckout-number" with value "4299742836791151"
    And I use jquery to focus out element "#paymentmodule_creditcard_creditcard_1_mundicheckout-number"
    And I use jquery to set "<option value='12'>12 - December</option>" to element "#paymentmodule_creditcard_creditcard_1_mundicheckout-expmonth" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "#paymentmodule_creditcard_creditcard_1_mundicheckout-expyear" with value "2029"
    And I use jquery to fill element "#paymentmodule_creditcard_creditcard_1_mundicheckout-cvv" with value "123"
    And I use jquery to fill element "#paymentmodule_creditcard_creditcard_1_mundicheckout-holdername" with value "Test Name"
    And I use jquery to fill element "#paymentmodule_creditcard_creditcard_1_mundicheckout-creditCard-installments" with value "1"
    And I use jquery to click in element "#payment-buttons-container button"

  #I fill boleto credit card form data
  @javascript @smartStep
  Scenario: I fill boleto credit card form data
    Given I use jquery to fill element "#paymentmodule_boletocc_creditcard_1_mundicheckout-number" with value "4299742836791151"
    And I use jquery to focus out element "#paymentmodule_boletocc_creditcard_1_mundicheckout-number"
    And I use jquery to set "<option value='12'>12 - December</option>" to element "#paymentmodule_boletocc_creditcard_1_mundicheckout-expmonth" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "#paymentmodule_boletocc_creditcard_1_mundicheckout-expyear" with value "2029"
    And I use jquery to fill element "#paymentmodule_boletocc_creditcard_1_mundicheckout-cvv" with value "123"
    And I use jquery to fill element "#paymentmodule_boletocc_creditcard_1_mundicheckout-holdername" with value "Test Name"
    And I use jquery to fill element "#paymentmodule_boletocc_creditcard_1_mundicheckout-creditCard-installments" with value "1"
    And I wait for 4 seconds
    And I use jquery to click in element "#payment-buttons-container button"

  #I click in boleto credit card place order button
  @javascript @smartStep
  Scenario: I click in boleto credit card place order button
    Given I wait for 1 seconds
    And I use jquery to click in element "#payment-buttons-container button"
    And I wait for text "QTY" to appear, for 20 seconds
    And I use jquery to click in element ".button.btn-checkout"

  #I click in credit card place order button
  @javascript @smartStep
  Scenario: I click in credit card place order button
    Given I use jquery to click in element "#payment-buttons-container button"
    And I wait for 1 seconds
    And I wait for text "Subtotal" to appear, for 20 seconds
    And I use jquery to click in element ".button.btn-checkout"

  #I check if card brand is selected
  @javascript @smartStep
  Scenario: I check if card brand is selected
    And I wait for 1 seconds
    #Given I check if card brand is selected in element ".visa"

  #I click in boleto place order button
  @javascript @smartStep
  Scenario: I click in boleto place order button
    Given I wait for 1 seconds
    And I wait for text "Subtotal" to appear, for 20 seconds
    And I use jquery to click in element ".button.btn-checkout"

  @javascript @smartStep
  Scenario: I check order creation
    Given I wait for 2 seconds
    And I wait for text "THANK YOU " to appear, for 30 seconds

  #I check if error was dispatched
  @javascript @smartStep
  Scenario: I check if error was dispatched
    Given I wait for 5 seconds
    And I wait for text "invalid" to appear, for 20 seconds

  #I go to registration page
  @javascript @smartStep
  Scenario: I go to registration page
    Given I am on "/customer/account/create/"
    And I wait for text "Create An Account" to appear, for 20 seconds

  #I fill the registration form
  @javascript @smartStep
  Scenario: I fill the registration form
    Given I use jquery to fill element "input[name='firstname']" with value "Test"
    And I use jquery to fill element "input[name='lastname']" with value "Test"
    And I use jquery to fill element "#taxvat" with value "16674352306"
    And I use jquery to fill element "#email_address" with a random email
    And I use jquery to fill element "#password" with value "@teste123"
    And I use jquery to fill element "input[name='confirmation']" with value "@teste123"
    And I use jquery to click in element "button[title='Register']"
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
    And I use jquery to set "<option value='485'>Rio de Janeiro</option>" to element "#region_id" with value "485"
    And I use jquery to click in element "button[title='Save Address']"
    And I wait for text "The address has been saved" to appear, for 20 seconds

  #I go to shipping page
  @javascript @smartStep
  Scenario: I go to shipping page
    Given I select the same shipping address

  #I select the same shipping address
  @javascript @smartStep
  Scenario: I select the same shipping address
    Given I am on "/checkout/#shipping"
    And I wait for 3 seconds
    And I use jquery to click in element "#billing-buttons-container button"
    And I wait for 3 seconds
    And I use jquery to click in element ".button.validation-passed"
    And I wait for text "Flat" to appear, for 25 seconds
    And I use jquery to click in element "#s_method_flatrate_flatrate"
    And I wait for 5 seconds
    And I use jquery to click in element "#shipping-method-buttons-container button"
    And I wait for 5 seconds

  #I select the saved card option
  @javascript @smartStep
  Scenario: I select the saved card option
    Given I use jquery to click on element "#paymentmodule_creditcard_creditcard_1_mundicheckout-save-credit-card"

  #I select a installment option
  @javascript @smartStep
  Scenario: I select a installment option
    Given I use jquery to fill element "#paymentmodule_creditcard_creditcard_1_mundicheckout-creditCard-installments" with value "1"
    And I wait for 1 seconds

  #I check the boleto print button
  @javascript @smartStep
  Scenario: I check the boleto print button
    And I wait for text "Click here to show your billet" to appear, for 30 seconds

  #I click in go to order review button
  @javascript @smartStep
  Scenario: I click in go to order review button
    Given I use jquery to click in element "#payment-buttons-container button"

  #Do not remove this
  #I finish
  @javascript @smartStep
  Scenario: I finish
    Given I wait for 1 seconds
    And I wait for 1 seconds