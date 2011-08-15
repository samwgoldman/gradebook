When /^I add a criterion "([^"]*)"$/ do |prompt|
  click_link 'Add Criterion' unless last_criterion_blank
  criteria_fields.last.find(:xpath, tabular_field('Prompt')).set(prompt)
end

When /^I remove the criterion "([^"]*)"$/ do |prompt|
  criterion_fields(prompt).click_link 'Remove Criterion'
end

When /^I add an alternative "([^"]*)"$/ do |label|
  criteria_fields.last.click_link 'Add Alternative' unless last_alternative_blank
  alternatives_fields.last.find(:xpath, tabular_field('Label')).set(label)
end

When /^I remove the alternative "([^"]*)"$/ do |label|
  alternative_fields(label).click_link 'Remove Alternative'
end

Then /^I am told (\w+(?: \w+)*) "([^"]*)"$/ do |model_or_association_chain, error|
  context = model_or_association_chain.split
  attribute = context.pop.singularize
  all(:xpath, fields(*context)).each do |fields|
    cell = fields.find(:xpath, ".//input[#{ends_with('@id', attribute)}]/ancestor::td[1]")
    cell.should have_content(error)
  end.should_not be_empty
end

Then /^I should see fields for (\w+(?: \w+)*)$/ do |model_or_association_chain|
  context = model_or_association_chain.split
  all(:xpath, fields(*context)).length.should eq(1)
end

def ends_with(target, substring)
  length = substring.length
  "\"#{substring}\" = substring(#{target}, string-length(#{target}) - #{length} + 1)"
end
