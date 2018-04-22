/**
 * Essential JS for ContentBuilder
 */
import progressLoader from './progressLoader'
import initPhotoSwipeFromDOM from './init-photoswipe' // eslint-disable-line
// import disqusLoader from './disqusComments'
import offCanvasToggle from './offcanvas-trigger'
import './hasScrollbars'
import './init-heighttransition'
import './init-autoscroll'
import './flickity-package'
// import './searchbar'

// Init Photoswipe
initPhotoSwipeFromDOM('.is-photoswipped')

// Activate Progressloader
progressLoader()

// Activate Disqus Button
// disqusLoader('.c-disqusComments__button')

// Add Offcanvas Trigger
offCanvasToggle('o-offCanvasTrigger', 'c-offCanvas__close')

/* eslint-disable */
const videoEnded = () => {
  video.load()
}
