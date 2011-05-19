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

