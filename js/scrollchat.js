window.onload = function() {
  var element = document.documentElement;
  var bottom = element.scrollHeight - element.clientHeight;
  element.scrollTop = bottom;
}