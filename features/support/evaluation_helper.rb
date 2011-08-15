module EvaluationHelper
  def criteria_fields(context = page)
    context.all(:xpath, fields('evaluation', 'criteria'))
  end

  def criterion_fields(prompt)
    input = all(:xpath, tabular_field('Prompt')).find { |input| input.value == prompt }
    assert input, "Could not find criterion with prompt: #{prompt}"
    fields_for(input)
  end

  def last_criterion_blank
    fields = criteria_fields.last
    fields && fields.all('input[type!=hidden]').all? { |input| input.value.blank? }
  end

  def alternatives_fields(context = page)
    context.all(:xpath, fields('evaluation', 'criteria', 'alternatives'))
  end

  def alternative_fields(label)
    input = all(:xpath, tabular_field('Label')).find { |input| input.value == label }
    assert input, "Could not find alternative with label: #{label}"
    fields_for(input)
  end

  def last_alternative_blank
    fields = alternatives_fields.last
    fields && fields.all('input[type!=hidden]').all? { |input| input.value.blank? }
  end
end

World(EvaluationHelper)
