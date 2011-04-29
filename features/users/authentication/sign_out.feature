@authentication @sign_out
Feature: Sign out
  To protect my account from unauthorized access
  A signed in user
  Should be able to sign out

    Scenario: User signs out
      Given I am a user named "foo" with an email "user@swansea.ac.uk" and password "please"
      When I sign in as "user@swansea.ac.uk/please"
      Then I should be signed in
      And I sign out
      Then I should see "Signed out"
      When I return next time
      Then I should be signed out