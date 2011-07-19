When /^I add a criterion with prompt "([^"]*)"$/ do |prompt|
  click_link 'Add Criterion'
  within('#criteria > :last-child') do
    fill_in 'Prompt', :with => prompt
  end
end

When /^I remove the criterion with prompt "([^"]*)"$/ do |prompt|
  input = page.all(:xpath, XPath::HTML.field('Prompt')).find { |input| input.value == prompt }
  assert input, "Could not find criterion with prompt: #{prompt}"
  section = input.find(:xpath, 'ancestor::node()[contains(@class, "criterion")]')
  remove = section.check('Remove Criterion')
end
