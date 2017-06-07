const general = require('./partials/_general')
const style = require('./partials/_style')
const projecttype = require('./partials/_projecttype')

function prompts () {
  return [
    ...general,
    ...style,
    ...projecttype
  ]
}

module.exports = prompts
