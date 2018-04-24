const chalk = require('chalk')
const message = require('../helpers/message')
const when = require('../helpers/when')
const whenExtra = require('../helpers/whenExtra')

const generalPrompts = context => {
  return [
    {
      type: 'input',
      name: 'projectname',
      message: message({
        headline: 'Project Name',
        description: 'Please give the project a name (without Spaces)',
        defaultValue: false
      }),
      default () {
        return process
          .cwd()
          .replace('\\', '/')
          .split('/')
          .pop(-1)
          .toLowerCase()
          .replace(/[^a-zA-Z0-9]/g, '')
      },
      validate (input) {
        // Do async stuff
        if (
          input.indexOf(' ') >= 0 ||
          /[~`!#$%^&*+=[\]\\';,/{}|\\":<>?]/g.test(input)
        ) {
          // Pass the return value in the done callback
          return chalk`{red
No whitespaces or special-chars allowed!}`
        }
        return true
      },
      store: false
    },
    {
      type: 'list',
      name: 'projectusage',
      message: message({
        headline: 'Project Usage',
        description: 'Please find the appropriate type of the project.',
        defaultValue: false
      }),
      choices: [
        {
          name: 'Build a HTML prototype',
          value: 'html'
        },
        {
          name: 'Build an App (Webpack only, no Gulp)',
          value: 'webpackApp'
        },
        {
          name: 'Create a website using CraftCMS',
          value: 'craft'
        },
        {
          name: 'Create a website using CraftCMS and ContentBuilder',
          value: 'craftCB'
        },
        {
          name: 'Create a website using Wordpress',
          value: 'wordpress'
        },
        {
          name: 'Create a website using Wordpress and ContentBuilder',
          value: 'wordpressCB'
        },
        {
          name: 'Create a website using Joomla',
          value: 'joomla'
        }
      ],
      store: true
    },
    {
      when: when('projectusage', 'html'),
      type: 'list',
      name: 'projectstructure',
      message: message({
        headline: 'HTML Compiler',
        description:
          'If you want to generate your HTML with Twig or do not use a compiler \n\xa0 (files like html, php, txt, etc. are only copied when the process is running)?',
        defaultValue: false
      }),
      choices: [
        {
          name: 'Twig Template',
          value: 'twig'
        },
        {
          name: 'Uncompiled',
          value: 'uncompiled'
        }
      ],
      default: 'twig',
      store: true
    },
    {
      when: function (answers) {
        return (
          answers.projectusage === 'craft' ||
          answers.projectusage === 'joomla' ||
          answers.projectusage === 'wordpress' ||
          answers.projectusage === 'html'
        )
      },
      type: 'list',
      name: 'projectnormalize',
      message: message({
        headline: 'normalize.css',
        description: 'Do you want to use normalize.css?'
      }),
      choices: [
        {
          name: 'Custom',
          value: 'custom'
        },
        {
          name: 'Regular',
          value: 'regular'
        },
        {
          name: 'No',
          value: false
        }
      ],
      store: true
    },
    {
      when: function (answers) {
        return (
          answers.projectusage === 'craft' ||
          answers.projectusage === 'joomla' ||
          answers.projectusage === 'wordpress' ||
          answers.projectusage === 'html'
        )
      },
      type: 'confirm',
      name: 'projectcontainerqueries',
      message: message({
        headline: 'Use Container-Queries',
        description:
          'Do you want to use container-queries (see https://github.com/ausi/cq-prolyfill)?'
      }),
      default: false,
      store: true
    },
    {
      when: function (answers) {
        return (
          answers.projectusage === 'craft' ||
          answers.projectusage === 'joomla' ||
          answers.projectusage === 'wordpress' ||
          answers.projectusage === 'html' ||
          answers.projectusage === 'webpackApp'
        )
      },
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
      ],
      store: true
    },
    {
      when: function (answers) {
        return (
          answers.projectusage.substring(0, 5) === 'craft' ||
          answers.projectusage.substring(0, 6) === 'joomla' ||
          answers.projectusage.substring(0, 4) === 'word'
        )
      },
      type: 'list',
      name: 'projecttailwind',
      message: message({
        headline: 'Tailwind CSS',
        description: 'Do you want to use TailwindCSS?'
      }),
      choices: [
        {
          name: 'No',
          value: 'no'
        },
        {
          name: 'Yes (in a Hybrid Mode with Sass)',
          value: 'hybrid'
        }
      ],
      store: true
    },
    {
      when: function (answers) {
        return (
          answers.projectusage.substring(0, 5) === 'craft' ||
          answers.projectusage.substring(0, 6) === 'joomla' ||
          answers.projectusage.substring(0, 4) === 'word'
        )
      },
      type: 'confirm',
      name: 'projectcredential',
      message: message({
        headline: 'Local Environment Credentials',
        description:
          'Want to enter your URL and Database Credentials for your local Environment?',
        defaultValue: false
      }),
      default: true,
      store: true
    },
    {
      when: function (answers) {
        return answers.projectusage.substring(0, 5) === 'craft'
      },
      type: 'input',
      name: 'fileUser',
      message: message({
        headline: 'Username on your Filesystem',
        description: 'Needed for the Craftscripts.',
        defaultValue: false
      }),
      store: true
    },
    {
      when: function (answers) {
        return answers.projectusage.substring(0, 5) === 'craft'
      },
      type: 'input',
      name: 'fileGroup',
      message: message({
        headline: 'Groupname on your Filesystem',
        description: 'Needed for the Craftscripts.',
        defaultValue: false
      }),
      store: true
    },
    {
      when: when('projectcredential', true),
      type: 'input',
      name: 'credentialdomain',
      message: message({
        headline: 'Credentials Domain Protocol',
        description: 'Domain without HTTP or HTTPS',
        defaultValue: false
      }),
      store: false,
      default: function (props) {
        return props.projectname.toLowerCase() + '.local'
      }
    },
    {
      when: when('projectcredential', true),
      type: 'input',
      name: 'credentialdbserver',
      message: message({
        headline: 'DB Host',
        description: 'Database Server Host without ending slash',
        defaultValue: false
      }),
      store: false,
      default: 'localhost'
    },
    {
      when: when('projectcredential', true),
      type: 'input',
      name: 'credentialdbuser',
      message: message({
        headline: 'DB User',
        description: 'Database User',
        defaultValue: false
      }),
      store: false,
      default: 'root'
    },
    {
      when: when('projectcredential', true),
      type: 'input',
      name: 'credentialdbpass',
      message: message({
        headline: 'DB Pass',
        description: 'Database Password',
        defaultValue: false
      }),
      store: false,
      default: 'root'
    },
    {
      when: when('projectcredential', true),
      type: 'input',
      name: 'credentialdbdatabase',
      message: message({
        headline: 'DB Name',
        description: 'Database Name',
        defaultValue: false
      }),
      store: false,
      default: function (props) {
        return props.projectname.toLowerCase()
      }
    },
    {
      when: whenExtra('projectcredential', true, context.commands.mysql),
      type: 'confirm',
      name: 'credentialdbopen',
      message: message({
        headline: 'Create new DB',
        description: 'Do you want to create a new MySQL-Database?',
        defaultValue: false
      }),
      default: true,
      store: true
    },
    {
      when: when('credentialdbopen', true),
      type: 'confirm',
      name: 'projectmamp',
      message: message({
        headline: 'Use MAMP socket?',
        description: 'Do you use MAMP?',
        defaultValue: false
      }),
      store: true,
      default: true
    },
    {
      type: 'input',
      when: function (answers) {
        return answers.projectusage !== 'webpackApp';
      },
      name: 'projectcssfilename',
      message: message({
        headline: 'CSS Filename',
        description: '(only the name without .css or .scss)',
        defaultValue: 'Default: style'
      }),
      default: 'style',
      store: true
    },
    {
      type: 'list',
      name: 'projectbreakpointunit',
      message: message({
        headline: 'Media Query Unit',
        description: 'Which Unit do you prefer for Media Queries?'
      }),
      choices: [
        {
          name: 'px',
          value: 'px'
        },
        {
          name: 'em',
          value: 'em'
        }
      ],
      store: true
    },
    {
      type: 'input',
      name: 'projectthemecolor',
      message: message({
        headline: 'Project Theme Color',
        description: 'Main Theme-Color of the project',
        defaultValue: 'Default: #29b8f2'
      }),
      default: '#29b8f2',
      validate (input) {
        // Do async stuff
        const hex = /(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i
        if (!hex.test(input)) {
          // Pass the return value in the done callback
          return chalk`{red This is no valid HEX-Color}`
        }
        return true
      },
      store: true
    },
    {
      type: 'list',
      name: 'projectstylelint',
      message: message({
        headline: 'Activate Stylelint',
        description: 'Do you want to ativate Stylelint?'
      }),
      choices: [
        {
          name: 'No',
          value: false
        },
        {
          name: 'Yes',
          value: true
        },
        {
          name: 'Yes (strict, with property-order-linting)',
          value: 'strict'
        }
      ],
      default: true,
      store: true
    },
    {
      type: 'confirm',
      name: 'projectprettier',
      message: message({
        headline: 'Add Prettier',
        description:
          'Do you want to use Prettier for automated Code-Formatting? (See prettier.io)',
        defaultValue: true
      }),
      default: true,
      store: true
    },
    {
      when: function (answers) {
        return (
          answers.projectusage === 'craft' ||
          answers.projectusage.substring(0, 4) === 'word' ||
          answers.projectusage.substring(0, 6) === 'joomla' ||
          answers.projectusage === 'html'
        )
      },
      type: 'confirm',
      name: 'projectcritical',
      message: message({
        headline: 'CriticalCSS',
        description:
          "Do you wan't to automatically create CriticalCSS (Above the fold)?",
        defaultValue: false
      }),
      default: false,
      store: true
    },
    {
      when: when('projectcritical', true),
      type: 'list',
      name: 'projectcriticalinline',
      message: message({
        headline: 'Inline CriticalCSS',
        description:
          'Shall the CSS be injected in the index.html-File, or as separate CSS-File?'
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
      ],
      store: true
    },
    {
      type: 'list',
      when: function (answers) {
        return answers.projectusage !== 'webpackApp'
      },
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
      store: true
    },
    {
      type: 'list',
      when: function (answers) {
        return answers.projectusage !== 'webpackApp'
      },
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
      store: true
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
      default: true,
      store: true
    },
    {
      when: when('projectjsframework', 'vue'),
      type: 'list',
      name: 'projectvueversion',
      message: message({
        headline: 'Vue.js Runtime',
        description:
          'Vue Version. When you only use .vue Files Runtime is perfect,\n\xa0 if you need parsing from .html Files you need the Standalone Version.'
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
      store: true
    },
    {
      type: 'confirm',
      name: 'projecttypescript',
      message: message({
        headline: 'TypeScript Support',
        description: 'Do you want to use Typescript?',
        defaultValue: true
      }),
      default: false,
      store: true
    },
    {
      when: function (answers) {
        return answers.projectjsframework === 'vue'
      },
      type: 'confirm',
      name: 'projecttestingunit',
      message: message({
        headline: 'Unit Testing',
        description: 'Should a unit test be integrated with Jest?',
        defaultValue: false
      }),
      default: false,
      store: true
    },
    {
      type: 'confirm',
      name: 'projecttestinge2e',
      message: message({
        headline: 'E2E Testing',
        description: 'Should a unit test be integrated with Cypress?',
        defaultValue: false
      }),
      default: false,
      store: true
    },
    {
      when: function (answers) {
        return answers.projecttestingunit === true && answers.projectjsframework === 'vue'
      },
      type: 'confirm',
      name: 'projecttestingwallaby',
      message: message({
        headline: 'Wallaby',
        description: 'Should Wallaby be configured?',
        defaultValue: false
      }),
      default: false,
      store: true
    },
    {
      when: function (answers) {
        return answers.projectusage !== 'webpackApp'
      },
      type: 'confirm',
      name: 'projectastrum',
      message: message({
        headline: 'Astrum Pattern Lib',
        description:
          'Would you like to build up your Pattern Library with Astrum?',
        defaultValue: false
      }),
      default: false,
      store: true
    },
    {
      when: function (answers) {
        return answers.projectusage !== 'webpackApp'
      },
      type: 'confirm',
      name: 'projectsassdocs',
      message: message({
        headline: 'Sass Docs',
        description: 'Do you like to create the sass documentation?',
        defaultValue: false
      }),
      default: false,
      store: true
    },
    {
      type: 'input',
      name: 'projectversion',
      message: message({
        headline: 'Project Version',
        description: 'The Version Number',
        defaultValue: false
      }),
      default: '0.0.1',
      store: true
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
      }),
      store: true
    },
    {
      type: 'input',
      name: 'projecturl',
      message: message({
        headline: 'Project Repository URL',
        description: 'Web-Adress for the Repository',
        defaultValue: false
      }),
      store: true
    }
  ]
};

module.exports = generalPrompts
