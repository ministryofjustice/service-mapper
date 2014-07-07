# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.multi_select').chosen()

  $('form.auto_submit').change(-> this.submit())
  $('form.auto_submit input[type=submit]').hide()