@profile_page

Feature: Profile Page
  As a registered user of the website
  I want have user profile which I can update
  so I can update my profile

  Background:
    Given I am a user named "chris" with an email "c.p.jobling@swansea.ac.uk" and password "please"
    When I sign in as "c.p.jobling@swansea.ac.uk/please"
    And I follow "My account"
  
  Scenario: I should be able to edit my profile
    When I fill in "I prefer to be known as" with "Chris"
    And I fill in "Current password" with "please"
    And I press "Update"
    And I should see "You updated your account successfully."
    And I should see "Chris" within "nav#main-navigation"
    
  Scenario: I should see the correct fields
    Then the "Email" field should contain "c.p.jobling@swansea.ac.uk"
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
    When I select "Dr" from "Title"
    And I fill in "First (given) name" with "Christopher"
    And I fill in "Initials" with "P."
    And I fill in "Last (family) name" with "Jobling"
    And I fill in "I prefer to be known as" with "Chris"
    And I fill in "Current password" with "please"
    And I press "Update"
    And I should see "You updated your account successfully."
    Then The user record for "c.p.jobling@swansea.ac.uk" should contain the name "Dr" "Christopher" "P." "Jobling" known as "Chris" 
          
  Scenario: I should not be able to change my user name
    Then I should not see "User name"
    And I should not see "user[user_name]"
  
  Scenario: I should be able to change my password
    When I change my password from "please" to "newsecret"
    Then I should see "You updated your account successfully."
    
  Scenario: I should be able to sign in with my new password
    When I change my password from "please" to "newsecret"
    And I sign out
    And I sign in as "c.p.jobling@swansea.ac.uk/newsecret"
    Then I should be signed in

  Scenario: I should not be able to sign in with my old password
    When I change my password from "please" to "newsecret"
    And I sign out
    And I sign in as "c.p.jobling@swansea.ac.uk/please"
    Then I should not be signed in
  
  Scenario: I should not need my current password to change my password
  
  Scenario: I should have a gravatar
  
  Scenario: I should only have guest privileges