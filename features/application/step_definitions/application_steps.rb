Then /^I should see the site logo$/ do
  Then 'I should see "Proman" within "#header h1"'
end

Then /^the sidebar should be an aside$/ do
  page.has_selector?("aside#sidebar")
end

Then /^the sidebar should have a heading$/ do
  page.has_selector?("aside#sidebar header h1")
end

Then /^the sidebar should have some content$/ do
  page.has_selector?("aside#sidebar header p")
end

Then /^my user name should be "([^"]*)"$/ do |user_name|
  user = User.find_by_email("hector@swansea.ac.uk")
  user.user_name.should == user_name
end

Then /^I should be known as "([^"]*)"$/ do |known_as|
  user = User.find_by_email("hector@swansea.ac.uk")
  user.known_as.should == known_as
end
