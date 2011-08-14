module FormHelper
  def fields_for(element)
    element.find(:xpath, "ancestor::node()[#{css_class('fields')}][1]")
  end

  def tabular_field(locator)
    header = "ancestor::table[1]/thead/tr/th[normalize-space(.) = '#{locator}']"
    preceding_cells = 'count(ancestor::td[1]/preceding-sibling::td)'
    preceding_headers = "count(#{header}/preceding-sibling::th)"
    ".//input[#{header} and #{preceding_cells} = #{preceding_headers}]"
  end

  def nested_fields(type)
    type_node = "node()[#{css_class(type)}]"
    ancestor_fields_of_type = "ancestor::node()[#{css_class('fields')} and ancestor::#{type_node}]"
    ".//#{type_node}//node()[#{css_class('fields')} and not(#{ancestor_fields_of_type})]"
  end

  def css_class(name)
    "contains(concat(' ', @class, ' '), ' #{name} ')"
  end
end

World(FormHelper)
