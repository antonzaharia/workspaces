Feature: Add member to workspace
  As a Workspace owner/admin I should be able to add new members

  @lvh @javascript
  Scenario: Add member
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
