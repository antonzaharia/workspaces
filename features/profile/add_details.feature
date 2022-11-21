Feature: Edit profile details
  As a User I should be able to edit my profile details

  @lvh @javascript
  Scenario: Edit profile
    Given I am logged in as:
      | user_email    | test@test.com |
      | user_password | password!     |
    Then I open the nav dropdown
    And I click "Profile"
    And I attach file "huge_file.jpg" to input "user[icon]"
    And I click "Save"
    And I should see the selector ".error" with text "Icon is too big"
    And I attach file "image.png" to input "user[icon]"
    And I click "Save"
    And I should see toast "Profile pic updated."

    And I click "Edit personal details"
    And I fill in the following form details safely:
      | user_name | Antonel |
    When I fill in "user_dob" with "01-01-2014"
    And I click "Save"
    And I should see the selector "td" with text "Antonel"

    And I click "Edit secured details"
    And I fill in the following form details safely:
      | user_email            | caca@test.com |
      | user_current_password | password!     |
    And I click "Save"
    And I should see toast "Your account has been updated successfully."

    Then the user "caca@test.com" has the following attributes:
      | name | Antonel |
