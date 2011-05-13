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