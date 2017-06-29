/**
 * Essential JS for ContentBuilder
 */
import progressLoader from './progressLoader'
import initPhotoSwipeFromDOM from './init-photoswipe' // eslint-disable-line
import disqusLoader from './disqusComments'
import offCanvasToggle from './offcanvas-trigger'
import './init-heighttransition'
import './init-autoscroll'
import './flickity-package'

// Init Photoswipe
initPhotoSwipeFromDOM('.is-photoswipped')

// Activate Progressloader
progressLoader()

// Activate Disqus Button
disqusLoader('.c-disqusComments__button')

// Add Offcanvas Trigger
offCanvasToggle('.c-offCanvas__trigger')
