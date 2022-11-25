Feature: Workspace create
  As a User I should be able to create a workspace

  @lvh @javascript
  Scenario: Workspace create
    Given I am logged in as:
      | user_email    | test@test.com |
      | user_password | password!     |
    And I click "New Workspace"
    And I fill in the following form details safely:
      | workspace_slug | company |
    And I click "Create"
    And I should see the selector "span" from the container ".alert" with text "Name can't be blank"
    And I fill in the following form details safely:
      | workspace_name | Company |
      | workspace_slug | co      |
    And I click "Create"
    And I should see the selector "span" from the container ".alert" with text "Slug is too short (minimum is 3 characters)"
    And I fill in the following form details safely:
      | workspace_name | Company |
      | workspace_slug | co.cc   |
    And I click "Create"
    And I should see the selector "span" from the container ".alert" with text "Slug can only include letters, numbers, dashes and underscores. No spaces or other punctuation is allowed"
    And I fill in the following form details safely:
      | workspace_name | Company |
      | workspace_slug | company |
    And I click "Create"
    Then I click "Company"
    And I should see the selector "span.logo-text" with text "Company"