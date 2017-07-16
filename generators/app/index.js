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
    var welcome = `
            ${chalk.styles.cyan.open} 
    
            kkkkkkkk             iiii          tttt               tttt                          
            k::::::k            i::::i      ttt:::t            ttt:::t                          
            k::::::k             iiii       t:::::t            t:::::t                          
            k::::::k                        t:::::t            t:::::t                          
             k:::::k    kkkkkkkiiiiiiittttttt:::::tttttttttttttt:::::ttttttt  nnnn  nnnnnnnn    
             k:::::k   k:::::k i:::::it:::::::::::::::::tt:::::::::::::::::t  n:::nn::::::::nn  
             k:::::k  k:::::k   i::::it:::::::::::::::::tt:::::::::::::::::t  n::::::::::::::nn 
             k:::::k k:::::k    i::::itttttt:::::::tttttttttttt:::::::tttttt  nn:::::::::::::::n
             k::::::k:::::k     i::::i      t:::::t            t:::::t          n:::::nnnn:::::n
             k:::::::::::k      i::::i      t:::::t            t:::::t          n::::n    n::::n
             k:::::::::::k      i::::i      t:::::t            t:::::t          n::::n    n::::n
             k::::::k:::::k     i::::i      t:::::t    tttttt  t:::::t    ttttttn::::n    n::::n
            k::::::k k:::::k   i::::::i     t::::::tttt:::::t  t::::::tttt:::::tn::::n    n::::n
            k::::::k  k:::::k  i::::::i     tt::::::::::::::t  tt::::::::::::::tn::::n    n::::n
            k::::::k   k:::::k i::::::i       tt:::::::::::tt    tt:::::::::::ttn::::n    n::::n
            kkkkkkkk    kkkkkkkiiiiiiii         ttttttttttt        ttttttttttt  nnnnnn    nnnnnn
            ${chalk.styles.cyan.close}
                                                                                        ${chalk.bold.bgYellow(' v' + this.pkg.version + ' ')}
            ${chalk.styles.blue.open}                                                             
                     --------------------------------------------------------------
            ${chalk.styles.blue.close}     ${chalk.styles.yellow.open}   
                     Authors: Sascha Fuchs (@gisugosu) & Lars Eichler (@cinkon)
                     URL: http://kittn.de  
            ${chalk.styles.yellow.close}
    `
    clear()
    this.log(welcome)

    // Now ask some questions already
    const prompts = promptsFunction(this)
    return this.prompt(prompts).then(props => {
      // To access props later use this.props.someAnswer;
      this.props = props
      this.props.saltKeys = this.saltKeys
      this.props.projectcritical = this.props.projectcritical ? this.props.projectcritical : false
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
    let goodbye =`
          
          
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
          ${chalk.styles.bold.open}Next Steps: ${chalk.styles.bold.close}`

          goodbye += '\n\n'

          if (this.props.projectusage.substring(0,4) === 'word' && this.commands.wp !== true) {
            goodbye += `          - Install Wordpress manually in the 'dist/' directory` + '\n'
          }

          if (this.props.projectusage.substring(0,5) === 'craft' && this.commands.wget !== true) {
            goodbye += `          - Install Craft manually in the 'dist/' directory` + '\n'
          }

          if (this.props.projectusage === 'wordpressCB') {
            goodbye += `          - Copy your ACF5 Pro Plugin on 'src/structure/plugins/'` + '\n'
          }

          if (this.props.projectusage === 'craft' || this.props.projectusage === 'craftCB') {
            goodbye += `          - Setup User and Staff on 'craftscripts/.env.sh'` + '\n'
          }

          goodbye += `          - Initiate the project with 'npm run init'` + '\n'

          if (this.props.projectusage.substring(0,5) === 'craft') {
            goodbye += `          - Execute './craftscripts/set_perms.sh'` + '\n'
          }

          if (this.props.projectusage !== 'html') {
            goodbye += `          - Setup your vHost on '${this.props.credentialdomain}' on '[projectRoot]/dist/${this.props.projectusage.substring(0,5) === 'craft' ? 'public/' : ''}'` + '\n'
            goodbye += `          - Import database.sql found on project root` + '\n'
          }

          if (this.props.projectusage !== 'html' && this.props.projectcredential) {
            goodbye += `            => 'mysql -u${this.props.credentialdbuser} -p${this.props.credentialdbpass} ${this.props.credentialdbdatabase} < database.sql'` + '\n'
          }

          if (this.props.projectusage !== 'html') {
            goodbye += `          - Log into the backend with 'kittn' / '${this.props.projectusage.substring(0,5) === 'craft' ? `superkittn` : `kittn` }'. After login, activate theme and create a new user` + '\n'
          }

          if (this.props.projectcredential) {
            goodbye += `            => Backend: http://${this.props.projectname}.local/${this.props.projectusage.substring(0,5) === 'craft' ? `admin` : `wp-admin` }` + '\n'
          }

          goodbye += `          - Start the devtask with 'npm run dev'
                
          Happy Coding.
          ${chalk.styles.cyan.close}`


    this.log(goodbye)
  }
}
