When /^I change "([^"]*)" to "([^"]*)"$/ do |from_value, to_value|
  input = page.find(:xpath, "//input[@value = '#{from_value}']")
  input.set(to_value)
end
