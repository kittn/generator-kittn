// Main JS File

/**
 * Overspans an Element over the normal Page Borders.
 *
 * @param   {*} $slave  Target Element that need to overspans
 * @param   {*} $master Element that used for the max width
 */
function overspanElement($slave, $master) {
  function _overspanElement($slave, $master) {

    // Get the Dimensions
    var os = $($master).width();
    var os_e = $($slave).width();

    // Small Math
    var os_d = (os - os_e) / 2;

    // Write CSS Values
    $($slave).css({
                    'margin-left': 0 - os_d,
                    'margin-right': 0 - os_d,
                    'padding-right': os_d,
                    'padding-left': os_d
                });
  }

  // Start the Functions static
  _overspanElement($slave,$master);

  // Activate the Function again when the viewport
  // is resized
  $(window).resize(function() {
    _overspanElement($slave,$master);
  });
}

$(document).ready(function() {
  // Paste your JS here
});



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
