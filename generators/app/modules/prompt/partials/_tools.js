const message = require('../helpers/message')

const toolPrompts = [
  {
    type: 'confirm',
    name: 'projectastrum',
    message: message({
      headline: 'Astrum Pattern Lib',
      description: 'Would you like to build up your Pattern Library with Astrum?',
      defaultValue: false
    }),
    default: false
  },
  {
    type: 'confirm',
    name: 'projectsassdocs',
    message: message({
      headline: 'Sass Docs',
      description: 'Do you want to create sass documentations?',
      defaultValue: false
    }),
    default: false
  }
]

module.exports = toolPrompts
