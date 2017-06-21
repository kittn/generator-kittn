const message = require('../helpers/message')
const when = require('../helpers/when')

const generalPrompts = [
  {
    type: 'list',
    name: 'projectjquery',
    message: message({
      headline: 'jQuery',
      description: 'Want to use jQuery?'
    }),
    choices: [
      {
        name: 'Nope',
        value: false
      },
      {
        name: 'Yeah (slim)',
        value: 'slim'
      },
      {
        name: 'Hell Yeah! (full)',
        value: 'full'
      }
    ],
    default: false,
    store: false
  },
  {
    type: 'list',
    name: 'projectjsframework',
    message: message({
      headline: 'JS Frameworks',
      description: 'Would you like to integrate a JS framework (Vue, React)?'
    }),
    choices: [
      {
        name: 'Nope',
        value: false
      },
      {
        name: 'Vue.js',
        value: 'vue'
      },
      {
        name: 'React',
        value: 'react'
      }
    ],
    default: false,
    store: false
  },
  {
    when: when('projectjsframework', 'vue'),
    type: 'confirm',
    name: 'projectvueplugins',
    message: message({
      headline: 'Vue.js Plugins',
      description: 'Do you need basic Vue.js Plugins? (Axios, vuex...)',
      defaultValue: true
    }),
    default: false
  },
  {
    when: when('projectjsframework', 'vue'),
    type: 'list',
    name: 'projectvueversion',
    message: message({
      headline: 'Vue.js Runtime',
      description: 'Vue Version. When you only use .vue Files Runtime is perfect,\n\xa0 if you need parsing from .html Files you need the Standalone Version.'
    }),
    choices: [
      {
        name: 'Runtime-Only',
        value: 'runtime'
      },
      {
        name: 'Standalone',
        value: 'standalone'
      }
    ],
    default: 'runtime',
    store: false
  }
]

module.exports = generalPrompts
