Feature: User sign in
  As a User I should be able to sign in

@lvh @javascript
  Scenario: Sign up
    When I visit "/users/sign_up"
    Given a user exists with the following attributes:
      | email                 | existing@test.com |
      | password              | password!         |
      | password_confirmation | password!         |
    And I fill in the following form details safely:
      | user_email                 | test@test.com |
      | user_password              | password!     |
      | user_password_confirmation | password1     |
    And I click on the selector "input[type=submit]" from the container ".actions"
    And I should see the selector "li" from the container "#error_explanation" with text "Password confirmation doesn't match Password"
    And I fill in the following form details safely:
      | user_email                 | existing@test.com |
      | user_password              | password!         |
      | user_password_confirmation | password!         |
    And I click on the selector "input[type=submit]" from the container ".actions"
    And I should see the selector "li" from the container "#error_explanation" with text "Email has already been taken"
    And I fill in the following form details safely:
      | user_email                 | test@test.com |
      | user_password              | password!     |
      | user_password_confirmation | password!     |
    And I click on the selector "input[type=submit]" from the container ".actions"
    And I should see toast "Welcome! You have signed up successfully."
    Then "test@test.com" should receive an email
