// Loading Function for Modernizr
function loadJS(u) {
  var r = document.getElementsByTagName("script")[0],
      s = document.createElement("script");
  s.src = u;r.parentNode.insertBefore(s,r);
}

(function() {
  // Modernizr Load Fallback for responsive Image
  if(!Modernizr.picture) {
    loadJS('assets/js/ls.respimg.min.js');
  }

})();
