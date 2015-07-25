/**
 * Open and Close the OffCanvas Area
 *
 * @example
 * offCanvasToggle('offcanvasTrigger');
 *
 * @param   {string} button Classname from the Trigger Element
 */
var offCanvasToggle = function(button) {

  var $button = document.getElementsByClassName(button)[0];
  var $root =  document.getElementsByTagName('body')[0];

  if ($button) {
    // Bind Eventhandler
    $button.addEventListener('click', function(event) {
      // Prevent Default Clicks
      event.preventDefault();

      // Toggle the ToggleClass
      $root.classList.toggle('is-offCanvas');
      $button.classList.toggle('is-offCanvas');
    });

  } else {
    console.log('Function offCanvasToggle Fail. Button: (' + button + ') not exist. Please use the right classname.');
    return false;
  }
};
