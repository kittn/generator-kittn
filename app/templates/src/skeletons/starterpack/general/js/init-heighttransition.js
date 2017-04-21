import transition from 'transition-to-from-auto'

// Trigger for the Slideout Box
if (document.querySelector('.o-slideoutbox__trigger') !== null) {
  const items = document.querySelectorAll('.o-slideoutbox')
  for (let i = 0; i < items.length; i++) {
    const item = items[i]
    const trigger = item.querySelector('.o-slideoutbox__trigger')
    trigger.addEventListener('click', function(el) {
      const eventTarget = el.target || el.srcElement
      const classes = eventTarget.classList
      const slideElement = eventTarget.parentElement.parentElement.querySelector('.o-slideoutbox__body')

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
if (document.querySelector('.o-accordion__trigger') !== null) {
  const items = document.querySelectorAll('.o-accordion')
  for (let i = 0; i < items.length; i++) {
    const item = items[i]
    const triggers = item.querySelectorAll('.o-accordion__trigger')
    triggers.forEach(function(item) {
      item.addEventListener('click', function(el) {
        const eventTarget = el.target || el.srcElement
        const classes = eventTarget.classList
        const slideElement = eventTarget.parentElement.querySelector('.o-accordion__body')

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
