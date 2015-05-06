$ = jQuery

methods =
  init: (options) ->
    for el in $(this)
      $el = $(el)
      formgroup = $el.closest(".form-group")
      $feedback_el = formgroup.find ".feedback"
      input_el = formgroup.find "input.fileinput-input"
      input_el.hover ->
        $el.toggleClass "hover"
      .change ->
        $feedback_el.val methods.get_basename $(this).val()
      input_el.insertBefore $el
  get_basename: (path) ->
    unix_separator = path.split "/"
    if unix_separator.length > 1
      name = unix_separator[unix_separator.length-1]
    else
      windows_separator = path.split "\\"
      name = windows_separator[windows_separator.length-1]

$.fn.fileinput = (method,options...) ->
  if methods[method]
    methods[method].apply this, options
  else if typeof method is "object" or not method
    methods.init.apply this, arguments
  else
    $.error "Method " + method + " does not exist in Bootstrap Fileinput Plugin"
