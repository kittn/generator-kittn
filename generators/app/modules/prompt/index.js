const general = require('./partials/_general')

function prompts (context) {
  return [
    ...general(context)
  ]
}

module.exports = prompts
