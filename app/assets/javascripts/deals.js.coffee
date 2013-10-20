# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$(document).ready ->
  filter = ->
    types = _.map $(".vehicle_types input:checked"), (t) -> $(t).data('type')
    makes = _.map $("li.make input.make:checked"), (m) -> $(m).data('make')
    models = _.map $(".model input:checked"), (m) -> $(m).data('model')
    
    $(".row-fluid.deal").each (i, deal) ->
      type = $(deal).data('vehicle_type')
      make = $(deal).data('make')
      model = $(deal).data('model')
      hide = false
      hide = true unless _.contains(types, type)
      hide = true unless _.contains makes, make
      hide = true unless _.contains models, model
      if hide then $(deal).hide() else $(deal).show()

  $(".accordion-group .make").click ->
    input = $(this).find('input:first')
    if input.is(':checked')
      $(this).find('ul').show().find('input').attr('checked', true)
    else
      $(this).find('ul').hide().find('input').attr('checked', true)
    filter()
  $(".accordion-group .vehicle_types").click ->
    filter()
