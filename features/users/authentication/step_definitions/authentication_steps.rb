Given /^no user exists with an email of "(.*)"$/ do |email|
  assert_nil User.find(:first, :conditions => { :email => email })
end

Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  user = User.new(
            :email => email,
            :password => password,
            :password_confirmation => password,
            :first_name => 'foo',
            :last_name => 'user')
  user.save!
  user.confirm!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@mswansea.ac.uk'
  user_name = 'testing'
  password = 'secretpass'
  
  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I go to sign in}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Then /^I should be already signed in$/ do
  And %{I should see "Sign out"}
end

Then /^I should not be signed in$/ do
  page.within("nav#user") do
    page.should have_content("Sign in")
    page.should have_content("Guest")
  end
end


Given /^I am signed up as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not signed in}
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I fill in "Password confirmation" with "#{password}"}
  And %{I press "Sign up"}
  Then %{I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."}
  And %{I am signed out}
end

Given /^I am signed out$/ do
  visit('logout')
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not signed in}
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
end

Then /^I should be signed in$/ do
  Then %{I should see "Signed in successfully."}
end

Then /^I sign out$/ do
  visit('/logout')
end

When /^I return next time$/ do
  And %{I go to the home page}
end

Then /^I should be signed out$/ do
  And %{I should see "Register"}
  And %{I should see "Sign in"}
  And %{I should not see "Sign out"}
end

Given /^I am not signed in$/ do
  visit('/logout') # ensure that at least
end

When /^I check the "([^"]*)" checkbox$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I return some\-time later$/ do
  user_session = nil
  visit('/home')
end

Then /^I should see a sign in form$/ do
  page.has_content?("Email")
  page.has_content?("Password")
  page.has_content?("Remember me")
end

Given /^"(.*)" a signed in user with email "(.*)"$/ do |name,email|
  Given "\"#{name}\" a confirmed user"
  When "I follow \"Sign in\""
  An "I fill in \"Email\" with \"#{email}\""
  And "I fill in \"Password\" with \"secret\""
  And "I press \"Sign in\""
  Then "I should see \"My account\""
end


Then /^there should be a valid user record for "([^"]*)" a user with email "([^"]*)"$/ do |name, email|
  user = User.find_by_email(email)
  user.should_not be_nil
  user.email.should == email
  user.user_name.should == name
  user.first_name.should == "hector"
  user.last_name.should == "Jobling"
  user.known_as.should be_blank
end
