/**
 * Modernizr Fallback Loader
 * @description It will loaded Global with Browserify Shim
 * The test are asynchron now
 * https://github.com/Modernizr/Modernizr#new-asynchronous-event-listeners
 */

// JS Loader
// https://github.com/pyrsmk/toast
import toast from 'pyrsmk-toast' // eslint-disable-line

// Get Hostname
const host = `//${window.location.hostname}`

if (typeof Modernizr !== 'undefined') {
  // Polyfill for Picture Element (Ie10 and IE11) needed for Lazysizes
  Modernizr.on('picture', (result) => { // eslint-disable-line
    if (!result) {
      toast(`${host}/assets/js/ls.respimg.js`)
    }
  })
}
