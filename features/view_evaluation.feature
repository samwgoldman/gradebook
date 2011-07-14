Feature: User can view an evaluation
  In order to learn about an evaluation
  As a user
  I want to be able to view one of his or her evaluations

  Background:
    Given the following evaluation exists:
      | name                        |
      | The Personality Defect Test |
    When  I am on the evaluation page for "The Personality Defect Test"

  Scenario: User can see information about an evaluation
    Then  I should see "The Personality Defect Test"

  Scenario: User can navigate back to the evaluations index page
    When  I follow "Back to Evaluations"
    Then  I should be on the evaluations page
