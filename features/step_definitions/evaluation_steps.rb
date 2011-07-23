Given /^an evaluation "([^"]*)" with the following criteria:$/ do |evaluation_name, criteria|
  Given %{an evaluation "eval" exists with name: "#{evaluation_name}"}
  criteria.hashes.each do |criterion|
    And %{a criterion exists with prompt: "#{criterion[:prompt]}", evaluation: evaluation "eval"}
  end
end

Given /^the criterion "([^"]*)" has the following alternatives:$/ do |criterion_prompt, alternatives|
  criterion = Criterion.find_by_prompt(criterion_prompt)
  assert criterion, "Could not find criterion with prompt: #{criterion_prompt}"
  alternatives.hashes.each do |alternative|
    criterion.alternatives.create(alternative)
  end
end

When /^I add a criterion "([^"]*)"$/ do |prompt|
  click_link 'Add Criterion'
  criteria = page.all('.criteria > .fields')
  criteria.last.fill_in 'Prompt', :with => prompt
end

When /^I remove the criterion "([^"]*)"$/ do |prompt|
  input = page.all(:xpath, XPath::HTML.field('Prompt')).find { |input| input.value == prompt }
  assert input, "Could not find criterion with prompt: #{prompt}"
  fields = input.find(:xpath, 'ancestor::node()[contains(@class, "fields")]')
  fields.click_link 'Remove Criterion'
end

When /^I add an alternative "([^"]*)"$/ do |label|
  criteria = page.all('.criteria > .fields')
  criteria.last.click_link 'Add Alternative'
  alternatives = criteria.last.all('.alternatives > .fields')
  alternatives.last.fill_in 'Label', :with => label
end

When /^I remove the alternative "([^"]*)"$/ do |label|
  input = page.all(:xpath, XPath::HTML.field('Label')).find { |input| input.value == label }
  assert input, "Could not find alternative with label: #{label}"
  fields = input.find(:xpath, 'ancestor::node()[contains(@class, "fields")]')
  fields.click_link 'Remove Alternative'
end
