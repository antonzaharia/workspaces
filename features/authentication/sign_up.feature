Feature: User sign in
  As a User I should be able to sign in

  Scenario: Sign up
    When I visit "/users/sign_in"
    And I fill in the following form details safely:
      | user_email                 | test@test.com |
      | user_password              | password!     |
      | user_password_confirmation | password!     |
    And I click "Sign up"
    And binding.pry