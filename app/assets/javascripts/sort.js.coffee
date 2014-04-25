jQuery ->

  # this is a small hack; when a tr is dragged with jQuery UI sortable
  # the cells lose their width
  # cells = $('.table').find('tr')[0].cells.length
  # desired_width = 940 / cells + 'px'
  # $('.table td').css('width', desired_width)

  $('.sortable').sortable(
    axis: 'y'
    items: '.item'
    handle: '.handle'
    scroll: true
    update: (e, ui) ->
      item_id = ui.item.data('item-id')
      position = ui.item.index()
      $.ajax(
        type: 'POST'
        url: $(this).data('sort-url')
        dataType: 'json'
        # the :thing hash gets passed to @thing.attributes
        # row_order is the default column name expected in ranked-model
        data: $(this).sortable('serialize')
      )
  )
