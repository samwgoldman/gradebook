Feature: User can edit an evaluation
  In order to change my evaluations
  As a user
  I want to be able to edit evaluations

  Background:
    Given an evaluation exists with name: "The Personality Defect Test"
    And   a criterion exists with prompt: "What is your quest?", position: 2, evaluation: the evaluation
    And   a criterion exists with prompt: "What is your favorite color?", position: 1, evaluation: the evaluation
    And   an alternative exists with label: "To seek the grail", position: 1, criterion: the 1st criterion
    And   an alternative exists with label: "Red", position: 2, criterion: the 2nd criterion
    And   an alternative exists with label: "Blue", position: 1, criterion: the 2nd criterion
    When  I am on the evaluation's edit page

  Scenario: User sees the header for the page
    Then  the page title should be "Editing The Personality Defect Test"

  Scenario: User can cancel update
    When  I follow "Cancel"
    Then  I should be on the evaluations page
    And   I should not see "Evaluation updated successfully"

  Scenario: User is notified of failed update
    When  I fill in "Name" with ""
    And   I press "Save Evaluation"
    Then  I should see "Evaluation could not be updated due to errors."

  Scenario: User can change evaluation name
    When  I fill in "Name" with "The Commonly Confused Words Test"
    And   I press "Save Evaluation"
    Then  I should see "Evaluation updated successfully"
    And   an evaluation should exist with name: "The Commonly Confused Words Test"
    And   an evaluation should not exist with name: "The Personality Defect Test"

  Scenario: User can change existing criterion's prompt
    When  I change "What is your quest?" to "What is your name?"
    And   I press "Save Evaluation"
    Then  a criterion should exist with prompt: "What is your name?", evaluation: the evaluation
    And   a criterion should not exist with prompt: "What is your quest?"

  @javascript
  Scenario: User can add criteria
    When  I add a criterion "What is your name?"
    And   I add an alternative "None of your business."
    And   I press "Save Evaluation"
    Then  a criterion should exist with prompt: "What is your name?", evaluation: the evaluation
    And   an alternative should exist with label: "None of your business.", criterion: the criterion

  @javascript
  Scenario: User can remove criteria
    When  I remove the criterion "What is your quest?"
    And   I press "Save Evaluation"
    Then  a criterion should not exist with prompt: "What is your quest?"
    And   an alternative should not exist with label: "To seek the grail"

  @javascript
  Scenario: User can add alternatives
    When  I add an alternative "Purple"
    And   I press "Save Evaluation"
    Then  an alternative should exist with label: "Purple"

  @javascript
  Scenario: User can remove alternatives
    When  I remove the alternative "Red"
    And   I press "Save Evaluation"
    Then  an alternative should not exist with label: "Red"

  Scenario: Fields are rendered in correct order
    Then  The criterion "What is your favorite color?" should appear before "What is your quest?"
    And   The alternative "Red" should appear before "Blue"
