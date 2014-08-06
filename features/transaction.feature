Feature: Managing transactions
  As an product owners
  I want to be able to add transactions
  So that I can document the transactions we support

  Scenario: Adding a valid transaction
    Given I am logged in as editor
    And I have a group called "My Group"
    When I go to /stories
    And I follow "Add a new transaction"
    And I fill in "Transaction name" with "Test transaction"
    And I choose "LIVE"
    And I select "My Group" from "Groups"
    And I fill in "Name" with "Contact name"
    And I fill in "Email" with "Contact email"
    And I fill in "Department and team" with "Contact Team"
    And I press "Save"
    Then I should see the text "Transaction added"
    And I should see the text "Test transaction"
    And I should see the text "live"
    And I should see the text "My Group"
    And I should see the text "Contact name"
    And I should see the text "Contact email"
    And I should see the text "Contact Team"

  Scenario: Editing a valid transaction
    Given I am logged in as editor
    And I have a transaction called "Test transaction"
    When I go to /stories
    And I follow "Test transaction"
    And I follow "Edit"
    And I fill in "Transaction name" with "My Test Transaction"
    And I press "Save"
    Then I should see the text "Transaction saved"
    And I should see the text "My Test Transaction"

  Scenario: Adding a valid transaction
    Given I am logged in as editor
    And I have a transaction called "Test transaction"
    When I go to /stories
    And I follow "Test transaction"
    And I follow "Edit"
    And I press "Delete"
    Then I should see the text "Transaction deleted"
    And I should not see the text "Test Transaction"
