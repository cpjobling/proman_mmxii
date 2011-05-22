@authorization
Feature: Authorization
  In order to control what users can do in Proman
  As a user with a given role
  I want to be allowed to do only what I am authorized to do
  
  Scenario: guest users have limited access to proman
    Given "Chris" is a guest user
    When I go to the home page
    Then I should be on the home page



  
