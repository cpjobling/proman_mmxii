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
  fill_in("Current password", :with => old_password)
  click_button("Update")
end