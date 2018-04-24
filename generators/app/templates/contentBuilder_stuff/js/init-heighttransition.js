import transition from 'transition-to-from-auto'

/* eslint-disable */
// Trigger for the Slideout Box
if (document.querySelector('.c-slideoutbox__trigger') !== null) {
  const items = document.querySelectorAll('.c-slideoutbox')
  for (let i = 0; i < items.length; i++) {
    const item = items[i]
    const trigger = item.querySelector('.c-slideoutbox__trigger')
    trigger.addEventListener('click', function (el) {
      const eventTarget = el.target || el.srcElement
      const classes = eventTarget.classList
      const slideElement = eventTarget.parentElement.parentElement.querySelector('.c-slideoutbox__body')

      if (classes.contains('is-open')) {
        classes.remove('is-open')

        transition({
          element: slideElement,
          val: '0px'
        })
      } else {
        classes.add('is-open')

        transition({
          element: slideElement,
          val: 'auto'
        })
      }
    })
  }
}

// Trigger for the Slideout Box
if (document.querySelector('.c-accordion__trigger') !== null) {
  const items = document.querySelectorAll('.c-accordion')
  for (let i = 0; i < items.length; i++) {
    const item = items[i]
    const triggers = item.querySelectorAll('.c-accordion__trigger')
    triggers.forEach(function (item) {
      item.addEventListener('click', function (el) {
        const eventTarget = el.target || el.srcElement
        const classes = eventTarget.classList
        const slideElement = eventTarget.parentElement.querySelector('.c-accordion__body')

        if (classes.contains('is-open')) {
          classes.remove('is-open')

          transition({
            element: slideElement,
            val: '0px'
          })
        } else {
          classes.add('is-open')

          transition({
            element: slideElement,
            val: 'auto'
          })
        }
      })
    })
  }
}
