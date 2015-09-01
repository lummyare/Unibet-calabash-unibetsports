@tests
Feature: Home

  @test1
  Scenario: Unpaired to grid view
    Given I am on Youview Setup page
    And I skip Enter Connection Code screen
    Then I should see the Guide screen
    When I select a channel
    Then I wait for the selected channel to show

  @test2
  Scenario: Connect to youview with wrong connection code
    Given I am on Youview Setup page
    Then I wait for Enter Connection Code to appear
    And select Enter Connection Code text
    When I enter wrong connection code
    And select Next button on Enter connection code
    Then I wait for connection to fail


  @test3
  Scenario: Connect to youview with correct connection code
    Given I am on Youview Setup page
    Then I wait for Enter Connection Code to appear
    And select Enter Connection Code text
    When I enter connection code
    And select Next button on Enter connection code
    Then I wait for successful connection


