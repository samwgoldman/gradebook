Given /^an evaluation named "([^"]*)" with the following criteria:$/ do |evaluation_name, criteria|
  Given %{an evaluation "eval" exists with name: "#{evaluation_name}"}
  criteria.hashes.each do |criterion|
    And %{a criterion exists with prompt: "#{criterion[:prompt]}", evaluation: evaluation "eval"}
  end
end

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

When /^I add and remove a criterion with prompt "([^"]*)"$/ do |prompt|
  When %{I add a criterion with prompt "#{prompt}"}
  And  %{I remove the criterion with prompt "#{prompt}"}
end
