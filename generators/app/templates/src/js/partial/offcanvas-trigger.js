/**
 * Open and Close the OffCanvas Area
 *
 * @example
 * offCanvasToggle('.c-offcanvas__trigger');
 *
 * @param   {string} button Classname from the Trigger Element
 */

const offCanvasToggle = (button) => {
  const trigger = document.querySelector(button)
  const root = document.getElementsByTagName('body')[0]

  if (trigger !== null) {
    trigger.addEventListener('click', (event) => {
      // Prevent Default Clicks
      event.preventDefault()

      // Toggle the ToggleClass
      root.classList.toggle('offcanvas-active')
      trigger.classList.toggle('offcanvas-active')
    })
  }
}

module.exports = offCanvasToggle

