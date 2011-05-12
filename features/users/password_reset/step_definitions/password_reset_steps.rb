When /^I ask to reset my password$/ do
  click_link "Sign in"
  click_link "Forgot your password?"
end

Then /^I should see a reset password form$/ do
  p
  ending # express the regexp above with the code you wish you had
end