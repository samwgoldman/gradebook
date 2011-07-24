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

  @javascript
  Scenario: User can add criteria
    When  I fill in "Name" with "The Personality Defect Test"
    And   I add a criterion "What is your quest?"
    And   I add an alternative "To seek the grail"
    And   I add a criterion "What is your favorite color?"
    And   I add an alternative "Red"
    And   I add an alternative "No, blue!"
    And   I press "Save Evaluation"
    Then  I should see "Evaluation saved successfully."
    And   the evaluation should exist with name: "The Personality Defect Test"
    And   a criterion should exist with prompt: "What is your quest?", evaluation: the evaluation
    And   a criterion should exist with prompt: "What is your favorite color?", evaluation: the evaluation
    And   an alternative should exist with label: "To seek the grail", criterion: the 1st criterion
    And   an alternative should exist with label: "Red", criterion: the 2nd criterion
    And   an alternative should exist with label: "No, blue!", criterion: the 2nd criterion

  @javascript
  Scenario: User can remove criteria
    When  I fill in "Name" with "The Personality Defect Test"
    And   I add a criterion "What is your favorite color?"
    And   I add an alternative "Red"
    And   I add an alternative "No, blue!"
    And   I remove the criterion "What is your favorite color?"
    And   I press "Save Evaluation"
    Then  the evaluation should exist with name: "The Personality Defect Test"
    And   a criterion should not exist with prompt: "What is your favorite color?"
    And   an alternative should not exist with label: "Red"
    And   an alternative should not exist with label: "No, blue!"
