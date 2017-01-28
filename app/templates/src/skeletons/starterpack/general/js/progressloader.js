/**
 * Progress Loader Elements
 * @type {{body: *, holder: Element}}
 */
const pelements = {
  body: document.getElementsByTagName('body')[0],
  holder: document.querySelector('.canvas'),
  barOuter: document.querySelector('.o-progressloader'),
  barInner: document.querySelector('.o-progressloader__loader'),
  states: {
    loading: 'o-progressloader--load',
    interact: 'o-progressloader--interact',
    complete: 'o-progressloader--complete'
  },
  barstates: {
    loading: 'o-progressloader--bar--load',
    complete: 'o-progressloader--bar--complete'
  }
}

/**
 * Initial Loading Function
 */
const stateLoading = () => {
  // Give Body a initial Load Class
  pelements.body.className += pelements.states.loading

  // Activate the Bar Element with adding a Class
  pelements.barInner.className += ' ' + pelements.barstates.loading
}

/**
 * Interactive State Function
 */
const stateInteractive = () => {
  pelements.body.classList.remove(pelements.states.loading)
  pelements.body.classList.add(pelements.states.interact)
}

/**
 * Complete State Function
 */
const stateComplete = () => {
  // Change Classes for the Progressbar
  pelements.barInner.classList.remove(pelements.barstates.loading)
  pelements.barInner.classList.add(pelements.barstates.complete)

  // After a small Timeout toggle the Body Class
  setTimeout(() => {
    pelements.body.classList.remove(pelements.states.interact)
  pelements.body.classList.add(pelements.states.complete)
}, 300)
}

/**
 * Progress Loader
 */
const progressLoader = () => {
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

module.exports = progressLoader
