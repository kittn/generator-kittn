/**
 * Essential JS for ContentBuilder
 */
import offCanvasToggle from './offcanvas-trigger'
import progressLoader from './progressLoader'
import initPhotoSwipeFromDOM from './init-photoswipe' // eslint-disable-line
import flickityPackage from './flickity-package'
import initHeightTransition from './init-heighttransition'
// import searchBar from './searchbar'
import videoHelper from './videoHelper'
import './hasScrollbars'
import './init-autoscroll'

const contentBuilder = () => {
  // Init Searchbar
  // searchBar()

  // Init Height Transition
  initHeightTransition()

  // Init Flickity
  flickityPackage()

  // Init Photoswipe
  initPhotoSwipeFromDOM('.is-photoswipped')

  // Activate Progressloader
  progressLoader()

  // Add Offcanvas Trigger
  offCanvasToggle('o-offCanvasTrigger', 'c-offCanvas__close')

  // Load Videohelper - needed for the Videoelement for autoplay on scroll
  videoHelper()
}

export default contentBuilder
