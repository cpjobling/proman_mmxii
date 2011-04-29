@signup
Feature: Sign up
  In order to get access to protected sections of the site
  A user
  Should be able to register

  Scenario: User signs up with valid data
    Given I am not signed in
    When I go to the registration page
    And I fill in "Email" with "t.tester@swansea.ac.uk"
    And I fill in "Password" with "please"
    And I fill in "Confirmation" with "please"
    And I fill in "First (given) name" with "Test"
    And I fill in "Last (family) name" with "Tester"
    And I press "Register"
    Then I should see "You have signed up successfully. However, we could not sign you in because your account is unconfirmed."

  Scenario: User signs up with invalid email
    Given I am not signed in
    When I go to the registration page
    And I fill in "Email" with "someone@notatswansea.ac.uk"
    And I fill in "Password" with "please"
    And I fill in "Confirmation" with "please"
    And I fill in "First (given) name" with "Test"
    And I fill in "Last (family) name" with "Tester"
    And I press "Register"
    Then I should see "Email is invalid" within "#user_email_input"

  Scenario: User signs up without password
    Given I am not signed in
    When I go to the registration page
    And I fill in "Email" with "t.tester@swansea.ac.uk"
    And I fill in "Password" with ""
    And I fill in "Confirmation" with "please"
    And I fill in "First (given) name" with "Test"
    And I fill in "Last (family) name" with "Tester"
    And I press "Register"
    Then I should see "can't be blank" within "#user_password_input"

  Scenario: User signs up without password confirmation
    Given I am not signed in
    When I go to the registration page
    And I fill in "Email" with "t.tester@swansea.ac.uk"
    And I fill in "Password" with "please"
    And I fill in "Confirmation" with ""
    And I fill in "First (given) name" with "Test"
    And I fill in "Last (family) name" with "Tester"
    And I press "Register"
    Then I should see "doesn't match confirmation" within "#user_password_input" 

  Scenario: User signs up without a first name
    Given I am not signed in
    When I go to the registration page
    And I fill in "Email" with "t.tester@swansea.ac.uk"
    And I fill in "Password" with "please"
    And I fill in "Confirmation" with "please"
    And I fill in "Last (family) name" with "Tester"
    And I press "Register"
    Then I should see "can't be blank" within "#user_first_name_input"
    
  Scenario: User signs up without a last name
    Given I am not signed in
    When I go to the registration page
    And I fill in "Email" with "t.tester@swansea.ac.uk"
    And I fill in "Password" with "please"
    And I fill in "Confirmation" with "please1"
    And I fill in "First (given) name" with "Test"
    And I press "Register"
    Then I should see "can't be blank" within "#user_last_name_input"
    
      
  Scenario: Display registration page to anonymous user
    Given "hector" is an anonymous user
    When I go to the homepage
    Then I should see "Register"
    When I follow "Register"
    Then I should see the registration page

  Scenario: Allow an anonymous user to create account
    Given "hector" is an anonymous user
    When I go to the registration page
    And I fill in "Email" with "h.n.actor@swansea.ac.uk"
    And I fill in "Password" with "secret"
    And I fill in "Confirmation" with "secret"
    
    And I select "Mr" from "Title"
    And I fill in "First (given) name" with "Hector"
    And I fill in "Initials" with "N."
    And I fill in "Last (family) name" with "Actor"  
    And I fill in "I prefer to be known as" with "Hector"

    When I press "Register"
    Then I should have a successful registration

  Scenario Outline: Not allow an anonymous user to create account with incomplete input
    Given "chris" is an anonymous user
    When I go to the registration page
    And I fill in "Email" with "<email>"
    And I fill in "Password" with "<password>"
    And I fill in "Confirmation" with "<password_confirmation>"

    And I fill in "First (given) name" with "<first_name>"
    And I fill in "Last (family) name" with "<last_name>"
        
    And I press "Register"
    Then I should have an unsuccessful registration
 
  Examples: Additional input needed
    | email                   | password | password_confirmation | first_name | last_name |
    |                         |          |                       |            |           |
    |                         |          |                       |            | Jobling   |
    |                         |          |                       | Chris      |           |
    |                         |          |                       | Chris      | Jobling   |
    | c.p.jobling@swan.ac.uk  |          |                       |            |           |
    | c.p.jobling@swan.ac.uk  |          |                       |            | Jobling   |
    | c.p.jobling@swan.ac.uk  |          |                       | Chris      |           |
    | c.p.jobling@swan.ac.uk  |          |                       | Chris      | Jobling   |
    | c.p.jobling@swan.ac.uk  |  secret  |                       |            |           |
    | c.p.jobling@swan.ac.uk  |  secret  |                       |            | Jobling   |
    | c.p.jobling@swan.ac.uk  |  secret  |                       | Chris      |           |
    | c.p.jobling@swan.ac.uk  |  secret  |                       | Chris      | Jobling   |
    | c.p.jobling@swan.ac.uk  |  secret  | secret                |            |           |
    | c.p.jobling@swan.ac.uk  |  secret  | secret                |            | Jobling   |
    | c.p.jobling@swan.ac.uk  |  secret  | secret                | Chris      |           |


  Examples: Bad password and confirmation combinations
    | email                 | password | password_confirmation |
    | c.p.jobling@abertawe  |          |                       |
    | c.p.jobling@abertawe  | secret   |                       |
    | c.p.jobling@abertawe  |          | secret                |
    | cc.p.jobling@abertawe | secret   | notsecret             |


  Scenario Outline: It should allow a registration from swansea university
    Given "chris" is an anonymous user
    When I go to the registration page
    And I fill in "Email" with "<email>"
    And I fill in "Password" with "<password>"
    And I fill in "Confirmation" with "<password_confirmation>"

    And I fill in "First (given) name" with "<first_name>"
    And I fill in "Last (family) name" with "<last_name>"

    And I press "Register"
    Then I should have a successful registration

    Examples: Additional input needed
      | email                      | password | password_confirmation | first_name | last_name |
      | c.p.jobling@swan.ac.uk     | secret   |  secret               | Chris      | Jobling   |
      | c.p.jobling@swansea.ac.uk  | secret   |  secret               | Chris      | Jobling   |
      | c.p.jobling@abertawe.ac.uk | secret   |  secret               | Chris      | Jobling   |
      
  Scenario Outline: Not allow an anonymous user to create account with incomplete profile data
    Given "chris" is an anonymous user
    When I go to the registration page
    And I fill in "Email" with "c.p.jobling@swansea.ac.uk"
    And I fill in "Password" with "secret"
    And I fill in "Confirmation" with "secret"
    
    And I fill in "First (given) name" with "<first_name>"
    And I fill in "Last (family) name" with "<last_name>"
    And I press "Register"
    Then I should have an unsuccessful registration

  Examples: Additional input needed
    | first_name  | last_name |
    |             | Jobling   |
    | Christopher |           |

  Scenario: Send a mail activation at a successful account creation
    Given "hector" an unconfirmed user
    And I receive an email
    When I open the email
    Then I should see "Confirmation instructions" in the email subject

  Scenario: Confirm account using mail activation token
    Given "hector" an unconfirmed user
    When I receive an email
    And I open the email
    Then I should see "Confirmation instructions" in the email subject
    Then I should see "Confirm my account" in the email body
    When I follow "Confirm my account" in the email
    And I should see "Your account was successfully confirmed. You are now signed in."
    And I should be logged in


  Scenario: Do not confirm an account with invalid mail activation token
    Given "hector" an unconfirmed user
    When I go to the confirm page with bad token
    Then I should not be logged in