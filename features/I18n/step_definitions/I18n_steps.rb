Given /^"([^"]*)" is English$/ do |name|
  I18n.locale = 'en' 
end

Given /^"([^"]*)" is Welsh$/ do |name|
  I18n.locale = 'cy' 
end
    
Then /^the title should say '[^'](.+)'$/ do |title|
  page.should have_selector("header#header h2", :text => title)
end
