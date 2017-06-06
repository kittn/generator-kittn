const message = require('../../../helpers/prompts/message')
const when = require('../../../helpers/prompts/when')

const generalPrompts = [
  {
    type: 'input',
    name: 'projectthemecolor',
    message: message({
      headline: 'Project Theme Color',
      description: 'Main Theme-Color of the project',
      defaultValue: 'Default: #29b8f2'
    }),
    default: '#29b8f2',
    store: true
  },
  // Filename
  {
    type: 'input',
    name: 'projectcssfilename',
    message: message({
      headline: 'CSS Filename',
      description: '(only the name without .css or .scss)',
      defaultValue: 'Default: style'
    }),
    default: 'style',
    store: false
  },
  // Syntax Style
  {
    type: 'list',
    name: 'projectsasssyntax',
    message: message({
      headline: 'Sass Compiler Syntax',
      description: 'Do you want to use indented syntax (sass) or Sassy CSS syntax (SCSS)'
    }),
    choices: [
      {
        name: 'SCSS',
        value: 'scss'
      },
      {
        name: 'Sass',
        value: 'sass'
      }
    ]
  },
  // Stylelint
  {
    when: when('projectsasssyntax', 'scss'),
    type: 'confirm',
    name: 'projectstylelint',
    message: message({
      headline: 'Activate Stylelint',
      description: 'Do you want to ativate Stylelint?',
      defaultValue: true
    }),
    default: true
  },
  // Breakpoint Units
  {
    type: 'list',
    name: 'projectbreakpointunit',
    message: message({
      headline: 'Media Query Unit',
      description: 'Which Unit do you prefer for Media Queries?'
    }),
    choices: [
      {
        name: 'em',
        value: 'em'
      },
      {
        name: 'px',
        value: 'px'
      }
    ]
  },
  // Container-Queries
  {
    type: 'confirm',
    name: 'projectcontainerqueries',
    message: message({
      headline: 'Use Container-Queries',
      description: 'Do you want to use container-queries (see https://github.com/ausi/cq-prolyfill)?'
    }),
    default: false
  },
  // File Structure
  {
    type: 'list',
    name: 'projectcssstructure',
    message: message({
      headline: 'CSS Methodologies',
      description: 'CSS Writing Methodologies'
    }),
    choices: [
      {
        name: 'Own Structure',
        value: 'sassOwn'
      },
      {
        name: 'Atomic Design',
        value: 'sassAtomic'
      },
      {
        name: 'ITCSS',
        value: 'sassITCSS'
      }
    ]
  },
  // Critical CSS
  {
    type: 'confirm',
    name: 'projectcritical',
    message: message({
      headline: 'CriticalCSS',
      description: 'Do you wan\'t to automatically create CriticalCSS (Above the fold)?',
      defaultValue: false
    })
  },
  {
    when: when('projectcritical', true),
    type: 'list',
    name: 'projectcriticalinline',
    message: message({
      headline: 'Inline CriticalCSS',
      description: 'Shall the CSS be injected in the index.html-File, or as separate CSS-File?'
    }),
    choices: [
      {
        name: 'Inline',
        value: 'inline'
      },
      {
        name: 'Separate File',
        value: 'separate'
      }
    ]
  }
]

module.exports = generalPrompts
