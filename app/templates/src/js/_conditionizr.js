// Conditionizr Init
$(window).load(function() {
  conditionizr.config({
    tests: {
      'ie11': ['class'],
      'ie10': ['class'],
      'ie9': ['class'],
      'ie8': ['class'],
      'chrome': ['class'],
      'firefox': ['class'],
      'safari': ['class']
    }
  });
});
