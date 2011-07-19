Feature: User can create an evaluation
  In order to make new evaluations
  As a user
  I want to be able to create an evaluation

  Background:
    When  I am on the new evaluation page

  Scenario: User sees the header for the page
    Then  the page title should be "Create an Evaluation"

  Scenario: User can cancel creation
    When  I follow "Cancel"
    Then  I should be on the evaluations page
    And   I should not see "Evaluation saved successfully"

  Scenario: User is notified of failed update
    When  I press "Save Evaluation"
    Then  I should see "Evaluation could not be saved due to errors."

  Scenario: User can create an evaluation
    When  I fill in "Name" with "The Personality Defect Test"
    And   I press "Save Evaluation"
    Then  I should see "Evaluation saved successfully."
    When  I go to the evaluations page
    Then  I should see "The Personality Defect Test"

  @javascript
  Scenario: User can add criteria
    When  I fill in "Name" with "The Personality Defect Test"
    And   I add a criterion with prompt "What is your favorite color?"
    And   I press "Save Evaluation"
    And   I go to the evaluation page for "The Personality Defect Test"
    Then  I should see "What is your favorite color?"

  @javascript
  Scenario: User can add and remove criteria
    When  I fill in "Name" with "The Personality Defect Test"
    And   I add and remove a criterion with prompt "What is your favorite color?"
    And   I press "Save Evaluation"
    And   I go to the evaluation page for "The Personality Defect Test"
    Then  I should not see "What is your favorite color?"
