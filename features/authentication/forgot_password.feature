Feature: Forgot password flow
  As a User I should be able reset my password

  @lvh @javascript
  Scenario: Forgot password
    Given a user exists with the following attributes:
      | email                 | test@test.com |
      | password              | password!     |
      | password_confirmation | password!     |
    When I visit "/users/password/new"
    And I fill in the following form details safely:
      | user_email | test@test.com |
    And I click on the selector "input[type=submit]" from the container ".actions"
    And I should see toast "You will receive an email with instructions on how to reset your password in a few minutes."
    And "test@test.com" open the email with text "Someone has requested a link to change your password."
    And I open the email
    And I click the first link in the email
    And I fill in the following form details safely:
      | user_password              | password2 |
      | user_password_confirmation | password2 |
    And I click on the selector "input[type=submit]" from the container ".actions"
    And I should see toast "Your password has been changed successfully. You are now signed in."
    Then the password "password2" is valid for user "test@test.com"