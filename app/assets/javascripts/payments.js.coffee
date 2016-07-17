ready = ->
  $('#payments').DataTable({
    initComplete: ->
      this.api().columns('#months').every ->
        column = @
        console.log(column)
        select = $('<select><option value=""></option></select>').appendTo($(column.header()).empty()).on('change', ->
          val = $.fn.dataTable.util.escapeRegex($(this).val())
          val = if val then "^#{val}$" else ''
          column.search(val, true, false).draw()
        )

        column.data().unique().sort().each (d) ->
          select.append '<option value="' + d + '">' + d + '</option>'
  })


# I don't know how to fix turbolinks, it will be better to create this table using Angular
# http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper

$(document).ready(ready)
$(document).on "page:change", ready
#$(document).on "turbolinks:load", ready - only for turbolinks 5
