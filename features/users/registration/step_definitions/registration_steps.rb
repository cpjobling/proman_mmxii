Given /"(.*)" is an anonymous user/ do |name|
  visit '/logout'
end

Given /^"(.*)" an unconfirmed user$/ do |name|
  @email = "#{name}@swansea.ac.uk"
  When "I go to the registration page"
  And "I fill in \"Email\" with \"#{@email}\""
  And "I fill in \"Password\" with \"secret\""
  And "I fill in \"Confirmation\" with \"secret\""

  And "I select \"Mr\" from \"Title\""
  And "I fill in \"First name\" with \"#{name}\""
  And "I fill in \"Initials\" with \"P.\""
  And "I fill in \"Last name\" with \"Jobling\""    
  
  When "I press \"Register\""
  Then "I should have a successful registration"
end

Given /^"(.*)" an unconfirmed user with password "(.*)"$/ do |name, password|
  @email = "#{name}@swansea.ac.uk"
  When "I go to the registration page"
  And "I fill in \"Email\" with \"#{@email}\""
  And "I fill in \"Password\" with \"#{password}\""
  And "I fill in \"Confirmation\" with \"#{password}\""

  And "I select \"Mr\" from \"Title\""
  And "I fill in \"First name\" with \"#{name}\""
  And "I fill in \"Initials\" with \"P.\""
  And "I fill in \"Last name\" with \"Jobling\""  
  
  When "I press \"Register\""
  Then "I should have a successful registration"
end

Given /^"(.*)" a confirmed user$/ do |name|
  Given "\"#{name}\" an unconfirmed user"
  And "I receive an email"
  And "I open the email"
  And "I should see \"confirm\" in the email body"
  When "I follow \"confirm\" in the email"
  Then "I should see my account page"
  Then "a clear email queue"
  visit '/logout'
end

Given /^"(.*)" a confirmed user with password "(.*)"$/ do |name, password|
  Given "\"#{name}\" an unconfirmed user with password \"#{password}\""
  And "I receive an email"
  And "I open the email"
  And "I should see \"confirm\" in the email body"
  When "I follow \"confirm\" in the email"
  Then "I should see my account page"
  visit '/logout'
end

Then /^I should see the registration page$/ do
  page.should have_content('Email')
  page.should have_content('Password')
  page.should have_content('Title')
  page.should have_content('First name')
  page.should have_content('Initials')
  page.should have_content('Last name')
  page.should have_content('I prefer to be known as')
  page.should have_content('Register')
end

Then /^I should have a successful registration$/ do
  When 'I should see "You have signed up successfully."'
end

Then /^I should have an unsuccessful registration$/ do
  When 'I should not see "You have signed up successfully."'
end

Then /^I should be logged in$/ do
  When 'I should see "My account"'
end

Then /^I should see my account page$/ do
  When 'I should see "My account"'
end

Then /^I should not be logged in$/ do
  When 'I should not see "My account"'
end

Then /^I should not see my account page$/ do
  When 'I should not see "My account"'
end
