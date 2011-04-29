@chrome @user_menu
Feature: User menu
    In order for Proman to be easy to use and navigate
    As an authenticated  user
    I expect to be recognised and be able to navigate quickly to my profile page and be able to sign out 

  Background:
    Given "hector" a signed in user with email "hector@swansea.ac.uk"
    When I go to the homepage

  Scenario: I should be able to access my account
    Then I should see "My account" within "nav#user"
    When I follow "My account"
    Then I should be on my profile page
    
  Scenario: there should be a valid user record
    Then there should be a valid user record for "hector" a user with email "hector@swansea.ac.uk"
  
  Scenario: I should see my user name
    Then my user name should be "hector"

  Scenario: I should see my preferred name if I've set it
     When I follow "My account"
     And I fill in "I prefer to be known as" with "Fred"
     And I fill in "Current password" with "secret"
     And I press "Update"
     Then I should be known as "Fred"
     And I should see "Fred" within "nav#user"
  
  Scenario: I should be able to sign out
    Then I should see "Sign out" within "nav#user"
    When I follow "Sign out"
    Then I should be signed out
