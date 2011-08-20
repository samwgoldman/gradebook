Feature: User can drag and drop criteria/alternatives to reorder
  In order to update the order of my evaluation's criteria
  As a user
  I want to by able to set the position of my critera and alternatives

  Background:
    Given an evaluation exists with name: "The Personality Defect Test"

  Scenario: User can swap positions for two criteria
    Given a criterion exists with prompt: "What is your quest?", position: 1, evaluation: the evaluation
    And   a criterion exists with prompt: "What is your favorite color?", position: 2, evaluation: the evaluation
    And   I am on the evaluation's edit page
    Then  the criterion "What is your quest?" should appear before "What is your favorite color?"
    When  I change "2" to "1"
    And   I change "1" to "2"
    And   I press "Save Evaluation"
    Then  I should see "Evaluation updated successfully"
    And   a criterion should exist with prompt: "What is your favorite color?", position: 1, evaluation: the evaluation
    And   a criterion should exist with prompt: "What is your quest?", position: 2, evaluation: the evaluation
    When  I am on the evaluation's edit page
    Then  the criterion "What is your favorite color?" should appear before "What is your quest?"

  Scenario: User can swap positions for two alternatives
    Given a criterion exists with prompt: "What is your favorite color?", evaluation: the evaluation
    And   an alternative exists with label: "Red", position: 1, criterion: the criterion
    And   an alternative exists with label: "Blue", position: 2, criterion: the criterion
    And   an alternative exists with label: "Green", position: 3, criterion: the criterion
    And   I am on the evaluation's edit page
    Then  the alternative "Blue" should appear before "Green"
    When  I change "3" to "2"
    And   I change "2" to "3"
    And   I press "Save Evaluation"
    Then  I should see "Evaluation updated successfully"
    And   an alternative should exist with label: "Green", position: 2, criterion: the criterion
    And   an alternative should exist with label: "Blue", position: 3, criterion: the criterion
    When  I am on the evaluation's edit page
    Then  the alternative "Green" should appear before "Blue"
