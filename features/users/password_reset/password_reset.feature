@password_reset

Feature: Password Reset
  As a user that forgot his password
  I want to reset my password
  So I can continue using the site

  Scenario: Display a reset password form
    Given "hector" is an anonymous user
    When I ask to reset my password
    Then I should be on the reset password page
    And I should see "Forgot your password?"
    And I should see a "user_new" form
    And I should see "Email"
    And there should be a "Send me reset password instructions" button

  Scenario: Send a reset instructions email if given a valid email
    Given "hector" a confirmed user
    When I ask to reset my password
    And I fill in "user_email" with "hector@swansea.ac.uk"
    And I press "Send me reset password instructions"
    Then I should be on the sign in page
    And I should see "You will receive an email with instructions about how to reset your password in a few minutes."
    And I receive an email
    And I open the email
    And I should see "Reset password instructions" in the email subject
    And there should be a "Change my password" link for "hector@swansea.ac.uk"

  Scenario: Do not send a reset instructions email if given an invalid email
    Given "hector" a confirmed user
    When I ask to reset my password
    And I fill in "user_email" with "hector@somehost.com"
    And I press "Send me reset password instructions"
    Then "hector@mail.com" should receive no email
    And I should see "Email not found"

  Scenario: Display change password form with valid token
    Given "hector" a user that opened his reset password email
    When I follow "Change my password" in the email
    Then I should be on the change password page
    And I should see a password modification form

  Scenario: Not display change password form with invalid token
    Given "hector" a user that opened his reset password email
    When I go to the change password form with bad token
    Then I should see a password modification form
    And I fill in "New password" with "<secret>"
    And I fill in "Confirm new password" with "<secret>"
    And I press "Change my password"
    Then I should be on the password page
    And I should see "Reset password token is invalid"

  Scenario: Update password and log in user with valid input
    Given "hector" a user that opened his reset password email
    And I follow "Change my password" in the email
    And I see a password modification form
    And I fill in "New password" with "newsecret"
    And I fill in "Confirm new password" with "newsecret"
    When I press "Change my password"
    Then I should see "Your password was changed successfully. You are now signed in."

  Scenario Outline: Don't update password and log in user with invalid input
    Given "hector" a user that opened his reset password email
    And I follow "Change my password" in the email
    And I see a password modification form
    And I fill in "New password" with "<password>"
    And I fill in "Confirm new password" with "<password_confirmation>"
    When I press "Change my password"
    Then I should not be signed in
    And I should not see "Your password was changed successfully. You are now signed in."
    And I should be on the password page
    And I should see a password modification form

  Examples:
      |  password  |  password_confirmation  |
      |  newsecret |                         |
      |            |       newsecret         |
      |            |                         |
      |  newsecret |         secret          |
