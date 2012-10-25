// Generated by CoffeeScript 1.3.3
(function() {
  var $, methods,
    __slice = [].slice;

  $ = jQuery;

  methods = {
    init: function(options) {
      var $el, $feedback_el, el, input_el, _i, _len, _ref, _results;
      _ref = $(this);
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        el = _ref[_i];
        $el = $(el);
        $feedback_el = $el.prev(".uneditable-input");
        input_el = $("<input type=\"file\" class=\"filechoose-input\" />");
        input_el.hover(function() {
          return input_el.next(".filechoose").toggleClass("hover");
        }).change(function() {
          return $feedback_el.text(methods.get_basename($(this).val()));
        });
        _results.push(input_el.insertBefore($el));
      }
      return _results;
    },
    get_basename: function(path) {
      var name, unix_style, windows_style;
      unix_style = path.split("/");
      if (unix_style.length > 1) {
        return name = unix_style[unix_style.length - 1];
      } else {
        windows_style = path.split("\\");
        return name = windows_style[windows_style.length - 1];
      }
    }
  };

  $.fn.fileinput = function() {
    var method, options;
    method = arguments[0], options = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    if (methods[method]) {
      return methods[method].apply(this, options);
    } else if (typeof method === "object" || !method) {
      return methods.init.apply(this, arguments);
    } else {
      return $.error("Method " + method + " does not exist in Bootstrap Fileinput Plugin");
    }
  };

}).call(this);