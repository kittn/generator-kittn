const chalk = require('chalk')
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
    default () {
      return process.cwd()
                .split('/')
                .pop(-1)
                .toLowerCase()
                .replace(/\s/g, '')
    },
    validate (input) {
        // Do async stuff
      if (input.indexOf(' ') >= 0 || /[~`!#$%^&*+=[\]\\';,/{}|\\":<>?]/g.test(input)) {
            // Pass the return value in the done callback
        return `${chalk.styles.red.open}
No whitespaces or special-chars allowed!${chalk.styles.red.close}`
      }
      return true
    },
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
