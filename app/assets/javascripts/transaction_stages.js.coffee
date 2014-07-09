jQuery ->
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