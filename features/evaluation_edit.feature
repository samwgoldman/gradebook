Feature: User can edit an evaluation
  In order to change my evaluations
  As a user
  I want to be able to edit evaluations

  Background:
    Given an evaluation exists with name: "The Personality Defect Test"
    And   a criterion exists with prompt: "What is your quest?", evaluation: the evaluation
    And   a criterion exists with prompt: "What is your favorite color?", evaluation: the evaluation
    And   an alternative exists with label: "To seek the grail", criterion: the 1st criterion
    And   an alternative exists with label: "Red", criterion: the 2nd criterion
    And   an alternative exists with label: "Blue", criterion: the 2nd criterion
    When  I am on the edit evaluation page for "The Personality Defect Test"

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
    When  I go to the evaluations page
    Then  I should see "The Commonly Confused Words Test"
    And   I should not see "The Personality Defect Test"

  Scenario: User can change existing criterion's prompt
    When  I change "What is your quest?" to "What is your name?"
    And   I press "Save Evaluation"
    And   I go to the evaluation page for "The Personality Defect Test"
    Then  I should see "What is your name?"
    And   I should not see "What is your quest?"

  @javascript
  Scenario: User can add criteria
    When  I add a criterion "What is your name?"
    And   I press "Save Evaluation"
    And   I go to the evaluation page for "The Personality Defect Test"
    Then  I should see "What is your name?"

  @javascript
  Scenario: User can remove criteria
    When  I remove the criterion "What is your quest?"
    And   I press "Save Evaluation"
    And   I go to the evaluation page for "The Personality Defect Test"
    Then  I should not see "What is your quest?"
    And   I should not see "To seek the grail"

  @javascript
  Scenario: User can add alternatives
    When  I add an alternative "Purple"
    And   I press "Save Evaluation"
    And   I go to the evaluation page for "The Personality Defect Test"
    Then  I should see "Purple"

  @javascript
  Scenario: User can remove alternatives
    When  I remove the alternative "Red"
    And   I press "Save Evaluation"
    And   I go to the evaluation page for "The Personality Defect Test"
    Then  I should not see "Red"
