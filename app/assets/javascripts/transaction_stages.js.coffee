jQuery ->
  $('.transaction_stages_sort').sortable(
    axis: 'y',
    update: ->
      $.ajax({
        url: location.pathname + '/sort',
        type: 'post',
        data: $('.transaction_stages_sort').sortable('serialize'),
        dataType: 'script',
        success: ->
          $('.save_status').html('Changes saved').effect("highlight")
        error: ->
          $('.save_status').html('Error').effect("highlight")
      })
  )

  if $("#new_story_stage").length > 0
    $('.system_fieldset .existing_system_info').hide()
  $('.system_fieldset .new_system_info').hide()
  $('.system_fieldset .system_detailed_info').hide()
  $('.system_detailed_info .computer_fields').hide()

  $('.system_fieldset .edit_details_link').click( -> 
    $(this).parents('.new_existing_system').find('.system_detailed_info').toggle()
    false
  )

  $('.system_fieldset .new_existing_selector input').on("click", ->
    system_block = $(this).parents('.system_fieldset')
    if $(this).val() == 'existing'
      system_block.find('.existing_system_info').show()
      system_block.find('.new_system_info').hide()
    else if $(this).val() == 'new'
      system_block.find('.existing_system_info').hide()
      system_block.find('.new_system_info').show()
  )

  $('.system_detailed_info .type_select').on("click", ->
    val = $(this).find(':radio:checked').val()
    if val == "Staff user" || val == "Citizen user"
      $(this).parents('.system_detailed_info').find('.computer_fields').hide()
    else
      $(this).parents('.system_detailed_info').find('.computer_fields').show()
  )