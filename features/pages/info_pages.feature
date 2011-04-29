@pages
Feature: Information pages
  In order to find out more about Proman
  As a user or visitor
  I want to be able to visit pages about Proman
  
  Background:
    Given "chris" is an anonymous user
    When I go to the homepage
  
  Scenario: Visit the home page
    Then I should be home
    And the title should say "Welcome to Proman"
  
  Scenario: Visit the about us page
    And I follow "About"
    Then I should be on the about page
    And the title should say "About Proman"

  Scenario: Visit the terms of service page
    And I follow "Terms of Service"
    Then I should be on the terms of service page
    And the title should say "Terms of Service"
      
  Scenario: Visit the contact us page
    And I follow "Contact us"
    Then I should be on the contact us page
    And the title should say "Contact Us"
      
  Scenario: Visit the software license page
    And I follow "License"
    Then I should be on the software license page
    And the title should say "Apache License, Version 2.0"
    
  Scenario: Visit the software license page
    And I follow "Help"
    Then I should be on the help page
    And the title should say "Help"

  Scenario: Return to the home page
    And I follow "About"
    And I follow "Home"
    Then I should be home

