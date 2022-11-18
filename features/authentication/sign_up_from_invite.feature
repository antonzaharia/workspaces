Feature: User sign in from invite
  As a User I should be able to sign in from an invite received

  @lvh @javascript
  Scenario: Sign up
    When I visit "/users/sign_up"
    And I fill in the following form details safely:
      | user_email                 | test@test.com |
      | user_password              | password1     |
      | user_password_confirmation | password1     |
    And I click on the selector "input[type=submit]" from the container ".actions"
    And "test@test.com" should receive an email