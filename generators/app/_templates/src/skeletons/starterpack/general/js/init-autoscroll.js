import anchorScroll from 'anchor-scroll'

// For Smooth Scrolling Jump Navigation
anchorScroll.init({
  updateUrl: true,
  offset: 0,
  ease: 'inCube',
  duration: 1000,
  selector: '.js-smooth-scroll'
})
