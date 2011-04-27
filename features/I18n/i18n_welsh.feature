@i18n
Feature: I18n and L10n
  In order for Proman to be usable in Welsh
  As a user
  I expect to be able to see Welsh versions of pages

Background:
  Given "iwan" is an anonymous user
  And "iwan" is Welsh

  Scenario: the Welsh home page should be in the Welsh locale ("cy")
    Given I am on the home page
    Then I should be on the home page
    And I should see "Croeso i Proman"

  Scenario: there should be a Welsh "About us" page
    Given I am on the the about page
    Then I should be on the about page
    And I should see "Am Proman"

