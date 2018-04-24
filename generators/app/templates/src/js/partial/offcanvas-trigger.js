/**
 * Open and Close the OffCanvas Area
 *
 * @example
 * offCanvasToggle('offcanvas-trigger---open', 'offcanvas-trigger---close');
 *
 * @param   {string} button Classname from the Trigger Element
 */
const offCanvasToggle = (open, close) => {
  const buttonClose = document.getElementsByClassName(close)
  const buttonOpen = document.getElementsByClassName(open)
  const root = document.querySelector('.c-offCanvas')

  if (buttonClose.length > 0) {
    // Close Event
    buttonClose[0].addEventListener('click', (event) => {
      // Prevent Default Clicks
      event.preventDefault()

      // Toggle the ToggleClass
      root.classList.remove('offcanvas-active')
    })

    // Open Event
    buttonOpen[0].addEventListener('click', (event) => {
      // Prevent Default Clicks
      event.preventDefault()

      // Toggle the ToggleClass
      root.classList.add('offcanvas-active')
    })
  }
}

export default offCanvasToggle
