@chrome @guest_menu
Feature: Guest menu
  In order for Proman to be easy to use and navigate
  As a guest user
  I expect to be able to navigate the public pages and quickly get to the registration pages

  Background:
    Given "hector" is an anonymous user
    And "hector" is English
    When I go to the homepage
    
  Scenario: I should be a guest user
    Then I should see "Guest" within "nav#main-navigation"

  Scenario: I should be a guest user
    Then I should see "Register" within "nav#main-navigation"
    When I follow "Register"
    Then I should be on the registration page

  Scenario: I should be a guest user
    Then I should see "Sign in" within "nav#main-navigation"
    When I follow "Sign in"
    Then I should be on the sign in page


