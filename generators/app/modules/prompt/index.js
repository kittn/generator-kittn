const general = require('./partials/_general')
const style = require('./partials/_style')

function prompts () {
  return [
    ...general,
    ...style
  ]
}

module.exports = prompts
