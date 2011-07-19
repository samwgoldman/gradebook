Feature: User can edit an evaluation
  In order to change my evaluations
  As a user
  I want to be able to edit evaluations

  Background:
    Given an evaluation "eval" exists with name: "The Personality Defect Test"
    And   a criterion exists with prompt: "What is your quest?", evaluation: evaluation "eval"
    When  I am on the edit evaluation page for "The Personality Defect Test"

  Scenario: User can update evaluation name
    When  I fill in "Name" with "The Commonly Confused Words Test"
    And   I press "Save Evaluation"
    Then  I should be on the evaluations page
    And   I should see "Evaluation updated successfully"
    And   I should see "The Commonly Confused Words Test"
    And   I should not see "The Personality Defect Test"

  Scenario: User can update existing criterion
    When  I fill in "Prompt" with "What is your favorite color?"
    And   I press "Save Evaluation"
    Then  I should see "Evaluation updated successfully"

  @javascript
  Scenario: User can add criteria
    When  I add a criterion with prompt "What is your favorite color?"
    And   I press "Save Evaluation"
    Then  I should see "Evaluation updated successfully"
    When  I go to the evaluation page for "The Personality Defect Test"
    Then  I should see "What is your favorite color?"

  Scenario: User can remove criteria
    When  I remove the criterion with prompt "What is your quest?"
    And   I press "Save Evaluation"
    Then  I should see "Evaluation updated successfully"
    When  I go to the evaluation page for "The Personality Defect Test"
    Then  I should not see "What is your quest?"

  Scenario: User can see feedback on invalid submissions
    When  I fill in "Name" with ""
    And   I press "Save Evaluation"
    Then  I should see "Evaluation could not be updated due to errors."

  Scenario: User can cancel update
    When  I follow "Cancel"
    Then  I should be on the evaluations page
    And   I should not see "Evaluation updated successfully"
