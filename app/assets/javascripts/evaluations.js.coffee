# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

evaluation_form = null

criterion_fields = ->
  $('.fields.criterion:visible', evaluation_form)

alternative_fields = (criterion) ->
  $('.fields.alternative:visible', criterion)

add_criteria = ->
  $('a.add_nested_fields[data-association=criteria]', evaluation_form).click()

add_alternative = (criterion) ->
  $('a.add_nested_fields[data-association=alternatives]', criterion).click()

remove_fields_link = (context) ->
  $('> td.delete > a.remove_nested_fields', context)

update_delete_links = (context) ->
  if context.hasClass('criterion')
    fields = criterion_fields()
  else if context.hasClass('alternative')
    fields = alternative_fields(context.closest('.criterion.fields'))
  else return

  switch fields.length
    when 0 then return
    when 1 then remove_fields_link(fields[0]).hide()
    else remove_fields_link(fields[0]).show()

$(document).ready ->
  evaluation_form = $('section.evaluation form[class$=evaluation]')

  evaluation_form.live "nested:fieldAdded", (event) ->
    add_alternative(event.field) if event.field.hasClass('criterion')
    update_delete_links($(event.field))

  evaluation_form.live "nested:fieldRemoved", (event) ->
    update_delete_links($(event.field))

  switch criterion_fields().length
    when 0 then add_criteria()
    when 1 then update_delete_links(criterion_fields().eq(0))
