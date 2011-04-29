Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

    Scenario: I sign in and edit my account
      Given I am a user named "foo" with an email "user@swansea.ac.uk" and password "please"
      When I sign in as "user@swansea.ac.uk/please"
      Then I should be signed in
      When I follow "My account"
      And I fill in "I prefer to be known as" with "Fred"
      And I fill in "Current password" with "please"
      And I press "Update"
      And I go to the homepage
      Then I should see "Fred"