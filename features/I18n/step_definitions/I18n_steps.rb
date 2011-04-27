Given /^"([^"]*)" is English$/ do |name|
  I18n.locale = 'en' 
end

Given /^"([^"]*)" is Welsh$/ do |name|
  I18n.locale = 'cy' 
end
    
Then /^the title should say '[^'](.+)'$/ do |title|
  page.should have_selector("header#header h2", :text => title)
end

Then /^Page should be (English|Welsh) (.+)$/ do |language,page_name|
  locale = case language
  when /Welsh/
    'cy'
  else
    'en' # Default
  end
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == "/#{locale}#{path_to(page_name)}"
  else
    assert_equal "/#{locale}#{path_to(page_name)}", current_path
  end
end