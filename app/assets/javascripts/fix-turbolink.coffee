# Fix turbolink issues#21
# https://github.com/thooams/Ui-Bibz/issues/21
$(document).ready ->
  $(document).on 'page:change', ->
    $('.dropdown-toggle').dropdown()
    # Fix dropdown toggle
    $('.switch').bootstrapSwitch()
    # Fix switch field
    $('.multi-select').multiSelect()
    # Fix multiselect
    return
