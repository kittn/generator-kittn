const message = require('../../../helpers/prompts/message')

const toolPrompts = [
  {
    type: 'input',
    name: 'projectauthor',
    message: message({
      headline: 'Project Author',
      description: 'Project Author Name or Company',
      defaultValue: false
    })
  },
  {
    type: 'input',
    name: 'projectmail',
    message: message({
      headline: 'Project Mail',
      description: 'Mailadress from the Author',
      defaultValue: false
    })
  }
]

module.exports = toolPrompts
