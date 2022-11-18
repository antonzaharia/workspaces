Feature: User sign in
  As a User I should be able to sign in

  @lvh @javascript
  Scenario: Sign in
    Given a user exists with the following attributes:
      | email                 | test@test.com |
      | password              | password!     |
      | password_confirmation | password!     |
    When I visit "/users/sign_in"
    And I fill in the following form details safely:
      | user_email    | test@test.com |
      | user_password | password      |
    And I click on the selector "input[type=submit]" from the container ".actions"
    And I should see toast "Invalid Email or password"
    And I fill in the following form details safely:
      | user_email    | test@test.com |
      | user_password | password!     |
    And I check the checkbox "Remember me"
    And I click on the selector "input[type=submit]" from the container ".actions"
    And I should see toast "Signed in successfully."