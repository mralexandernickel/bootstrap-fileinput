$ = jQuery

methods =
  init: (options) ->
    for el in $(this)
      $el = $(el)
      $feedback_el = $el.prev ".uneditable-input"
      input_el = $("<input type=\"file\" class=\"fileinput-input\" />")
      input_el.hover ->
        input_el.next(".fileinput").toggleClass "hover"
      .change ->
        $feedback_el.text methods.get_basename $(this).val()
      input_el.insertBefore $el
  get_basename: (path) ->
    unix_style = path.split "/"
    if unix_style.length > 1
      name = unix_style[unix_style.length-1]
    else
      windows_style = path.split "\\"
      name = windows_style[windows_style.length-1]

$.fn.fileinput = (method,options...) ->
  if methods[method]
    methods[method].apply this, options
  else if typeof method is "object" or not method
    methods.init.apply this, arguments
  else
    $.error "Method " + method + " does not exist in Bootstrap Fileinput Plugin"
