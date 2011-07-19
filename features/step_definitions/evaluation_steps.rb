When /^I add a criterion with prompt "([^"]*)"$/ do |prompt|
  click_link 'Add Criterion'
  within('#criteria > :last-child') do
    fill_in 'Prompt', :with => prompt
  end
end
