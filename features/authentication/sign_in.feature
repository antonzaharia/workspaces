Feature: User sign up
  As a User I should be able to sign up

  Scenario: Sign up
    When I visit "/users/sign_up"
    And I fill in "(.+)" with ""