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
    Then I should be home
    And I should see "Welcome to Proman"
    
  Scenario: the English home page should be in the English locale ("en")
    Given I am on the en_home page
    Then Page should be English home
    And I should see "Welcome to Proman"
    
  Scenario: there should be an English "About us" page
    Given I am on the en_about page
    Then Page should be English about
    And I should see "About Proman"   