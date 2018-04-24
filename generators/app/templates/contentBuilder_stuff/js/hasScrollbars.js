/**
 * Check if Browser have scrollbars, in this case the width from the Scrollbar is written as CSS Var in the body tag
 * @type {Element}
 */
function handleWindow() {
  const body = document.querySelector('body')

  if (window.innerWidth > body.clientWidth + 5) {
    body.classList.add('has-scrollbar')
    body.setAttribute('style', '--scroll-bar: ' + (window.innerWidth - body.clientWidth) + 'px')
  } else {
    body.classList.remove('has-scrollbar')
  }
}

handleWindow()

window.addEventListener('resize', handleWindow)
