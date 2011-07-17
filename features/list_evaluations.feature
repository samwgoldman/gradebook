Feature: User can list evaluations
  In order to find my evaluations
  As a user
  I want to view a list of my evaluations
  
  Scenario: User sees the header for the page
    When  I am on the evaluations page
    Then  I should see "Evaluations"

  Scenario: User is prompted to create new evaluation if none exist
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

  Scenario: User can navigate to the new evaluation page
    When  I am on the evaluations page
    When  I follow "Create an evaluation"
    Then  I should be on the new evaluation page

  Scenario: User can navigate to the evaluation show page
    Given the following evaluations exist:
      | name                             |
      | The Personality Defect Test      |
    When  I am on the evaluations page
    And   I follow "The Personality Defect Test"
    Then  I should be on the evaluation page for "The Personality Defect Test"
