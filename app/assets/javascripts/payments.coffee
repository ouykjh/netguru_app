#FIXME: it is searching by selection from datatables manual but it's not working
ready= ->
  $('#payments').DataTable initComplete: ->
  @api().columns().every ->
    column = this
    select = $('<select><option value=""></option></select>').appendTo($(column.footer()).empty()).on('change', ->
      val = $.fn.dataTable.util.escapeRegex($(this).val())
      column.search(if val then '^' + val + '$' else '').draw()
      return
    )
    column.data().unique().sort().each (d, j) ->
      select.append '<option value="' + d + '">' + d + '</option>'
      return
    return
  return

# I don't know how to fix turbolinks, it will be better to create this table using Angular
# http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:change', ready)