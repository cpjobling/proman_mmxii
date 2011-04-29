@show_users
Feature: Show Users
  As a visitor to the website
  I want to see registered users listed on the homepage
  so I can know if the site has users

    Scenario: Viewing users
      Given "hector" a signed in user with email "hector@swansea.ac.uk"
      When I go to the homepage
      Then I should see "hector"

