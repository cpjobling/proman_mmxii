Then /^I should see a "([^"]*)" field called "([^"]*)"$/ do |type, name|
  find_field(name)[:type].should == type 
end

Then /^I should see select widget called "([^"]*)"$/ do |name|
  find_field(name).has_selector?('select')
end

Then /^I should see a button labelled "([^"]*)"$/ do |label|
  find_button(label).should_not be_nil
end

Then /^I should see a link called "([^"]*)"$/ do |name|
  find_link(name).should_not be_nil
end

Then /^The user record for "([^"]*)" should contain the name "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" known as "([^"]*)"$/ do |email, title, first_name, initials, last_name, known_as|
  user = User.find_by_email(email)
  user.title.should == title
  user.first_name.should == first_name
  user.last_name == last_name
  user.initials.should == initials
  user.known_as.should == known_as
end

When /^I change my password from "([^"]*)" to "([^"]*)"$/ do |old_password, new_password|
  fill_in("Password", :with => new_password)
  fill_in("Confirm", :with => new_password)
  click_button("Update")
end

Then /^I should see a Gravatar$/ do
  page.should have_selector('img.gravatar')
end

Then /^I should see a link to change the Gravatar$/ do
  gravatar_url = "http:/gravatar.com/emails"
  page.should have_selector("a", :href => gravatar_url, :content => "change")
end

Then /^I should see the url for user "([^"]*)"$/ do |email|
  user = User.find_by_email(email)
  url = user_path(user, :locale=>'en')
  page.should have_selector("a[@href='#{url}']")
end
