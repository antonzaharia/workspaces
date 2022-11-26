Feature: Delete member from workspace
As a Workspace owner/admin I should be able to delete members

  @lvh @javascript
  Scenario: Delete member
    Given I am logged in as:
      | user_email    | test@test.com |
      | user_password | password!     |
    Given the user "test@test.com" has a workspace with the following attributes:
      | slug | company |
    And I visit "/dashboard"
    And I click "Company Name"
    And I click "Add member"
    When I fill in "workspace_user_email" with "member@test.com"
    And I click "Send"
    And I should see the selector ".font-bold" from the container "#workspace_user_1" with text "member@test.com"
    And I should see the selector ".pending" from the container "#workspace_user_1" with text "pending"
    And I click "Delete"
    Then I should see modal with text "You are about to remove access of member@test.com."
    And I click "Confirm"
    Then the workspace "company" should have "0" members
