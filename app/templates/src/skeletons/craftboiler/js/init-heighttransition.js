import transition from 'transition-to-from-auto'

// Trigger for the Slideout Box
if (document.querySelector('.o-slideoutbox__trigger') !== null) {
  let slideOutBoxes = document.querySelectorAll('.o-slideoutbox')
  slideOutBoxes.forEach(function(item) {
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
  })
}

// Trigger for the Slideout Box
if (document.querySelector('.o-accordion__trigger') !== null) {
  let slideOutBoxes = document.querySelectorAll('.o-accordion')
  slideOutBoxes.forEach(function(item) {
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
  })
}
