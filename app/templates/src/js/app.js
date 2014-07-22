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

// TODO: Include here a note
// Mobile IE Viewport Fix
// if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
//   var msViewportStyle = document.createElement('style');
//   msViewportStyle.appendChild(
//     document.createTextNode(
//       '@-ms-viewport{width:auto!important}'
//     )
//   );
//   document.querySelector('head').appendChild(msViewportStyle);
// }

// Conditionizr Init
conditionizr({
  debug: false,
  scriptSrc: false,
  styleSrc: false,
  ieLessThan: {active: true, version: "9", scripts: false, styles: false, classes: true, customScript: false },
  chrome: {scripts: false, styles: false, classes: true, customScript: false },
  safari: {scripts: false, styles: false, classes: true, customScript: false },
  opera: {scripts: false, styles: false, classes: true, customScript: false },
  firefox: {scripts: false, styles: false, classes: true, customScript: false },
  ie10: {scripts: false, styles: false, classes: true, customScript: false },
  ie9: {scripts: false, styles: false, classes: true, customScript: false },
  ie8: {scripts: false, styles: false, classes: true, customScript: false },
  ie7: {scripts: false, styles: false, classes: true, customScript: false },
  ie6: {scripts: false, styles: false, classes: true, customScript: false },
  retina: {scripts: false, styles: false, classes: true, customScript: false },
  touch: {scripts: false, styles: false, classes: false, customScript: false },
  mac: true,
  win: true,
  x11: true,
  linux: true
});
