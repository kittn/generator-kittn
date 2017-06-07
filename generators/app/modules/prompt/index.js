const general = require('./partials/_general')
const style = require('./partials/_style')
const projecttype = require('./partials/_projecttype')
const script = require('./partials/_script')

function prompts () {
  return [
    ...general,
    ...style,
    ...projecttype,
    ...script
  ]
}

module.exports = prompts
