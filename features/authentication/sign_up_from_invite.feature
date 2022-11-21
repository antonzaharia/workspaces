Feature: User sign in from invite
  As a User I should be able to sign in from an invite received

  @lvh @javascript
  Scenario: Sign up
    Given I am logged in as:
      | user_email    | test@test.com |
      | user_password | password!     |
    Given the user "test@test.com" has a workspace with the following attributes:
      | slug | company |
    And I visit "/dashboard"
    And I click "Company Name"
    And I click "Add member"
    And I click "Send"
    And I should see the selector "span" from the container ".contents" with text "Email can't be blank"
    When I fill in "workspace_user_email" with "member@test.com"
    And I click "Send"
    And I should see the selector ".font-bold" from the container "#workspace_user_1" with text "member@test.com"
    And I should see the selector ".pending" from the container "#workspace_user_1" with text "pending"
    Then I fill in "workspace_user_email" with "member@test.com"
    And I click "Send"
    And I should see the selector "span" from the container ".alert" with text "User already invited."
    Then I sign out from workspace
    And I should see toast "Signed out successfully."
    And "member@test.com" open the email with subject "You've been invited to GOOFF!"
    And I open the email
    And I click the first link in the email
    And I fill in the following form details safely:
      | user_password              | password! |
      | user_password_confirmation | password! |
    And I click on the selector "input[type=submit]" from the container ".actions"
    And I should see the selector "h5" from the container "#workspace_users_index" with text "Company Name"
