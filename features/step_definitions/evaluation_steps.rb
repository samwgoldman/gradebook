When /^I add a criterion "([^"]*)"$/ do |prompt|
  click_link 'Add Criterion'
  criteria_fields.last.find(:xpath, tabular_field('Prompt')).set(prompt)
end

When /^I remove the criterion "([^"]*)"$/ do |prompt|
  criterion_fields(prompt).click_link 'Remove Criterion'
end

When /^I add an alternative "([^"]*)"$/ do |label|
  criterion_fields = criteria_fields.last
  criterion_fields.click_link 'Add Alternative'
  alternative_fields = alternatives_fields(criterion_fields).last
  alternative_fields.find(:xpath, tabular_field('Label')).set(label)
end

When /^I remove the alternative "([^"]*)"$/ do |label|
  alternative_fields(label).click_link 'Remove Alternative'
end
