Feature: User can view an evaluation
  In order to learn about an evaluation
  As a user
  I want to be able to view one of his or her evaluations

  Background:
    Given an evaluation "The Personality Defect Test" with the following criteria:
      | prompt                       |
      | What is your quest?          |
      | What is your favorite color? |
    When  I am on the evaluation page for "The Personality Defect Test"

  Scenario: User can see information about an evaluation
    Then  the page title should be "The Personality Defect Test"
    And   I should see "What is your quest?"
    And   I should see "What is your favorite color?"

  Scenario: User can navigate to edit the evaluation
    When  I follow "Edit Evaluation"
    Then  I should be on the edit evaluation page for "The Personality Defect Test"

  Scenario: User can navigate back to list evaluations
    When  I follow "Back to Evaluations"
    Then  I should be on the evaluations page
