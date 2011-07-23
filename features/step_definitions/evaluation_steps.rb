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
