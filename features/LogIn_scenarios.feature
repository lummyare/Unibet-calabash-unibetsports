@login
Feature: App Login

  Background:
    Given I set location to london

@invalid_login
  Scenario: Invalid Login credentials
    Given I land on Login screen
    And I enter an invalid login credentials
    And I click log in button
    Then invalid username and password message should be visible


 @no_password
  Scenario: Enter Username without the Password
   Given I land on Login screen
   And I enter a username without password
   And I click log in button
   Then the Log in button should be disabled

 @valid_login
  Scenario: Enter valid login credentials
    Given I land on Login screen
    And I enter an valid login credentials
    And I click log in button
    Then Log in should be successful

  @forgot_password
  Scenario:
    Given i forgot my password
    And I click the Forgot button
    Then I navigate to Get new password page
    When I click back button
    Then I should navigate back to log in page

  @new_user
  Scenario: New User registration
    Given I am a new user
    And I click on Register button
    Then I should land on Registration Screen
    When I click the close button
    Then I should go back to Log in Screen


