const message = require('../helpers/message')

const toolPrompts = [
  {
    type: 'input',
    name: 'projectversion',
    message: message({
      headline: 'Project Version',
      description: 'The Version Number',
      defaultValue: false
    }),
    default: '0.0.1'
  },
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
  },
  {
    type: 'input',
    name: 'projecturl',
    message: message({
      headline: 'Project Repository URL',
      description: 'Web-Adress for the Repository',
      defaultValue: false
    })
  }
]

module.exports = toolPrompts
