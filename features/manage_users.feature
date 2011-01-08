Feature: So that admin can see Manage Users Page

  Background:
    Given I am logged in as an admin
    And I follow "Admin"
    And I follow "Manage Users" 

  Scenario: Admins should be able view himself
    Given I am on the admin page
    When I follow "Manage Users"
    Then I should see "Show"
    Then I should see "Edit"
    Then I should not see "Delete User"

  Scenario: Admins should see a navigational elements
    Then I should see "Back"
    Then I should see "New User"

  @t
  Scenario: Admins should users transaction logs
    Given I am on the admin page
    When I follow "Manage Users"
    And I follow "Show"
    And I follow "Transaction Logs"
    Then I should see "Time"
    And I should see "Description"
    And I should see "127.0.0.1"
    And I should see "Logged in from Web App"



