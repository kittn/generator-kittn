/**
 * Open and Close the OffCanvas Area
 *
 * @example
 * offCanvasToggle('.c-offcanvas__trigger');
 *
 * @param   {string} button Classname from the Trigger Element
 */
import bowser from 'bowser'

const offCanvasToggle = (button) => {
  const trigger = document.querySelectorAll(button)
  const root = document.getElementsByTagName('body')[0]

  // =======================================
  // event type (if mobile use touch events)
  // =======================================
  const eventtype = bowser.mobile || bowser.tablet ? 'touchstart' : 'click'

  // =======================================
  // Check if there is a parent with
  // given classname
  // =======================================
  const hasParentClass = (e, classname) => {
    if (e === document) return false
    if (e.classList && e.classList.contains(classname)) {
      return true
    }
    return e.parentNode && hasParentClass(e.parentNode, classname)
  }

  // =======================================
  // Reset Offcanvas state
  // =======================================
  const resetMenu = () => {
    root.classList.remove('offcanvas-active')
    for (const el of trigger) {
      el.classList.remove('offcanvas-active')
    }
  }

  // =======================================
  // Check where the user clicked
  // Close Offcanvas if clicked outside
  // =======================================
  const bodyClickFn = (evt) => {
    if (!hasParentClass(evt.target, 'e-offcanvas')) {
      // Toggle the ToggleClass
      resetMenu()
      document.removeEventListener(eventtype, bodyClickFn)
    }
  }

  if (trigger !== null) {
    for (const el of trigger) {
      el.addEventListener('click', (event) => {
        // Prevent Default Clicks
        event.stopPropagation()
        event.preventDefault()

        // Toggle the ToggleClass
        root.classList.toggle('offcanvas-active')
        el.classList.toggle('offcanvas-active')

        document.addEventListener(eventtype, bodyClickFn)
      })
    }

    // =======================================
    // Close Offcanvas on ESC-Key
    // =======================================
    document.addEventListener('keyup', (event) => {
      if (event.which === 27) {
        resetMenu()
      }
    })
  }
}

export default offCanvasToggle
