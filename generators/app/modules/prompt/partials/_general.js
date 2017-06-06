const message = require('../../../helpers/prompts/message')

const generalPrompts = [
  {
    type: 'input',
    name: 'projectName',
    message: message({
      headline: 'Project Name',
      description: 'Please give the project a name (without Spaces)',
      defaultValue: false
    }),
    store: true
  },
  {
    type: 'input',
    name: 'projectDescription',
    message: message({
      headline: 'Project Description',
      description: 'Description of the project',
      defaultValue: false
    }),
    store: true
  }
]

module.exports = generalPrompts
