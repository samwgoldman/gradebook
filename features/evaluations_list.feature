Feature: User can list evaluations
  In order to find evaluations
  As a user
  I want to view a list of evaluations
  
  Scenario: User sees the header for the page
    When  I am on the evaluations page
    Then  the page title should be "Evaluations"

  Scenario: User is prompted to create an evaluation if none exist
    When  I am on the evaluations page
    Then  I should see "You have no evaluations."
    And   I should see "Create an evaluation"

  Scenario: User is shown list of existing evaluations
    Given the following evaluations exist:
      | name                             |
      | The Personality Defect Test      |
      | The Commonly Confused Words Test |
      | The Nerd? Geek? or Dork? Test    |
    When  I am on the evaluations page
    Then  I should not see "You have no evaluations."
    And   I should see "The Personality Defect Test"
    And   I should see "The Commonly Confused Words Test"
    And   I should see "The Nerd? Geek? or Dork? Test"
    And   I should see "Create an evaluation"

  Scenario: User can navigate to create an evaluation
    When  I am on the evaluations page
    When  I follow "Create an evaluation"
    Then  I should be on the new evaluation page

  Scenario: User can navigate to view an evaluation
    Given the following evaluations exist:
      | name                             |
      | The Personality Defect Test      |
    When  I am on the evaluations page
    And   I follow "The Personality Defect Test"
    Then  I should be on the evaluation page for "The Personality Defect Test"

  Scenario: User can navigate to edit an evaluation
    Given the following evaluations exist:
      | name                        |
      | The Personality Defect Test |
    When  I am on the evaluations page
    And   I follow "Edit Evaluation"
    Then  I should be on the edit evaluation page for "The Personality Defect Test"
