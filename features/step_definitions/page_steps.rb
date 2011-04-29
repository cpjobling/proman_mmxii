Then /^the title should say "[^"](.+)"$/ do |title|
  page.should have_selector("header#header h2", :text => title)
end

