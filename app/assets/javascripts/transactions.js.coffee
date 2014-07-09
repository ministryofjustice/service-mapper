# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.multi_select').chosen()
  $('.multi_select_with_create').chosen({create_option: true, persistent_create_option: true, skip_no_results: true})

  $('form.auto_submit').change(-> this.submit())
  $('form.auto_submit input[type=submit]').hide()