@i18n
Feature: I18n and L10n
  In order for Proman to be usable in Welsh
  As a user
  I expect to be able to see Welsh versions of pages

Background:
  Given "iwan" is an anonymous user
  And "iwan" is Welsh

  Scenario: the English home page should be in the Welsh locale ("cy")
    Given I am on the cy_home page
    Then Page should be Welsh home
    And I should see "Croeso i Proman"

    
  Scenario: there should be an Welsh "About us" page
    Given I am on the cy_about page
    Then Page should be Welsh about
    And I should see "Am Proman" 
