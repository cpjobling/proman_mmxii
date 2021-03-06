@chrome
Feature: Application chrome
  In order for Proman to be easy to use and navigate
  As a user
  I expect to see certain things on each page

  Background:
    Given "hector" is an anonymous user
    And "hector" is English
    When I go to the homepage
    
  Scenario: I should be a guest user
    The I should see "Guest"
      
  Scenario: header should have a logo
    Then I should see the site logo

  Scenario: header should hold the page title
    Then the title should say "Welcome to Proman"

  Scenario: header has "Sign in" in navigation menu
    Then I should see "Sign in" within "nav#main-navigation"

  Scenario: header has "Register" in navigation menu
    Then I should see "Register" within "nav#main-navigation"

  Scenario: header does not have "My account" in navigation menu
      Then I should not see "My account" within "nav#main-navigation"

  Scenario: header does not have "My profile" in navigation menu
       Then I should not see "My profile" within "nav#main-navigation"
           
  Scenario: header has a navset menu
    Then I should see "Home" within "nav#main-navigation"
  
  Scenario: footer contains a slogan
    Then I should see "If I have seen further"

  Scenario: footer contains a copyright notice
    Then I should see "Copyright" within "#footer" 
  
  Scenario: page contains a link to the terms of service
    Then I should see "Terms of Service"
  
  Scenario: page contains a link to the contact us page
    Then I should see "Contact Us"

  Scenario: page contains a link to the terms of service page
    Then I should see "Terms of Service"
      
  Scenario: page contains a link to the about page
    Then I should see "About"

  Scenario: copyright notice has a link to Swansea University
    Then I should see "Swansea University" within "#footer p a" 
    
  Scenario: sidebar contains sidebar items
    Then the sidebar should be an aside 
    And the sidebar should have a heading
    And the sidebar should have some content
    

  


  
