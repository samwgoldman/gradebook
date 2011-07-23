Given /^an evaluation named "([^"]*)" with the following criteria:$/ do |evaluation_name, criteria|
  Given %{an evaluation "eval" exists with name: "#{evaluation_name}"}
  criteria.hashes.each do |criterion|
    And %{a criterion exists with prompt: "#{criterion[:prompt]}", evaluation: evaluation "eval"}
  end
end

When /^I add a criterion with prompt "([^"]*)"$/ do |prompt|
  click_link 'Add Criterion'
  fields = find(:xpath, '//node()[contains(@class, "criteria")]/node()[contains(@class, "fields") and last()]')
  fields.fill_in 'Prompt', :with => prompt
end

When /^I remove the criterion with prompt "([^"]*)"$/ do |prompt|
  input = page.all(:xpath, XPath::HTML.field('Prompt')).find { |input| input.value == prompt }
  assert input, "Could not find criterion with prompt: #{prompt}"
  fields = input.find(:xpath, 'ancestor::node()[contains(@class, "fields")]')
  fields.click_link 'Remove Criterion'
end

When /^I add and remove a criterion with prompt "([^"]*)"$/ do |prompt|
  When %{I add a criterion with prompt "#{prompt}"}
  And  %{I remove the criterion with prompt "#{prompt}"}
end

When /^I add an alternative with label "([^"]*)"$/ do |label|
  criterion_fields = find(:xpath, '//node()[contains(@class, "criteria")]/node()[contains(@class, "fields") and last()]') 
  criterion_fields.click_link 'Add Alternative'
  fields = criterion_fields.find(:xpath, 'node()[contains(@class, "alternatives") and last()]/node()[contains(@class, "fields") and last()]')
  fields.fill_in 'Label', :with => label
end
