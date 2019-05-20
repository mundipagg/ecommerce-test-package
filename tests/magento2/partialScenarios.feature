Feature: Partial Scenarios

  #I go to product page
  @javascript @smartStep
  Scenario: I go to product page
    Given I am on "/fusion-backpack.html"
    Then I wait for text "add to cart" to appear, for 10 seconds

  #I click on add to cart button
  @javascript @smartStep
  Scenario: I click on add to cart button
    Given I click in element "#product-addtocart-button"
    Then I wait for text "added" to appear, for 15 seconds

  #I go to user form page
  @javascript @smartStep
  Scenario: I go to user form page
    Given I am on "/checkout"
    Then I wait for text "Email" to appear, for 10 seconds

  #I fill user form data
  @javascript @smartStep
  Scenario: I fill user form data
    Given I use jquery to fill element "#customer-email" with a random email
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
    And I use jquery to click in element "input[name='ko_unique_1']"
    Then I use jquery to set "<option selected='selected' data-title='Rio de Janeiro' value='502'>Rio de Janeiro</option>" to element "select[name='region_id']" with value "502"

  #I go to checkout page
  @javascript @smartStep
  Scenario: I go to checkout page
    Given I use jquery to click in element ".button.action.continue.primary"
    Then I wait for 3 seconds
    And I wait for text "Mundipagg" to appear, for 10 seconds

  #I select Mundipagg credit card
  @javascript @smartStep
  Scenario: I select Mundipagg credit card
    Given I use jquery to click in element "#mundipagg_creditcard"
    Then I wait for text "Month" to appear, for 10 seconds

  #I fill credit card form data
  @javascript @smartStep
  Scenario: I fill credit card form data
    Given I use jquery to fill element "input[name='payment[cc_number]']" with value "4299742836791151"
    And I use jquery to fill element "input[name='payment[cc_owner]']" with value "Test Name"
    And I wait for text "Month" to appear, for 10 seconds
    And I use jquery to set "<option value='12'>12 - December</option>" to element "select[name='payment[cc_exp_month]']" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "select[name='payment[cc_exp_year]']" with value "2029"
    And I use jquery to fill element "input[name='payment[cc_cid]']" with value "123"
    And I use jquery to set "<option value='2' interest='0'>2x of $32.00 without interest (Total: $64.00)</option>" to element "select[name='payment[cc_installments]']" with value "2"
    Then I wait for 3 seconds

  #I check if card brand is selected
  @javascript @smartStep
  Scenario: I check if card brand is selected
    Given I check if card brand is selected in element ".brands.visa"

  #I click on place order button
  @javascript @smartStep
  Scenario: I click on place order button
    Given I use jquery to click in element ".action.primary.checkout"
    And I wait for 3 seconds
    Then I wait for text "Thank you for your purchase" to appear, for "10" seconds

  #I check if order was created
  #@javascript @smartStep
  #Scenario: I check if order was created
    #Given I wait for text "Thank you for your purchase" to appear, for "10" seconds