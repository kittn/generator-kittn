const _ = require('lodash')

module.exports = function ({ transitionDuration, transitionTiming, transitionProperty, variants }) {
  return function ({ addUtilities, e }) {
    const transitionTiming = _.map(transitionTiming, (value, key) => {
      return {
        [`.t-timing-${e(key)}`]: {
          'transition-timing-function': value
        }
      }
    })
    const transitionDuration = _.map(transitionDuration, (value, key) => {
      return {
        [`.t-duration-${e(key)}`]: {
          'transition-duration': value
        }
      }
    })

    const transitionProperty = _.map(transitionProperty, (value, key) => {
      return {
        [`.t-property-${e(key)}`]: {
          'transition-property': value
        }
      }
    })

    addUtilities(transitionTiming, variants)
    addUtilities(transitionDuration, variants)
    addUtilities(transitionProperty, variants)
  }
}
