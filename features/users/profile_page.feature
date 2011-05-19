@profile_page

Feature: Profile Page
  As a registered user of the website
  I want have user profile which I can update
  so I can update my profile

  Background:
    Given I am a user named "chris" with an email "chris@swansea.ac.uk" and password "please"
    When I sign in as "chris@swansea.ac.uk/please"
    And I follow "My account"
  
  Scenario: I should be able to edit my profile
    When I fill in "I prefer to be known as" with "Fred"
    And I fill in "Current password" with "please"
    And I press "Update"
    And I should see "You updated your account successfully."
    And I should see "Fred" within "nav#main-navigation"
    
  Scenario: I should see the correct fields
    Then the "Email" field should contain "chris@swansea.ac.uk"
    And I should see a "password" field called "Password"
    And I should see a "password" field called "Confirmation"
    And I should see a "password" field called "Current password"
    And I should see select widget called "Title"
    And I should see a "text" field called "First (given) name"
    And I should see a "text" field called "Initials"
    And I should see a "text" field called "Last (family) name"
    And I should see a "text" field called "I prefer to be known as"
    And I should see a button labelled "Update"
    And I should see a link called "Cancel my account"
    And I should see a link called "Back"
  
  Scenario: I should be able to change my name details
  
  Scenario: I should not be able to change my user name
  
  Scenario: I should not need my current password to change my password
  
  Scenario: I should have a gravatar
  
  Scenario: I should only have guest privileges