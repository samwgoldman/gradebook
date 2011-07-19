Then /^the page title should be "([^"]*)"$/ do |page_title|
  page.find(:xpath, "//h1[normalize-space(text()) = '#{page_title}']")
end
