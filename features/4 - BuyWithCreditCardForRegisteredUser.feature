Feature: Create order with credit card for a registered user

  Background:
    Given a new session
    And I define failure screenshot dir as "./failureScreenshots"

  @javascript
  Scenario: I create a credit card order for a registered user, save the credit card and use it
    #I create a new user
    Given I wait for 1 seconds
    And I am on "/index.php"
    And I wait for 2 seconds
    Given I am on "/index.php/customer/account/create/"
    And I wait for text "Create New Customer Account" to appear, for 20 seconds
    Given I use jquery to fill element "input[name='firstname']" with value "Test"
    And I use jquery to fill element "input[name='lastname']" with value "Test"
    And I use jquery to fill element "#taxvat" with value "16674352306"
    And I use jquery to fill element "#email_address" with a random email
    And I use jquery to fill element "#password" with value "@teste123"
    And I use jquery to fill element "#password-confirmation" with value "@teste123"
    And I use jquery to click on element "button[title='Create an Account']"
    And I wait for text "Thank you for registering" to appear, for 240 seconds
    And I wait for 5 seconds
    And I follow "Address Book"
    And I wait for text "Add New Address" to appear, for 20 seconds
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
    And I use jquery to click on element "button[title='Save Address']"
    And I wait for text "You Saved The Address" to appear, for 20 seconds

    Given I wait for 1 seconds
    And I am on "/fusion-backpack.html"
    And I wait for text "add to cart" to appear, for 10 seconds
    And I click in element "#product-addtocart-button"
    And I wait for text "added" to appear, for 10 seconds
    Then I wait for 3 seconds

    Given I am on "/checkout/#shipping"
    And I wait for text "Flat Rate" to appear, for 20 seconds
    And I use jquery to click on element "input[name='ko_unique_1']"
    And I use jquery to click on element ".continue"
    And I wait for 10 seconds

    Given I wait for 5 seconds
    And I use jquery to click on element "#mundipagg_creditcard"
    And I check if element "#mundipagg_creditcard-submit" exists

    Given I use jquery to click on element ".save_this_card"

    Given I use jquery to fill element "input[name='payment[cc_number]']" with value "4000000000000010"
    And I use jquery to fill element "input[name='payment[cc_owner]']" with value "Test Name"
    And I use jquery to set "<option value='12'>12 - December</option>" to element "select[name='payment[cc_exp_month]']" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "select[name='payment[cc_exp_year]']" with value "2029"
    And I use jquery to set "<option value='2' interest='0'>2x of $32.00 without interest (Total: $64.00)</option>" to element "select[name='payment[cc_installments]']" with value "2"
    And I use jquery to fill element "input[name='payment[cc_cid]']" with value "123"
    Then I wait for 3 seconds
    Given I check if card brand is selected in element ".brands.visa"

    Given I wait for 2 seconds
    And I use jquery to click on element "#mundipagg_creditcard-submit"
    And I wait for 5 seconds
    Given I wait for 20 seconds
    And I wait for text "Thank you for your purchase" to appear, for 30 seconds

    Given I wait for 1 seconds
    And I am on "/fusion-backpack.html"
    And I wait for text "add to cart" to appear, for 10 seconds
    And I click in element "#product-addtocart-button"
    And I wait for text "added" to appear, for 10 seconds
    Then I wait for 3 seconds

    Given I am on "/checkout/#shipping"
    And I wait for text "Flat Rate" to appear, for 20 seconds
    And I use jquery to click on element "input[name='ko_unique_1']"
    And I use jquery to click on element ".continue"
    And I wait for 10 seconds

    Given I wait for 5 seconds
    And I use jquery to click on element "#mundipagg_creditcard"
    And I check if element "#mundipagg_creditcard-submit" exists

    Given I use jquery to set "<option value='1' interest='0'>1x of $64.00 without interest (Total: $64.00)</option>" to element "select[name='payment[cc_installments]']" with value "1"
    And I wait for 1 seconds

    Given I wait for 2 seconds
    And I use jquery to click on element "#mundipagg_creditcard-submit"
    And I wait for 5 seconds
    Given I wait for 20 seconds
    And I wait for text "Thank you for your purchase" to appear, for 30 seconds




