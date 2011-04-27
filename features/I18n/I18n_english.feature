@i18n
Feature: I18n and L10n
  In order for Proman to be usable in English
  As a user
  I expect to be able to see English versions of pages

  Background:
    Given "hector" is an anonymous user
    And "hector" is English
      
  Scenario: the default locale is English
    Given I am on the home page
    Then I should be on the home page
    And I should see "Welcome to Proman"
    
  Scenario: the English home page should be in the English locale ("en")
    Given I am on the home page
    Then I should be on the home page
    And I should see "Welcome to Proman"
    
  Scenario: there should be an English "About us" page
    Given I am on the about page
    Then I should be on the about page
    And I should see "About Proman"   