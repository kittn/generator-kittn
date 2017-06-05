'use strict'

const Generator = require('yeoman-generator')
const chalk = require('chalk')
const yosay = require('yosay')
const clear = require('clear-terminal')

// Importing modules
const promptsFunction = require('./modules/prompts')
const pkg = require('../../package.json')

// Package.json Partials
const addBaseSettings = require('./modules/package/base.js')
const addAuthorData = require('./modules/package/author.js')
const addBrowsersList = require('./modules/package/browserslist.js')

// And Action!
module.exports = class extends Generator {
  constructor (args, opts) {
    super(args, opts)
    this.pkg = pkg
    this.promptsFunction = promptsFunction.bind(this)

    // Package.json
    this.addBaseSettings = addBaseSettings.bind(this)
    this.addBrowsersList = addBrowsersList.bind(this)
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
    const prompts = promptsFunction()
    return this.prompt(prompts).then(props => {
      // To access props later use this.props.someAnswer;
      this.props = props
    })
  }

  writePackageJson () {
    this.log(`${chalk.magenta('Writing package.json')}`)

    // Get Base package.json (empty file)
    const pkg = this.fs.readJSON(this.templatePath('package.json'), {})

    // Add Partials
    this.addBaseSettings({pkg})
    this.addBrowsersList({pkg})

    // Write File to destination
    this.fs.writeJSON(this.destinationPath('package.json'), pkg)
  }
}
