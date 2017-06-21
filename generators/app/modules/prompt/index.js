const general = require('./partials/_general')
const style = require('./partials/_style')
const projecttype = require('./partials/_projecttype')
const script = require('./partials/_script')
const tools = require('./partials/_tools')
const project = require('./partials/_project')

function prompts (context) {
  return [
    ...general,
    ...style,
    ...projecttype(context),
    ...script,
    ...tools,
    ...project
  ]
}

module.exports = prompts
