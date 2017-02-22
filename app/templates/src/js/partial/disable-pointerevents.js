/**
 * Disable Pointer Events when the Page Scroll
 * @type {HTMLElement}
 */
let body = document.body, timer

window.addEventListener('scroll', () => {
  clearTimeout(timer)
  if (!body.classList.contains('disable-hover')) {
    body.classList.add('disable-hover')
  }
  timer = setTimeout(() => {
    body.classList.remove('disable-hover')
  }, 500)
}, false)
