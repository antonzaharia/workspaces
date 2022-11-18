Feature: User sign in
  As a User I should be able to sign in

  @lvh @javascript
  Scenario: Sign in
    Given I am logged in as:
      | user_email    | test@test.com |
      | user_password | password!     |
    And binding.pry