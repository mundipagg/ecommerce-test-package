Feature: Create order with two credit card

  Background:
    Given a new session
    And I define failure screenshot dir as "./failureScreenshots"

  @javascript
  Scenario: I create an credit card order
    Given I am on "/fusion-backpack.html"
    And I wait for text "add to cart" to appear, for 10 seconds
    Then I click in element "#product-addtocart-button"
    And I wait for text "added" to appear, for 10 seconds
    Given I am on "/checkout"
    And I wait for text "Email" to appear, for 50 seconds
    And I use jquery to fill element "#customer-email" with a random email
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
    And I use jquery to set "<option selected='selected' data-title='Rio de Janeiro' value='502'>Rio de Janeiro</option>" to element "select[name='region_id']" with value "502"
    And I use jquery to focus in element ".button.action.continue.primary"
    And I use jquery to click in element ".button.action.continue.primary"
    And I wait for text "Mundipagg" to appear, for 10 seconds
    And I use jquery to click in element "#mundipagg_creditcard"
    And I use jquery to fill element "input[name='payment[cc_number]']" with value "4299742836791151"
    And I use jquery to fill element "input[name='payment[cc_owner]']" with value "Test Name"
    And I wait for text "Month" to appear, for 10 seconds
    And I use jquery to set "<option value='12'>12 - December</option>" to element "select[name='payment[cc_exp_month]']" with value "12"
    And I use jquery to set "<option value='2029'>2029</option>" to element "select[name='payment[cc_exp_year]']" with value "2029"
    And I use jquery to fill element "input[name='payment[cc_cid]']" with value "123"
    And I use jquery to set "<option value='2' interest='0'>2x of $32.00 without interest (Total: $64.00)</option>" to element "select[name='payment[cc_installments]']" with value "2"
    And I check if card brand is selected in element ".brands.visa"
    And I use jquery to click in element ".action.primary.checkout"




