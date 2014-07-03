Feature: Managing systems
  As a sys admin
  I want to be able to manage systems
  So that I can store knowledge of our systems

  Background:
    Given I am logged in as editor
    And I have a system called "PVB website"

  Scenario: Creating a valid system
    When I go to /systems
    And I follow "New system"

    And I fill in "Name" with "New System"
    And I choose "Cloud service"
    And I fill in "Owner" with "System Owner"
    And I fill in "Supplier" with "System Supplier"
    And I fill in "Technology" with "System Technology"
    And I fill in "Source code url" with "http://source.com"
    And I choose "LIVE"
    And I fill in "Hosting" with "System Hosting"
    And I fill in "Link" with "System Link"

    And I press "Create System"

    And the system "New System" should have "Cloud service" for "type"
    And the system "New System" should have "System Owner" for "owner"
    And the system "New System" should have "System Supplier" for "supplier"
    And the system "New System" should have "System Technology" for "technology"
    And the system "New System" should have "http://source.com" for "source_code_url"
    And the system "New System" should have "live" for "status"
    And the system "New System" should have "System Link" for "link"

  Scenario: Editing a valid system
    When I go to /systems
    And I follow "Edit"

    And I fill in "Name" with "Edited PVB website"
    And I choose "Cloud service"
    And I fill in "Owner" with "System Owner"
    And I fill in "Supplier" with "System Supplier"
    And I fill in "Technology" with "System Technology"
    And I fill in "Source code url" with "http://source.com"
    And I choose "LIVE"
    And I fill in "Hosting" with "System Hosting"
    And I fill in "Link" with "System Link"

    And I press "Update System"

    And the system "Edited PVB website" should have "Cloud service" for "type"
    And the system "Edited PVB website" should have "System Owner" for "owner"
    And the system "Edited PVB website" should have "System Supplier" for "supplier"
    And the system "Edited PVB website" should have "System Technology" for "technology"
    And the system "Edited PVB website" should have "http://source.com" for "source_code_url"
    And the system "Edited PVB website" should have "live" for "status"
    And the system "Edited PVB website" should have "System Link" for "link"
