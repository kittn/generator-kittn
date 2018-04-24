// Dependencies
const chalk = require('chalk')
const clear = require('clear-terminal')
const filesystem = require('fs-extra')
const Generator = require('yeoman-generator')
const yosay = require('yosay')

// Import Helpers & Package File
const branding = require('./helpers/messages/branding')
const logMessage = require('./helpers/messages/logMessage')

let jsPath = './src/js/'
let stylePath = './src/style/'
let templatePath = './src/template'
let pMeth = ''
let pType = ''
let pCompiler = ''

// Config Files for moving Files & Folders
const filesModuleTpl = require('./config/filesModuleTpl')

// Importing Modules
const promptsFunction = require('./modules/prompts')

// Generator
module.exports = class extends Generator {

  // Constructor
  constructor(args, opts) {
    super(args, opts)

    // Default
    this.promptsFunction = promptsFunction.bind(this)

    // Messages
    this.branding = branding.bind(this)
    this.logMessage = logMessage.bind(this)

    // Files
    this.filesModuleTpl = filesModuleTpl.bind(this)
  }

  // Prompting
  prompting() {
    // Branding
    this.log(this.branding())

    // Execute function so we get its returned array;
    const prompts = this.promptsFunction()
    return this.prompt(prompts).then((props) => {
      // To access props later use this.props.someAnswer;
      this.props = props
    })
  }

  async configuration() {
    const config = './config.json'

    if (filesystem.existsSync(config)) {
      const json = JSON.parse(filesystem.readFileSync(config, 'utf8'))
      pCompiler = json.src.baseconf.structure
      pMeth = json.src.baseconf.methodology
      pType = json.src.baseconf.type


      // Path Additions based on CSS methodology
      // Get JS Folder
      jsPath = json.src.js !== undefined ? json.src.js : './src/js/'

      // Style Path
      switch(pMeth) {
        case 'sassOwn' :
          stylePath = json.src.style !== undefined ? json.src.style : './src/style/'
          break

        default :
          stylePath = json.src.style !== undefined ? json.src.style + 'application/' : './src/style/'
      }

      // Template Path
      switch (pType) {
        case 'html' :
          templatePath = json.src.template !== undefined ? json.src.template : './src/template'
          break

        case 'craft' :
        case 'craftCB' :
          templatePath = json.src.structure !== undefined ? json.src.structure + 'templates/' : './src/structure'
          break

        case 'joomla' :
        case 'joomlaCB' :
          templatePath = json.src.structure !== undefined ? json.src.structure : './src/structure'
          break

        case 'wordpress' :
        case 'wordpressCB' :
          templatePath = json.src.structure !== undefined ? json.src.structure : './src/structure'
          break
      }
    }
  }

  // Writing
  async writing() {
    if (this.props.disableGenerateJS == false) {
      // Write JS File
      this.filesModuleTpl(this, jsPath, pMeth, pType, pCompiler).javascript.forEach(file => {
        this.fs.copyTpl(
          this.templatePath(file.src),
          this.destinationPath(file.dest),
          this.props
        )
      })
    }


    // Write Style File
    this.filesModuleTpl(this, stylePath, pMeth, pType, pCompiler).style.forEach(file => {
      this.fs.copyTpl(
        this.templatePath(file.src),
        this.destinationPath(file.dest),
        this.props
      )
    })

    this.filesModuleTpl(this, templatePath, pMeth, pType, pCompiler).template.forEach(file => {
      this.fs.copyTpl(
        this.templatePath(file.src),
        this.destinationPath(file.dest),
        this.props
      )
    })
  }

  end() {
    this.logMessage({message: `Module ${this.props.moduleName} created!`})
  }
}
