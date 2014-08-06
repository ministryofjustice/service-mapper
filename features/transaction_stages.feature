Feature: Adding transaction stages
  As an product owners
  I want to be able to add transaction stages
  So that I can store how we manage transactions

  Background:
    Given I am logged in as editor
    And I have a transaction called "Prison visit booking"
    And I have a person called "Prison Visitor"
    And I have a system called "PVB website"

  Scenario: Choosing systems on each side
    When I go to /stories
    And I follow "Prison visit booking"
    And I follow "Add a new stage"

    And I fill in "Stage name" with "Test Transaction Stage"
    And I choose "API"

    And I choose "Select a system from our database" within "from system"
    And I select "Prison Visitor" from "story_stage_from_id" within "from system"

    And I choose "Select a system from our database" within "to system"
    And I select "PVB website" from "story_stage_to_id" within "to system"

    And I press "Create Story stage"

    And "Prison visit booking" should have 1 transaction stages
    And the last transaction stage should have "Prison Visitor" for "from"
    And the last transaction stage should have "PVB website" for "to"
    And the last transaction stage should have "API" for "payload"

  Scenario: Choosing "other" for mode
    When I go to /stories
    And I follow "Prison visit booking"
    And I follow "Add a new stage"

    And I choose "story_stage_payload_other"
    And I fill in "other_payload_input" with "Another mode"

    And I fill in "Stage name" with "Test Transaction Stage"
    And I choose "Select a system from our database" within "from system"
    And I select "Prison Visitor" from "story_stage_from_id" within "from system"
    And I choose "Select a system from our database" within "to system"
    And I select "PVB website" from "story_stage_to_id" within "to system"
    And I press "Create Story stage"

    And the last transaction stage should have "Another mode" for "payload"

  Scenario: Creating systems on each side
    When I go to /stories
    And I follow "Prison visit booking"
    And I follow "Add a new stage"

    And I fill in "Stage name" with "Test Transaction Stage"
    And I choose "Email"

    And I choose "Add a new system" within "from system"
    And I fill in "Name" with "New From System" within "from system"
    And I choose "Cloud service" within "from system"
    And I fill in "Owner" with "System Owner" within "from system"
    And I fill in "Supplier" with "System Supplier" within "from system"
    And I fill in "Technology" with "System Technology" within "from system"
    And I fill in "Source code url" with "http://source.com" within "from system"
    And I choose "LIVE" within "from system"
    And I fill in "Hosting" with "System Hosting" within "from system"
    And I fill in "Link" with "System Link" within "from system"

    And I choose "Add a new system" within "to system"
    And I fill in "Name" with "New To System" within "to system"

    And I press "Create Story stage"
    And "Prison visit booking" should have 1 transaction stages
    And the last transaction stage should have "New From System" for "from"
    And the last transaction stage should have "New To System" for "to"
    And the last transaction stage should have "Email" for "payload"
    And the system "New From System" should have "Cloud service" for "type"
    And the system "New From System" should have "System Owner" for "owner"
    And the system "New From System" should have "System Supplier" for "supplier"
    And the system "New From System" should have "System Technology" for "technology"
    And the system "New From System" should have "http://source.com" for "source_code_url"
    And the system "New From System" should have "live" for "status"
    And the system "New From System" should have "System Link" for "link"
