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

// Import MySQL Database
// const importDB = require('./modules/writing/importDB')

// Install CMS
const installWordpress = require('./modules/writing/install/wordpress')
const installCraft = require('./modules/writing/install/craft')

// And Action!
module.exports = class extends Generator {
  constructor (args, opts) {
    super(args, opts)
    this.pkg = pkg

    this.devMode = opts.dev ? opts.dev : false

    this.promptsFunction = promptsFunction.bind(this)

    // Package.json
    this.writePackageJson = writePackageJson.bind(this)

    // Config.json
    this.writeConfigJson = writeConfigJson.bind(this)

    // Add Database
    this.addDB = addDB.bind(this)

    // Import Database
    // this.importDB = importDB.bind(this)

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
          '\n   Authors: Sascha Fuchs (@gisugosu) & Lars Eichler (@cinkon)' +
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

    // Write Database if user wants to
    // this.importDB().writing(this)

    // Copy Source Files and Folders
    this.copySources().writing(this)

    // Install CMS
    if (!this.devMode) {
      this.installWordpress().install(this)
      this.installCraft().install(this)
    }
  }

  install () {
    if (!this.devMode) {
      if (this.commands.yarn) {
        this.yarnInstall()
      } else {
        this.npmInstall()
      }
    }
  }

  end () {
    clear()
    const goodbye =`
          
          
          ${chalk.styles.yellow.open} 
                           __    .__  __    __ 
                           |  | _|__|/  |__/  |_  ____ 
                           |  |/ /  \\   __\\   __\\/    \\ 
                           |    <|  ||  |  |  | |   |  \\ 
                           |__|_ \\__||__|  |__| |___|  / 
                           \\/                   \\/  
           ${chalk.styles.yellow.close} ${chalk.styles.green.open}
                      Meeeeooowww! The Generator is finished.
          ${chalk.styles.green.close}
          
          ${chalk.styles.cyan.open}
          ${chalk.styles.bold.open}Next Steps: ${chalk.styles.bold.close}
          ${this.props.projectusage.substring(0,4) === 'word' && this.commands.wp !== true ? `- Install Wordpress manually in the 'dist/' directory` : '' }${this.props.projectusage.substring(0,5) === 'craft' && this.commands.wget !== true ? `- Install Craft manually in the 'dist/' directory` : '' }
          ${this.props.projectusage === 'wordpressCB' ? `- Copy your ACF5 Pro Plugin on 'src/structure/plugins/'` : ''}${this.props.projectusage === 'craft' || this.props.projectusage === 'craftCB' ? `- Setup User and Staff on 'craftscripts/.env.sh'` : ''}
          - Initiate the project with 'npm run init' 
          ${this.props.projectusage !== 'html' ? `- Setup your vHost on '${this.props.credentialdomain}' on '[projectRoot]/dist/${this.props.projectusage.substring(0,5) === 'craft' ? 'public/' : ''}'` : '' }
          ${this.props.projectusage.substring(0,5) === 'craft' ? `- Execute './craftscripts/set_perms.sh'` : '' }
          ${this.props.projectusage !== 'html' ? '- Import database.sql found on project root' : ''}
            ${this.props.projectusage !== 'html' && this.props.projectcredential ? `=> 'mysql -u${this.props.credentialdbuser} -p${this.props.credentialdbpass} ${this.props.credentialdbdatabase} < database.sql'`: ''}
          ${this.props.projectusage !== 'html' ? `- Log into the backend with 'kittn' / '${this.props.projectusage.substring(0,5) === 'craft' ? `kittnc` : `kittn` }'. After login, activate theme and create a new user` : ''}
            ${this.props.projectcredential ? `=> Backend: http://${this.props.projectname}.local/${this.props.projectusage.substring(0,5) === 'craft' ? `admin` : `wp-admin` }` : ''}
          - Start the devtask with 'npm run dev'
          
          Happy Coding.
          ${chalk.styles.cyan.close}
          `
    this.log(goodbye)
  }
}
