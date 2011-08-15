# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

evaluation_form = null

criterion_fields = (context) ->
  $('.fields.criterion:visible', context)

alternative_fields = (context) ->
  $('.fields.alternative:visible', context)

add_criteria = (context) ->
  $('a.add_nested_fields[data-association=criteria]', context).click()

add_alternative = (context) ->
  $('a.add_nested_fields[data-association=alternatives]', context).click()

remove_fields_link = (context) ->
  $('> td.delete > a.remove_nested_fields', context)

update_delete_links = (context) ->
  if context.hasClass('criterion')
    fields = criterion_fields(evaluation_form)
  else if context.hasClass('alternative')
    fields = alternative_fields(context.closest('.criterion.fields'))
  else return

  if fields.length == 1
    remove_fields_link(fields[0]).hide()
  else if fields.length > 1
    remove_fields_link(fields[0]).show()


$(document).ready ->
  evaluation_form = $('section.evaluation form[id$=evaluation]')

  evaluation_form.live "nested:fieldAdded", (event) ->
    add_alternative(event.field) if event.field.hasClass('criterion')
    update_delete_links(event.field)

  evaluation_form.live "nested:fieldRemoved", (event) ->
    update_delete_links(event.field)

  add_criteria(evaluation_form) unless criterion_fields(evaluation_form).length
