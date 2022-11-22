Feature: Delete profile
  As a User I should be able to delete my profile

  @lvh @javascript
  Scenario: Delete profile
    Given I am logged in as:
      | user_email    | test@test.com |
      | user_password | password!     |
    Then I open the nav dropdown
    And I click "Profile"
    And I click "Delete your account"
    And I click "Confirm"
    Then I should see toast "Bye! Your account has been successfully cancelled. We hope to see you again soon."
