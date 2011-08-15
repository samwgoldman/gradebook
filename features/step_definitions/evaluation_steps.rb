When /^I add a criterion "([^"]*)"$/ do |prompt|
  click_link 'Add Criterion' unless last_criterion_blank
  criteria_fields.last.find(:xpath, tabular_field('Prompt')).set(prompt)
  criteria_fields.last.find(:xpath, tabular_field('Order')).set(criteria_fields.count + 1)
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

Then /^I am told (\w+(?: \w+)*) "([^"]*)"$/ do |association_chain, error|
  association_chain = association_chain.split
  attribute = association_chain.pop.singularize
  all(:xpath, fields(*association_chain)).each do |fields|
    cell = fields.find(:xpath, ".//input[#{ends_with('@id', attribute)}]/ancestor::td[1]")
    cell.should have_content(error)
  end.should_not be_empty
end

Then /^I should see fields for (\w+(?: \w+)*)$/ do |association_chain|
  association_chain = association_chain.split
  all(:xpath, fields(*association_chain)).length.should eq(1)
end

Then /^I should not see delete links for (\w+(?: \w+)*)$/ do |association_chain|
  association_chain = association_chain.split
  all(:xpath, fields(*association_chain)).each do |fields|
    link_locator = 'Remove ' + association_chain.last.singularize.titleize
    fields.find_link(link_locator).should_not be_visible
  end
end

Then /^I should see delete links for (\w+(?: \w+)*)$/ do |association_chain|
  association_chain = association_chain.split
  all(:xpath, fields(*association_chain)).each do |fields|
    link_locator = 'Remove ' + association_chain.last.singularize.titleize
    fields.find_link(link_locator).should be_visible
  end
end

def ends_with(target, substring)
  length = substring.length
  "\"#{substring}\" = substring(#{target}, string-length(#{target}) - #{length} + 1)"
end
