const Generator = require('yeoman-generator')
const chalk = require('chalk')
const clear = require('clear-terminal')
const random = require('randomstring')
const commandExists = require('command-exists')
const os = require('os')
const gradient = require('gradient-string')

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
const installJoomla = require('./modules/writing/install/joomla')
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
    this.installJoomla = installJoomla.bind(this)
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
      saltKeys.push(
        random.generate({
          length: 64,
          charset:
            'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!§$%/()=_;:,.^'
        })
      )
    }
    this.saltKeys = saltKeys
  }

  // Initializing
  async initializing () {
    await Promise.all(
      Object.keys(this.commands).map(command => {
        return commandExists(command)
          .then(commandResult => {
            this.commands[commandResult] = true
          })
          .catch(error => {})
      })
    )
  }

  prompting () {
    var welcomeHead = gradient.atlas(`
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
    `)

    // Custom Greeting
    var welcome = chalk`
                                                                                                                {white.bold.bgCyan  v${
  this
    .pkg
    .version
} }{hex('#c9c9c9')

      ------------------------------------------- {hex('#00ffd8') the revenge of the kittn } ---------------------------------------------
      }
      {bold Authors:} {hex('#00ffd8') Sascha Fuchs} {underline.hex('#00a1ff') @gisugosu} & {hex('#00ffd8') Lars Eichler} {underline.hex('#00a1ff') @cinkon}
      {bold URL:} {hex('#00ffd8') http://kittn.de}

    `
    clear()
    this.log(welcomeHead)
    this.log(welcome)

    // Now ask some questions already
    const prompts = promptsFunction(this)
    return this.prompt(prompts).then(props => {
      // To access props later use this.props.someAnswer;
      this.props = props
      this.props.saltKeys = this.saltKeys
      this.props.projectcritical = this.props.projectcritical || false
      this.props.fileGroup = this.props.fileGroup || false
      this.props.fileUser = this.props.fileUser || false
      this.props.projectnormalize = this.props.projectnormalize || 'regular'
      this.props.projectjsframework = this.props.projectjsframework || false
      this.props.projecttestingunit = this.props.projecttestingunit || false
      this.props.projecttestingwallaby = this.props.projecttestingwallaby || false
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
      this.installJoomla().install(this)
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
    let goodbye = chalk`


              .
            .o0kdl:,..                                                            ....
            ,KMMMXdc:cllc,.                    .,;ldxkOOkkxo;.          ..;clllccd0KK0;
            :NMMWX0o' .,lkOOd:.            .,oOXWWMMMMMMNk:,.       .:ok00kdc,':xXMMMX:
            cNNNXo,c:.    'lOXXkc.       'o0WMMMMMMMMMMMW0c.     .ckXNKx:.   .oxd0WWWK;
            cNk:do.          'o0NXx;...;xXMMMMMMMMMMMMMMMMW0l,':xKWXx:.      .' .dKd0K,
            :XO....            .cONWX0KWMMMMMMMMMMMMMMMMMMMMMWNWMKl.            ,x;'OO'
            ,KK,                 .xWMMMMMMMMMMMMMMMMMMMMMMMMMMMMWd.             .. :Xx.
            .OWo                .cKMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXd'              .xNl
            .dW0'             .l0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXo.            cNK,
             :XWd.          .c0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKl.         ,KWd.
             .kMXc         ;OWMMMMMMMMMMMWXXWMMMMMMMWNXNMMMMMMMMMMMMMMWk,       'OW0,
              :XMK;      .dNMMMMMMMMMMMMNd'.cKMMMMMNx'.:KMMMMMMMMMMMMMMMXl.    'OWX:
               oNM0,    ,0WMMMMMMMMMMMMWx.   cNMMMMx.   cXMMMMMMMMMMMMMMMWk'  'kWNl
               .xWM0; .cXMMMMMMMMMMMMMMNc    '0MMMNc    'OMMMMMMMMMMMMMMMMMKocOWNl
                .kWMXO0NMMMMMMMMMMMMMMMX:    .OMMMNc    .OMMMMMMMMMMMMMMMMMMMMMNo.
                 .kWMMMMMMMMMMMMMMMMMMMNl    ,KMMMWo    '0MMMMMMMMMMMMMMMMMMMMWx.
                  ;KMMMMMMMMMMMMMMMMMMMMO'  .dWMMMM0,  .dNMMMMMMMMMMMMMMMMMMMMWk'....
       .',;;;;;;,;lOKXNWMMMMMMMMMMMMMMMMWKxd0NWWWWWWKxdOWMMMMMMMMMMMMMMMMMWX0kxo:;;;;;;;;;;'.
    .:c:;,...      ...':oONMMMMMMMMMMNKOxolc:;;;,,;;;:cldk0NWMMMMMMMMMMNOl,.             .':lc.
   :xc.                  .;OWMMMMWXxc'.     .lddddddo'    .':dKWMMMMMMXl.                   .cx:
  :O:                      ,0MMMXo.         .lKWMMW0l.        .c0WMMMWd.                      lO,
  .xx.                      .kWWNd.............,dOko,............;0MMMWl                       ,Oc
  .xx.                      ,Oxc:,''''''''''''''''''''''''''''''',:lllkk'                  .   ,Oc
  l0;  ''           .'    ;Od.                                       .xk;   ';.           ;' .dO'
  .xO;,o'    .'     .xo.'oOl.                                         .lkd;cOl     .;.    :d:x0:
   .oOK0;    ;d.   .'kN0xl'                                             .cx0Xx;'...lk, ..'dXKd'
     .cdxddooOXOddddooc'.                                                  .,cloddxO0xddddo:.
        ..',,,,,'...                                                              ......
                               {yellow Meeeeooowww! The Generator is finished.}

     {cyan.bold Next Steps}`

    goodbye += '\n\n';

    if (
      this.props.projectusage.substring(0, 4) === 'word' &&
      this.commands.wp !== true
    ) {
      goodbye +=
        chalk`{cyan      - Install Wordpress manually in the 'dist/' directory}` +
        '\n';
    }

    if (
      this.props.projectusage.substring(0, 5) === 'craft' &&
      this.commands.wget !== true
    ) {
      goodbye +=
        chalk`{cyan      - Install Craft manually in the 'dist/' directory}` +
        '\n';
    }

    if (
      this.props.projectusage.substring(0, 6) === 'joomla' &&
      this.commands.wget !== true
    ) {
      goodbye +=
        chalk`{cyan      - Install Joomla manually in the 'dist/' directory}` +
        '\n';
    }

    if (this.props.projectusage === 'wordpressCB') {
      goodbye +=
        chalk`{cyan      - Copy your ACF5 Pro Plugin on 'src/structure/plugins/'}` +
        '\n';
    }

    if (os.type() === 'Darwin') {
      if (this.props.projectusage !== 'html' && this.props.projectcredential) {
        goodbye +=
          chalk`{cyan      - Use the './install.sh' Shellscript to skip the following steps.}` +
          '\n';
      }

      if (this.props.projectusage === 'html') {
        goodbye +=
          chalk`{cyan      - Initiate the project with 'npm run init'}` + '\n';
      }
    } else {
      if (
        this.props.projectusage === 'craft' ||
        this.props.projectusage === 'craftCB'
      ) {
        goodbye +=
          chalk`{cyan      - Setup User and Staff on 'craftscripts/.env.sh'}` +
          '\n';
      }

      if (this.props.projectusage !== 'webpackApp') {
        goodbye +=
          chalk`{cyan      - Initiate the project with 'npm run init'}` + '\n';
      }

      if (this.props.projectusage.substring(0, 5) === 'craft') {
        goodbye +=
          chalk`{cyan      - Execute './craftscripts/set_perms.sh'}` + '\n';
      }

      if (
        this.props.projectusage !== 'html' &&
        this.props.projectusage !== 'webpackApp'
      ) {
        const folder =
          this.props.projectusage.substring(0, 5) === 'craft' ? 'public/' : '';
        goodbye +=
          chalk`{cyan      - Import database.sql found on project root}` + '\n';
      }

      if (
        this.props.projectusage !== 'html' &&
        this.props.projectusage !== 'webpackApp' &&
        this.props.projectcredential
      ) {
        goodbye +=
          chalk`{cyan        => 'mysql -u${this.props.credentialdbuser} -p${
            this.props.credentialdbpass
          } ${this.props.credentialdbdatabase} < database.sql'}` + '\n\n';
      }
    }

    if (
      this.props.projectusage !== 'html' &&
      this.props.projectusage !== 'webpackApp'
    ) {
      const folder =
        this.props.projectusage.substring(0, 5) === 'craft' ? 'public/' : '';
      const domain = this.props.credentialdomain
        ? this.props.credentialdomain
        : '';
      goodbye +=
        chalk`{hex('#009dff')      - Define vHost for '${domain}' on '[projectRoot]/dist/${folder}'}` +
        '\n';
    }

    if (
      this.props.projectusage !== 'html' &&
      this.props.projectusage !== 'webpackApp'
    ) {
      goodbye +=
        chalk`{hex('#009dff')      - Log into the backend with 'kittn' / '${
          this.props.projectusage.substring(0, 5) === 'craft'
            ? `superkittn`
            : `kittn`
        }'. After login, activate theme and create a new user}` + '\n';
    }

    if (this.props.projectcredential) {
      goodbye +=
        chalk`{hex('#009dff')            => Backend: ${
          this.props.credentialdomain
        }/${
          this.props.projectusage.substring(0, 5) === 'craft'
            ? `admin`
            : `wp-admin`
        }}` + '\n';
    }

    if (this.props.projectusage === 'craftCB') {
      goodbye +=
        chalk`{cyan.bold      If you want to use the Craft Personal version, you must deactivate the localization before you switch.. }` +
        '\n';
    }

    if (this.props.projectusage === 'webpackApp') {
      goodbye +=
        chalk`{cyan      - Build your App with 'npm run build'}` + '\n';
    }

    goodbye += chalk`{hex('#009dff')      - Start the devtask with 'npm run dev'}

     {hex('#94ff00').bold Happy Coding.}`

    this.log(goodbye)
  }
}
