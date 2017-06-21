const Generator = require('yeoman-generator')
const chalk = require('chalk')
const clear = require('clear-terminal')
const random = require('randomstring')
const commandExists = require('command-exists')

// Importing modules
const promptsFunction = require('./modules/prompt')
const pkg = require('../../package.json')

// Package JSON
const writePackageJson = require('./modules/writing/packageJSON')

// Config JSON
const writeConfigJson = require('./modules/writing/configJSON')

// Copy Source Files
const copySources = require('./modules/writing/copySources')

// Add MySQL Database
const addDB = require('./modules/writing/addDB')

// Install CMS
const installWordpress = require('./modules/writing/install/wordpress')
const installCraft = require('./modules/writing/install/craft')

// And Action!
module.exports = class extends Generator {
  constructor (args, opts) {
    super(args, opts)
    this.pkg = pkg

    this.promptsFunction = promptsFunction.bind(this)

    // Package.json
    this.writePackageJson = writePackageJson.bind(this)

    // Config.json
    this.writeConfigJson = writeConfigJson.bind(this)

    // Add Database
    this.addDB = addDB.bind(this)

    // Copy Sources
    this.copySources = copySources.bind(this)

    // Copy Sources
    this.installWordpress = installWordpress.bind(this)
    this.installCraft = installCraft.bind(this)

    // Command Checks
    this.commands = {
      composer: false,
      yarn: false,
      git: false,
      wget: false,
      wp: false,
      mysql: false
    }

    // Function for Generate Salt Keys
    var saltKeys = []

    for (var i = 0; i < 8; i++) {
      saltKeys.push(random.generate({
        length: 64,
        charset: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!§$%/()=_;:,.^'
      }))
    }
    this.saltKeys = saltKeys
  }

    // Initializing
  async initializing () {
    await Promise.all(Object.keys(this.commands)
      .map(command => {
        return commandExists(command)
          .then(commandResult => {
            this.commands[commandResult] = true
          })
          .catch((error) => {})
      }))
  }

  prompting () {
    // Custom Greeting
    var welcome =
          '\n ' + chalk.styles.cyan.open +
          '\n        ___                      ___         ___            ___      ' +
          '\n       /\\__\\          ___       /\\  \\       /\\  \\          /\\__\\     ' +
          '\n      /:/  /         /\\  \\      \\:\\  \\      \\:\\  \\        /::|  |    ' +
          '\n     /:/__/          \\:\\  \\      \\:\\  \\      \\:\\  \\      /:|:|  |    ' +
          '\n    /::\\__\\____      /::\\__\\     /::\\  \\     /::\\  \\    /:/|:|  |__  ' +
          '\n   /:/\\:::::\\__\\  __/:/\\/__/    /:/\\:\\__\\   /:/\\:\\__\\  /:/ |:| /\\__\\ ' +
          '\n   \\/_|:|~~|~    /\\/:/  /      /:/  \\/__/  /:/  \\/__/  \\/__|:|/:/  / ' +
          '\n      |:|  |     \\::/__/      /:/  /      /:/  /           |:/:/  /  ' +
          '\n      |:|  |      \\:\\__\\      \\/__/       \\/__/            |::/  /   ' +
          '\n      |:|  |       \\/__/                                   /:/  /    ' +
          '\n       \\|__|                                               \\/__/     ' +
          '\n  ' + chalk.styles.cyan.close +
          '\n                                                       v.' + chalk.bold(this.pkg.version) +
          '\n  ' +
          '\n   Authors: Sascha Fuchs (@gisugosu) ' +
          '\n   URL    : http://kittn.de   ' +
          '\n '
    clear()
    this.log(welcome)

    // Now ask some questions already
    const prompts = promptsFunction(this)
    return this.prompt(prompts).then(props => {
      // To access props later use this.props.someAnswer;
      this.props = props
      this.props.saltKeys = this.saltKeys
    })
  }

  async writing () {
    this.log(`${chalk.magenta('Writing package.json')}`)

    // Additional Props
    this.props.projectpath = process.cwd()

    // Write Package.json
    this.writePackageJson().writing(this)

    // Write config.json
    this.writeConfigJson().writing(this)

    // Add Database if user wants to
    this.addDB().writing(this)

    // Copy Source Files and Folders
    this.copySources().writing(this)

    // Install CMS
    this.installWordpress().install(this)
    this.installCraft().install(this)
  }

  install () {
    if (this.commands.yarn) {
      this.yarnInstall()
    } else {
      this.npmInstall()
    }
  }

  end () {
    clear()
    const goodbye =
            '\n ' + chalk.styles.yellow.open +
            '\n                    __    .__  __    __ ' +
            '\n                    |  | _|__|/  |__/  |_  ____ ' +
            '\n                    |  |/ /  \\   __\\   __\\/    \\ ' +
            '\n                    |    <|  ||  |  |  | |   |  \\ ' +
            '\n                    |__|_ \\__||__|  |__| |___|  / ' +
            '\n                    \\/                   \\/  ' +
            '\n  ' + chalk.styles.yellow.close + chalk.styles.green.open +
            '\n   Now we are finished. Make your last settings and start `npm run init`.' +
            '\n      When npm is finished activate `npm run dev` and happy Coding.' +
            '\n ' + chalk.styles.green.close
    this.log(goodbye)
  }
}
