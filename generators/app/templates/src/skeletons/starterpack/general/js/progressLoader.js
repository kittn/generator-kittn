/**
 * Progress Loader Elements
 * @type {{body: *, holder: Element}}
 */
const pelements = {
  body: document.getElementsByTagName('body')[0],
  holder: document.querySelector('.canvas'),
  barOuter: document.querySelector('.c-progressLoader'),
  barInner: document.querySelector('.c-progressLoader__loader'),
  states: {
    loading: 'c-progressLoader--load',
    interact: 'c-progressLoader--interact',
    complete: 'c-progressLoader--complete'
  },
  barstates: {
    loading: 'c-progressLoader--bar--load',
    complete: 'c-progressLoader--bar--complete'
  }
}

/**
 * Initial Loading Function
 */
const stateLoading = () => {
  // Give Body a initial Load Class
  pelements.body.className += ' ' + pelements.states.loading

  // Activate the Bar Element with adding a Class
  pelements.barInner.className += ' ' + pelements.barstates.loading
}

/**
 * Interactive State Function
 */
const stateInteractive = () => {
  pelements.body.classList.remove(pelements.states.loading)
  pelements.body.className += ' ' + pelements.states.interact
}

/**
 * Complete State Function
 */
const stateComplete = () => {
  // Change Classes for the Progressbar
  pelements.barInner.classList.remove(pelements.barstates.loading)
  pelements.barInner.className += ' ' + pelements.barstates.complete

  // After a small Timeout toggle the Body Class
  setTimeout(() => {
    pelements.body.classList.remove(pelements.states.interact)
    pelements.body.className += ' ' + pelements.states.complete
  }, 300)
}

/**
 * Progress Loader
 */
const progressLoader = () => {
  // Disable Progressloader on Craft Livepreview
  if (!pelements.body.classList.contains('is-livepreview') && document.getElementsByTagName('html')[0].classList.contains('plj')) {
    // Inital State
    stateLoading()

    // Interactive State
    stateInteractive()

    // Check Statechange to complete
    document.onreadystatechange = () => {
      if (document.readyState === 'complete') {
        stateComplete()
      }
    }
  }
}

module.exports = progressLoader
