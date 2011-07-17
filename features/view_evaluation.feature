Feature: User can view an evaluation
  In order to learn about an evaluation
  As a user
  I want to be able to view one of his or her evaluations

  Background:
    Given an evaluation "eval" exists with name: "The Personality Defect Test"
    And   a criterion exists with prompt: "What is your favorite color?", evaluation: evaluation "eval"
    When  I am on the evaluation page for "The Personality Defect Test"

  Scenario: User can see information about an evaluation
    Then  I should see "The Personality Defect Test"
    And   I should see "What is your favorite color?"

  Scenario: User can navigate back to the evaluations index page
    When  I follow "Back to Evaluations"
    Then  I should be on the evaluations page
