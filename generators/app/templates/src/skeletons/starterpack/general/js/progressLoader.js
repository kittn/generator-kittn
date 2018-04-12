/**
 * Progress Loader Elements
 * @type {{body: *, holder: Element}}
 */
const ple = {
  body: document.getElementsByTagName('body')[0],
  html: document.getElementsByTagName('html')[0],
  barOuter: document.querySelector('.c-progressLoader'),
  barInner: document.querySelector('.c-progressLoader__loader'),
  states: {
    loading: 'c-progressLoader--load',
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
  ple.body.classList.add(ple.states.loading)
  // Activate the Bar Element with adding a Class
  ple.barInner.classList.add(ple.barstates.loading)
}

/**
 * Complete State Function
 */
const stateComplete = () => {
  // Change Classes for the Progressbar
  ple.barInner.classList.remove(ple.barstates.loading)
  ple.barInner.classList.add(ple.barstates.complete)

  // After a small Timeout toggle the Body Class
  setTimeout(() => {
    ple.body.classList.add(ple.states.complete)
  }, 700)
}

const onLoad = (loading, loaded) => {
  if (document.readyState === 'complete') {
    return loaded()
  }
  loading()
  if (window.addEventListener) {
    window.addEventListener('load', loaded, false)
  } else if (window.attachEvent) {
    window.attachEvent('onload', loaded)
  }
}
/**
 * Progress Loader
 */
const progressLoader = () => {
  // Disable Progressloader on Craft Livepreview
  if (!ple.body.classList.contains('is-livepreview') && ple.html.classList.contains('plj')) {
    onLoad(
      () => {
        stateLoading()
      },
      () => {
        setTimeout(() => {
          stateComplete()
        }, 0)
      }
    )
  }
}

module.exports = progressLoader
