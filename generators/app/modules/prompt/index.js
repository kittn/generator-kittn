const general = require('./partials/_general')
const style = require('./partials/_style')
const projecttype = require('./partials/_projecttype')
const script = require('./partials/_script')
const tools = require('./partials/_tools')
const project = require('./partials/_project')

function prompts () {
  return [
    ...general,
    ...style,
    ...projecttype,
    ...script,
    ...tools,
    ...project
  ]
}

module.exports = prompts
