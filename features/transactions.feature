Feature: Viewing Transactions
  As an product owners
  I want to be able to view transactions in many ways
  So that I can get a better understanding of the MOJ landscape

  Scenario: Filtering by Group
    Given I am logged in as editor
    And I have a group called "My Group"
    And I have a transaction called "Transaction in group"
    And I have a transaction called "Transaction not in group"
    And "Transaction in group" is in group "My Group"
    When I go to /stories
    Then I should see the text "Transaction in group"
    And I should see the text "Transaction not in group"
    When I select "My Group" from "Filter"
    And I press "Filter"
    Then I should see the text "Transaction in group"
    And I should not see the text "Transaction not in group"
