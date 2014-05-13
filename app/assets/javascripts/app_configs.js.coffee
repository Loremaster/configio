# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  hide_string_input_and_erase_data = (wrapper) ->
    string_input = $("#app_config_value")
    wrapper.hide()
    string_input.val('') # remove data

  # Hide or show checkbox.
  # Input:
  #   action - 'hide' or 'show'
  bool_checkbox = (action) ->
    hidden_bool_checkbox_flag = $(".app_config_value input[type=hidden]")
    checkbox = $("#bool_app_config_value")
    hidden_bool_wrapper = $(".bool_app_config_value_wrapper")
    string_value_wrapper = $(".app_config_value_wrapper")

    if action is 'hide'
      # Disable checkbox.
      hidden_bool_checkbox_flag.prop('disabled', true)
      checkbox.prop('disabled', true)

      hidden_bool_wrapper.hide()
      string_value_wrapper.show()
    else
      # Enable checkbox.
      hidden_bool_checkbox_flag.prop('disabled', false)
      checkbox.prop('disabled', false)

      hidden_bool_wrapper.show()
      hide_string_input_and_erase_data(string_value_wrapper)

  toggle_inputs_by_selected_option = (selected_option) ->
    selected_option_text = selected_option.text()

    if selected_option_text is "boolean"
      bool_checkbox('show')
    else
      bool_checkbox('hide')

  manage_inputs_on_page_load = () ->
    selected_option = $("#app_config_value_type option:selected")
    toggle_inputs_by_selected_option(selected_option)

  manage_inputs_on_select_change = () ->
    $("#app_config_value_type").change ->
      selected_option = $(this).find("option:selected")
      toggle_inputs_by_selected_option(selected_option)

  manage_inputs_on_page_load()
  manage_inputs_on_select_change()

