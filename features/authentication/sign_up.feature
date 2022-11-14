Feature: User sign in
  As a User I should be able to sign in

@lvh @javascript
  Scenario: Sign up
    When I visit "/users/sign_up"
    And I fill in the following form details safely:
      | user_email                 | test@test.com |
      | user_password              | password!     |
      | user_password_confirmation | password!     |
    And I click on the selector "input[type=submit]" from the container ".actions"

    And binding.pry