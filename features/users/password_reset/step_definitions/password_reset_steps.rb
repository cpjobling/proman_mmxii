When /^I ask to reset my password$/ do
  click_link "Sign in"
  click_link "Forgot your password?"
end

Then /^I should see a "([^"]*)" form$/ do |id|
  page.find("form\##{id}").should be_true
end

And /^there should be a "([^"]*)" button$/ do |label|
  page.should have_button(label)
end

Given /"(.*)" a user that opened his reset password email/ do |name|
  Given "\"#{name}\" a confirmed user"
  And "I go to the reset password page"
  And "I fill in \"Email\" with \"#{name}@swansea.ac.uk\""
  And "I press \"Send me reset password instructions\""
  When "\I receive an email"
  And "I open the email"
  Then "I should see \"reset\" in the email body"
end

Then /^I (?:should )?see a reset password form$/ do
  response.should have_content('Forgot Password')
  response.should have_content('Email')
end

Then /^I (?:should )?see a password modification form$/ do
  page.should have_content('Change your password')
  page.should have_content('New password')
  page.should have_content('Confirm new password')
end

Then /^I should not see a change password form$/ do
  page.should_not have_content('Change your password')
end

Then /^there should be a "Change my password" link for \"([^"]*)\"$/ do |email|
  user = User.find_by_email(email)
  user.should_not be_nil
  user.reset_password_token.should_not be_nil
end