'use strict'

const Generator = require('yeoman-generator')
const chalk = require('chalk')
const yosay = require('yosay')
const clear = require('clear-terminal')
const commandExists = require('command-exists')

// Importing modules
const promptsFunction = require('./modules/prompt')
const pkg = require('../../package.json')

// Package JSON
const writePackageJson = require('./modules/writing/packageJson')

// Copy Sources
const copySrc = require('./config/copySrc')

// And Action!
module.exports = class extends Generator {
  constructor (args, opts) {
    super(args, opts)
    this.pkg = pkg
    this.promptsFunction = promptsFunction.bind(this)

    // Package.json
    this.writePackageJson = writePackageJson.bind(this)

    // Copy Sources
    this.copySrc = copySrc
  }

    // Initializing
  async initializing () {
    this.log(`${chalk.magenta('Cleaning Directory')}`)
    try {
      this.spawnCommandSync('rm', ['-rf', '*'])
    } catch (e) {
      if (e) this.log(e)
    }
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

  async writing () {
    this.log(`${chalk.magenta('Writing package.json')}`)

    // Write Package.json
    this.writePackageJson().writing(this)

    // Copy all sources
    this.copySrc.files.forEach(file => {
      if (!file.projectContext || file.projectContext.includes(this.props.projectcssstructure)) {
        if (file.filename) {
          this.log(this.props)
          this.log(`Filename: ${file.filename}`)
          this.log(this.props[file.filename])
          this.fs.copyTpl(
            this.templatePath(file.src),
            this.destinationPath(file.dest.replace('%s', this.props[file.filename])),
            this.props
          )
        } else {
          this.fs.copyTpl(
            this.templatePath(file.src),
            this.destinationPath(file.dest),
            this.props
          )
        }
      }
    })

    this.copySrc.folders.forEach(folder => {
      if (folder.projectContext.includes(this.props.projectcssstructure)) {
        this.fs.copyTpl(
          this.templatePath(folder.src),
          this.destinationPath(folder.dest),
          this.props
        )
      }
    })
  }
}
