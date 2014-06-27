Feature: Adding transaction stages
  As an product owners
  I want to be able to add transaction stages
  So that I can store how we manage transactions

  Scenario: Choosing systems and people on each side
    Given I am logged in as editor
    And I have a transaction called "Prison visit booking"
    And I have a person called "Prison Visitor"
    And I have a system called "PVB website"
    When I go to /
    And I follow "Prison visit booking"
    And I follow "Add a stage"
    And I select "Prison Visitor" from "From"
    And I select "PVB website" from "To"
    And I press "Create Story stage"
    And "Prison visit booking" should have 1 transaction stages
    And the last transaction stage should have "Prison Visitor" for "from"
    And the last transaction stage should have "PVB website" for "to"