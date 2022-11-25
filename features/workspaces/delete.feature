Feature: User sign in from invite
  As a User I should be able to sign in from an invite received

  @lvh @javascript
  Scenario: Sign up
    Given I am logged in as:
      | user_email    | test@test.com |
      | user_password | password!     |
    Given the user "test@test.com" has a workspace with the following attributes:
      | slug | company |
    Given the user "test@test.com" has a workspace with the following attributes:
      | name | Another |
      | slug | another |
    Given the workspace "another" members with the following attributes:
      | email | member3@test.com |
    Given the workspace "company" members with the following attributes:
      | email | member@test.com |
    Given the workspace "company" members with the following attributes:
      | email | member2@test.com |
    And I visit "/dashboard"
    And I click "Company Name"
    Then I open the nav dropdown
    And I click "Workspace settings"
    And I click "Delete workspace"
    And I click "Confirm"
    Then all the member invites should be destroyed along with the workspace