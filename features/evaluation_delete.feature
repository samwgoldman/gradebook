Feature: User can delete evaluations
  In order to remove unwanted evaluations
  As a user
  I want to be able to delete evaluations

  @wip
  Scenario: User can delete evaluations
    Given the following evaluations exist:
      | name                        |
      | The Personality Defect Test |
    And   I am on the evaluations page
    When  I follow "Delete Evaluation"
    Then  I should see "Evaluation deleted successfully"
    And   I should not see "The Personality Defect Test"
