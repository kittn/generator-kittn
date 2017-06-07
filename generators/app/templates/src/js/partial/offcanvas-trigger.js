/**
 * Open and Close the OffCanvas Area
 *
 * @example
 * offCanvasToggle('offcanvas-trigger---open', 'offcanvas-trigger---close');
 *
 * @param   {string} button Classname from the Trigger Element
 */

const offCanvasToggle = (open, close) => {

  const $buttonClose = document.getElementsByClassName(close)[0]
  const $buttonOpen = document.getElementsByClassName(open)[0]
  const $root =  document.getElementsByTagName('body')[0]


  // Close Event
  $buttonClose.addEventListener('click', function(event) {
    // Prevent Default Clicks
    event.preventDefault()

    // Toggle the ToggleClass
    $root.classList.remove('is-offcanvas')
    $buttonClose.classList.remove('is-offcanvas')
    $buttonOpen.classList.remove('is-offcanvas')
  });

  // Open Event
  $buttonOpen.addEventListener('click', function(event) {
    // Prevent Default Clicks
    event.preventDefault()

    // Toggle the ToggleClass
    $root.classList.add('is-offcanvas')
    $buttonClose.classList.add('is-offcanvas')
    $buttonOpen.classList.add('is-offcanvas')
  })
}

module.exports = offCanvasToggle
