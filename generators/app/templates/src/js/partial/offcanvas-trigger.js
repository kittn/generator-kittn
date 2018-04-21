/**
 * Open and Close the OffCanvas Area
 *
 * @example
 * offCanvasToggle('offcanvas-trigger---open', 'offcanvas-trigger---close');
 *
 * @param   {string} button Classname from the Trigger Element
 */
const offCanvasToggle = (open, close) => {
  const buttonClose = document.getElementsByClassName(close)[0]
  const buttonOpen = document.getElementsByClassName(open)[0]
  const root = document.querySelector('.c-offCanvas')
  // Close Event
  buttonClose.addEventListener('click', (event) => {
    // Prevent Default Clicks
    event.preventDefault()

    // Toggle the ToggleClass
    root.classList.remove('offcanvas-active')
  })

  // Open Event
  buttonOpen.addEventListener('click', (event) => {
    // Prevent Default Clicks
    event.preventDefault()

    // Toggle the ToggleClass
    root.classList.add('offcanvas-active')
  })
}

export default offCanvasToggle
