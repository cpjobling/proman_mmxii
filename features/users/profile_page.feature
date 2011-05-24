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
    When I follow "Edit my account"
    And I fill in "I prefer to be known as" with "Chris"
    And I press "Update"
    Then I should see "You updated your account successfully."
    And I should see "Chris" within "nav#main-navigation"
    And I should be on the profile page for c.p.jobling@swansea.ac.uk
    
  Scenario: I should see the correct fields
    When I follow "Edit my account"
    Then the "Email" field should contain "c.p.jobling@swansea.ac.uk"
    And I should see a "password" field called "Password"
    And I should see a "password" field called "Confirmation"
    And I should see select widget called "Title"
    And I should see a "text" field called "First name"
    And I should see a "text" field called "Initials"
    And I should see a "text" field called "Last name"
    And I should see a "text" field called "I prefer to be known as"
    And I should see a button labelled "Update"
    And I should see a link called "Cancel my account"
    And I should see a link called "Back"
  
  Scenario: I should be able to change my name details
    When I follow "Edit my account"
    And I select "Dr" from "Title"
    And I fill in "First name" with "Christopher"
    And I fill in "Initials" with "P."
    And I fill in "Last name" with "Jobling"
    And I fill in "I prefer to be known as" with "Chris"
    And I press "Update"
    And I should see "You updated your account successfully."
    Then The user record for "c.p.jobling@swansea.ac.uk" should contain the name "Dr" "Christopher" "P." "Jobling" known as "Chris" 
          
  Scenario: I should not be able to change my user name
    When I follow "Edit my account"
    Then I should not see "User name"
    And I should not see "user[user_name]"
  
  Scenario: I should be able to change my password
    When I follow "Edit my account"
    And I change my password from "please" to "newsecret"
    Then I should see "You updated your account successfully."
    
  Scenario: I should be able to sign in with my new password
    When I follow "Edit my account"
    And I change my password from "please" to "newsecret"
    And I sign out
    And I sign in as "c.p.jobling@swansea.ac.uk/newsecret"
    Then I should be signed in

  Scenario: I should not be able to sign in with my old password
    When I follow "Edit my account"
    And I change my password from "please" to "newsecret"
    And I sign out
    And I sign in as "c.p.jobling@swansea.ac.uk/please"
    Then I should not be signed in
  
  Scenario: I should see a Gravatar
    Then I should see a Gravatar
    When I follow "Edit my account"
    Then I should see a Gravatar
  
  Scenario: I should see a link to change the Gravatar
    When I follow "Edit my account"
    Then I should see a link to change the Gravatar
    
  Scenario: Back should take me back to my profile page
    When I follow "Edit my account"
    And I follow "Back"
    Then I should be on the profile page for c.p.jobling@swansea.ac.uk

  Scenario: I should be able to cancel my account
    When I follow "Edit my account"
    Then I should see "Cancel my account"

  Scenario: I should see my system account details
    Then I should see "c.p.jobling" within ".user_user_name"
    And I should see "c.p.jobling@swansea.ac.uk" within ".user_email"
    And I should not see "Also known as"
    And I should see the url for user "c.p.jobling@swansea.ac.uk"
    
  Scenario: I should see my system account details plus my AKA 
    When I follow "Edit my account"
    And I fill in "I prefer to be known as" with "Chris"
    And I press "Update"
    Then I should see "Chris" within ".user_known_as"

  Scenario: I should not need my current password to change my password
    When I follow "Edit my account"
    Then I should not see "Current password"
  
  Scenario: I should only have guest privileges

