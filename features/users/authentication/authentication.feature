@login
Feature: Authentication
  As a confirmed but anonymous user
  I want to sign in to the application
  So that I can be productive

  Scenario: Display sign in form to anonymous users
    Given "hector" is an anonymous user
    When I go to the sign in page
    Then I should see a sign in form

  Scenario: Redirect to account page when user is signed in
    Given "hector" a signed in user with email "hector@test.com"
    When I go to the sign in page
    Then I should be signed in

  Scenario: Allow sign in of a user with valid credentials
    Given "hector" a confirmed user with password "supersecret"
    When I go to the sign in page
    And I fill in "sign in" with "hector"
    And I fill in "password" with "supersecret"
    And I press "sign in"
    Then I should be signed in
 
  Scenario Outline: Not allow sign in of a user with bad credentials
    Given "hector" a confirmed user with password "secret"
    When I go to the sign in page
    And I fill in "sign in" with "<sign in>"
    And I fill in "password" with "<password>"
    And I press "sign in"
    Then I should not be signed in

  Examples:
      | sign in   |    password    |
      | hector  |    badsecret   |
      | hector  |                |
      | unknown |     secret     |
      | unknown |    badsecret   |
      | unknown |                |
      |         |                |
      |         |     secret     |
      |         |    badsecret   |

  Scenario: Not allow sign in of an unconfirmed user
    Given "hector" an unconfirmed user with password "secret"
    When I go to the sign in page
    And I fill in "sign in" with "hector"
    And I fill in "password" with "secret"
    And I press "sign in"
    Then I should not be signed in
    And I should see "not confirmed"
    
  Scenario: User is not signed up
    Given I am not signed in
    And no user exists with an email of "user@test.com"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    Then I should see "Invalid email or password."
    And I go to the home page
    And I should be signed out

  Scenario: User enters wrong password
    Given I am not signed in
    And I am a user named "foo" with an email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/wrongpassword"
    Then I should see "Invalid email or password."
    And I go to the home page
    And I should be signed out

  Scenario: User signs in successfully with email
    Given I am not signed in
    And I am a user named "foo" with an email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    Then I should see "Signed in successfully."
    And I should be signed in
    When I return next time
    Then I should be already signed in
    
  Scenario: User is remembered
    Given I am not signed in
    And I am a user named "foo" with an email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    And I check the "remember me" checkbox
    Then I should see "Signed in successfully."
    And I should be signed in
    When I return some-time later
    Then I should be already signed in
