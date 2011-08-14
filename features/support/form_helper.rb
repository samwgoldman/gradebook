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

  def fields(root, *association_chain)
    root = model_form(root.singularize)
    association_chain = association_chain.map do |association|
      "node()[#{css_class(association.singularize)} and #{css_class('fields')}]"
    end
    ".//" + association_chain.unshift(root).join('//')
  end

  def model_form(model_name)
    "form[#{css_class('edit_' + model_name)} or #{css_class('new_' + model_name)}]"
  end

  def css_class(name)
    "contains(concat(' ', @class, ' '), ' #{name} ')"
  end
end

World(FormHelper)
