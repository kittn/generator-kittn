import transition from 'transition-to-from-auto'

// Trigger for the Slideout Box
if (document.querySelector('.o-slideoutbox__trigger') !== null) {
  let items = document.querySelectorAll('.o-slideoutbox')
  for (let i = 0; i < items.length; i++) {
    let item = items[i]
    let trigger = item.querySelector('.o-slideoutbox__trigger')
    trigger.addEventListener('click', function(el) {
      const classes = el.srcElement.classList
      const slideElement = el.srcElement.parentElement.parentElement.querySelector('.o-slideoutbox__body')

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
  let items = document.querySelectorAll('.o-accordion')
  for (let i = 0; i < items.length; i++) {
    let item = items[i]
    let triggers = item.querySelectorAll('.o-accordion__trigger')
    triggers.forEach(function(item) {
      item.addEventListener('click', function(el) {
        const classes = el.srcElement.classList
        const slideElement = el.srcElement.parentElement.querySelector('.o-accordion__body')

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
