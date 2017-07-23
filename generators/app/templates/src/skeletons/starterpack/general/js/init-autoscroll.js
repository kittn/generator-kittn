import anchorScroll from 'anchor-scroll'

const trigger = document.querySelector('.js-smooth-scroll')

if (trigger !== null) {
  // For Smooth Scrolling Jump Navigation
  anchorScroll.init({
    updateUrl: true,
    offset: 0,
    ease: 'inCube',
    duration: 1000,
    selector: '.js-smooth-scroll'
  })
}
