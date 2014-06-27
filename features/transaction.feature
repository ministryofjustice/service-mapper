Feature: Managing transactions
  As an product owners
  I want to be able to add transactions
  So that I can document the transactions we support

  Scenario: Adding a valid transaction
    Given I am logged in as editor
    When I go to /
    And I follow "Add a new transaction"
    And I fill in "Transaction name" with "Test transaction"
    And I choose "LIVE"
    And I press "Save"
    Then I should see the text "Transaction added"
    And I should see the text "Test transaction"
    And I should see the text "live"