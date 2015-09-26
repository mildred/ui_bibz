#= require jquery2
#= require jquery_ujs
# Remove bootstrap-4.0.0-alpha.min when gem boostrap 4 is created
#= require bootstrap-4.0.0-alpha.min
#= require bootstrap-datepicker.min
#= require bootstrap-select.min
#= require bootstrap-switch.min

# For turbolink
$(document).on 'ready page:load', ->

  # Submit form when per_page select changing
  $('.table-pagination-per-page select').change () ->
    $(this).parents('form').submit()

  # Clear search
  $('.table-search-field .clear-search-btn').click () ->
    $(this).prev().val('')
    $(this).parents('form').submit()

  # Resize search field
  $('.table-panel input[type=search]').blur ->
    $parent = $(this).parent()
    $parent.removeClass('has-value') if $(this).val() == ''
    $parent.removeClass('is-focused')

  $('.table-panel input[type=search]').focus ->
    $(this).parent().addClass('is-focused has-value')

  $('.table-panel input[type=search]').each ->
    $(this).parent().addClass('has-value') if $(this).val() != ''

  $('.selectpicker').selectpicker()

  $('.switch').bootstrapSwitch()
