Feature: User can view an evaluation
  In order to learn about an evaluation
  As a user
  I want to be able to view one of his or her evaluations

  Background:
    Given an evaluation exists with name: "The Personality Defect Test"
    And   a criterion exists with prompt: "What is your quest?", evaluation: the evaluation
    And   a criterion exists with prompt: "What is your favorite color?", evaluation: the evaluation
    And   an alternative exists with label: "To seek the grail", criterion: the 1st criterion
    And   an alternative exists with label: "Red", criterion: the 2nd criterion
    And   an alternative exists with label: "Blue", criterion: the 2nd criterion
    When  I am on the evaluation page for "The Personality Defect Test"

  Scenario: User can see information about an evaluation
    Then  the page title should be "The Personality Defect Test"
    And   I should see "What is your quest?"
    And   I should see "To seek the grail"
    And   I should see "What is your favorite color?"
    And   I should see "Red"
    And   I should see "Blue"

  Scenario: User can navigate to edit the evaluation
    When  I follow "Edit Evaluation"
    Then  I should be on the edit evaluation page for "The Personality Defect Test"

  Scenario: User can navigate back to list evaluations
    When  I follow "Back to Evaluations"
    Then  I should be on the evaluations page
