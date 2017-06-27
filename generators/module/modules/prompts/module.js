// Importing message helper function
const message = require('../../helpers/prompts/message')
const when = require('../../helpers/prompts/when')

const promptsModule = [
  {
    type: 'input',
    name: 'moduleName',
    message: message({
      headline: 'Module Name',
      description: 'Please provide module name:',
      defaultValue: false
    }),
    default: "example",
    validate(input) {
      // Do async stuff
      if (input.indexOf(' ') >= 0) {
        // Pass the return value in the done callback
        return `${chalk.styles.red.open}
No whitespaces allowed!${chalk.styles.red.close}`
      }
      return true
    }
  },
  {
    type: 'list',
    name: 'moduleType',
    message: message({
      headline: 'Module Type',
      description: 'Please provide the desired module type',
      defaultValue: false
    }),
    choices: [
      {
        name: 'Compontent',
        value: 'c'
      },
      {
        name: 'Object',
        value: 'o'
      }
    ],
    default: 'c',
    store: false
  }
]

module.exports = promptsModule
