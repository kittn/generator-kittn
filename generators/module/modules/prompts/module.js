// Importing message helper function
const filesystem = require('fs-extra')
const message = require('../../helpers/prompts/message')
const when = require('../../helpers/prompts/when')
const config = './config.json'
const json = JSON.parse(filesystem.readFileSync(config, 'utf8'))
const pMeth = json.src.baseconf.methodology

const customPromptITCSS = {
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
      name: 'Contentbuilder Module',
      value: 'cb'
    },
    {
      name: 'Object',
      value: 'o'
    },
    {
      name: 'Element',
      value: 'e'
    }
  ],
  default: 'c',
  store: false
}

const customPromptAtomic =  {
  type: 'list',
  name: 'moduleType',
  message: message({
    headline: 'Module Type',
    description: 'Please provide the desired module type',
    defaultValue: false
  }),
  choices: [
    {
      name: 'Atom',
      value: 'a'
    },
    {
      name: 'Molecule',
      value: 'm'
    },
    {
      name: 'Organism',
      value: 'o'
    },
    {
      name: 'Template',
      value: 't'
    }
  ],
  default: 'm',
  store: false
}

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
    type: 'confirm',
    name: 'disableGenerateJS',
    message: message({
      headline: 'Javascript',
      description: 'Disable Javascript generation?',
      defaultValue: false
    }),
    default: false
  }
]

if (pMeth === 'sassAtomic') {
  promptsModule.push(customPromptAtomic)
} else {
  promptsModule.push(customPromptITCSS)
}

module.exports = promptsModule
