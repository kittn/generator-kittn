const commandExists = require('command-exists')
const message = require('../helpers/message')
const when = require('../helpers/when')
const whenExtra = require('../helpers/whenExtra')

const projectPrompts = (context) => {
  return [
    {
      type: 'list',
      name: 'projectusage',
      message: message({
        headline: 'Project Usage',
        description: 'For what do you want to use Kittn. The generator can then prepare the project accordingly.',
        defaultValue: false
      }),
      choices: [
        {
          name: 'Building HTML Prototypes',
          value: 'html'
        },
        {
          name: 'Integrate in CraftCMS',
          value: 'craft'
        },
        {
          name: 'Integrate in Wordpress',
          value: 'wordpress'
        }
      ],
      store: false
    },
    {
      when: when('projectusage', 'craft', 'projectcssstructure', 'sassITCSS'),
      type: 'confirm',
      name: 'projectcraftbp',
      message: message({
        headline: 'Craft Contentbuilder',
        description: 'Do you want that the Generator implement a Craft ContentBuilder?',
        defaultValue: false
      }),
      default: true,
      store: false
    },
    {
      when: when('projectusage', 'wordpress', 'projectcssstructure', 'sassITCSS'),
      type: 'confirm',
      name: 'projectwordpressbp',
      message: message({
        headline: 'Wordpress Bonus Round',
        description: 'Do you want that the Generator implement a Wordpress Starterpack? \n\xa0 Adding a Contentbuilder, the Stylefiles (in ITCSS) and some JS Files for Lightboxes, and some WP Plugins. You will need ACF 5 Pro',
        defaultValue: false
      }),
      default: true,
      store: false
    },
    {
      when: when('projectusage', 'html'),
      type: 'list',
      name: 'projectstructure',
      message: message({
        headline: 'HTML Compiler',
        description: 'If you want to generate your HTML with Twig or do not use a compiler \n\xa0 (files like html, php, txt, etc. are only copied when the process is running)?',
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
      store: false
    },
    {
      when: whenExtra('projectusage', 'wordpress', context.commands.wp),
      type: 'confirm',
      name: 'projectwpcli',
      message: message({
        headline: 'Wordpress Install',
        description: 'Should the generator install WordPress for you?',
        defaultValue: false
      }),
      default: true
    },
    {
      when: whenExtra('projectusage', 'craft', context.commands.wget),
      type: 'confirm',
      name: 'projectcraftcli',
      message: message({
        headline: 'Craft Install',
        description: 'Should the generator install CraftCMS for you?',
        defaultValue: false
      }),
      default: true
    },
    {
      when: when('projectusage', 'wordpress', 'projectusage', 'craft', 'or'),
      type: 'confirm',
      name: 'projectcredential',
      message: message({
        headline: 'Local Environment Credentials',
        description: 'Want to enter your URL and Database Credentials for your local Environment?',
        defaultValue: false
      }),
      default: true,
      store: false
    },
    {
      when: when('projectcredential', true),
      type: 'list',
      name: 'credentialprotocol',
      message: message({
        headline: 'Credentials HTTP',
        description: 'HTTP or HTTPS?',
        defaultValue: false
      }),
      choices: [
        {
          name: 'http',
          value: 'http'
        },
        {
          name: 'https',
          value: 'https'
        }
      ],
      default: 'http'
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
      default: function (props) { return props.projectname.toLowerCase() + '.local' }
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
      default: function (props) { return props.projectname.toLowerCase() }
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
      default: true
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
      default: false
    }
  ]
}

module.exports = projectPrompts
