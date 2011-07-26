Feature: People can sign up
  In order to create and own data
  As a person
  I want to become a user

  Scenario: Person can register their e-mail and password
    Given I am on the registration page
    When  I fill in "Email" with "test@example.com"
    And   I fill in "Password" with "password"
    And   I fill in "Password confirmation" with "password"
    And   I press "Sign up"
    Then  a user should exist with email: "test@example.com"

  Scenario: Registered person can sign in
    Given a user exists with email: "test@example.com", password: "password"
    When  I am on the sign in page
    And   I fill in "Email" with "test@example.com"
    And   I fill in "Password" with "password"
    And   I press "Sign in"
    Then  I should be on the home page
