# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

add_criteria = (form) ->
  $('a.add_nested_fields[data-association=criteria]', form).click();

add_alternative = (criterion) ->
  $('a.add_nested_fields[data-association=alternatives]', criterion).click();

$(document).ready ->
  form = $('section.evaluation form[id$=evaluation]')
  form.live "nested:fieldAdded", (event) ->
    add_alternative(event.field) if event.field.hasClass('criterion')
  add_criteria(form) if $('.criterion.fields', form).length == 0
