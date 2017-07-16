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
                                       ..                                                                                   
                                     .l0O:                                                                                  
                                     :NMMO' .od'                                                                            
                                     ,0WNd. :XNl                                                                            
       ........                  .l:. .,'.   ,,.                                                                            
      'kXXXXXX0;                 lNO' 'lxxxol:,.                                                                            
      ,KMMMMMMN:                 .,''dXMMMMMMMNd.  .dOOOOOOk,           :kOOOOOOo.                                          
      ,KMMMMMMN:                   'OWMMMMWX0xc'   ,KMMMMMMNc           oWMMMMMMO.                                          
      ,KMMMMMMN:                   'dkxol:,..      ,KMMMMMMNc           oWMMMMMMO.                                          
      ,KMMMMMMN:                                   ,KMMMMMMNc           oWMMMMMMO.                                          
      ,KMMMMMMN:        ';::::::::'  .,;;;;;;,. .;;dXMMMMMMWk:;;;;;;;;;:OWMMMMMMKo;;;;;;.  .,;;;;;;,.  ..;cloolc;.          
      ,KMMMMMMN:      'dXMMMMMMMNx'  ,KMMMMMWX;.dWWMMMMMMMMMMMWWWWWWWWWWMMMMMMMMMMMMWMMX:  ;XMMMMMMKc,oOXWMMMMMMWXOl.       
      ,KMMMMMMN:    .oXMMMMMMMNk,    ,KMMMMMMX;.dMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMN:  ;XMMMMMMWXNMMMMMMMMMMMMMWKl.     
      ,KMMMMMMN:  .lKWMMMMMMNO;      ,KMMMMMMX: :xxONMMMMMMWKkxxxxxxxxxkKWMMMMMMNOxxxxxd'  ;XMMMMMMMMMMNKOkOKNMMMMMMMWx.    
      ,KMMMMMMNc.lKWMMMMMMWO:.       ,KMMMMMMX:    ,KMMMMMMNc           oWMMMMMMO'         :XMMMMMMMMKo'.   .,kNMMMMMMWo    
      ,KMMMMMMW00WMMMMMMW0c.         ,KMMMMMMX:    ,KMMMMMMNc           oWMMMMMMO.         ;XMMMMMMMO'        .xWMMMMMM0'   
      ,KMMMMMMMMMMMMMMMNd.           ,KMMMMMMX:    ,KMMMMMMNc           oWMMMMMMO.         ;XMMMMMMNc          cNMMMMMMK,   
      ,KMMMMMMMMMMMMMMMWx.           ,KMMMMMMX:    ,KMMMMMMNc           oWMMMMMMO.         ;XMMMMMMX;          :XMMMMMMK,   
      ,KMMMMMMMMMMMMMMMMW0;          ,KMMMMMMX:    ,KMMMMMMNc           oWMMMMMMO.         ;XMMMMMMK;          :XMMMMMMK,   
      ,KMMMMMMMMMWWMMMMMMMXl.        ,KMMMMMMX:    ,KMMMMMMNc           oWMMMMMMO'         ;XMMMMMMK;          :XMMMMMMK,   
      ,KMMMMMMMWOcc0WMMMMMMWx.       ,KMMMMMMX:    ,KMMMMMMNl           oWMMMMMM0'         :XMMMMMMK;          :XMMMMMMK,   
      ,KMMMMMMWd.  .xWMMMMMMW0;      ,KMMMMMMX:    .OMMMMMMMO'    .,:.  cNMMMMMMNo.   .:,  ;XMMMMMMK;          :XMMMMMMK,   
      ,KMMMMMMN:    .oXMMMMMMMXl.    ,KMMMMMMX:     oWMMMMMMWXkxdx0NWx. '0MMMMMMMW0xxkKWXc ;XMMMMMMK;          :XMMMMMMK,   
      ,KMMMMMMN:      ;0WMMMMMMWk'   ,KMMMMMMX:     .dNMMMMMMMMMMMMMMWk. ;0WMMMMMMMMMMMMMXlcXMMMMMMK;          :XMMMMMMK,   
      ,KMMMMMMN:       .xWMMMMMMW0;  ,KMMMMMMX:      .:ONMMMMMMMMMMMWXd.  .oKWMMMMMMMMMMN0clXMMMMMMK,          :XMMMMMMK,   
      .dOOOOOOx,        .ckOOOOOOkd' .dOOkkOOx'        .,lxOKKXKK0ko:.      .:ok0KKKKOxl,. 'xOOOOOOd.          'xOOOOOOd.   
                                                            ......               ....                                     
      ${chalk.styles.cyan.close}
                                                                                                               ${chalk.bold.bgCyan(' v' + this.pkg.version + ' ')}
      ${chalk.styles.magenta.open}                                                             
      ------------------------------------------- the revenge of the kittn ---------------------------------------------
      ${chalk.styles.magenta.close}        
      ${chalk.bold('Authors:')}${chalk.styles.yellow.open} Sascha Fuchs ${chalk.underline.green('@gisugosu')} & Lars Eichler ${chalk.underline.green('@cinkon')}${chalk.styles.yellow.close}
      ${chalk.bold('URL:')}${chalk.styles.yellow.open} http://kittn.de${chalk.styles.yellow.close}
            
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
