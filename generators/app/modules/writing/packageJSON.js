// ===========================
// Package.json Partials
// ===========================
const addBaseSettings = require('../package/info/base.js')
const addAuthorData = require('../package/info/author.js')
const addBrowsersList = require('../package/info/browserslist.js')

// Dependencies
const addSassDependencies = require('../package/dependencies/sass.js')

const writePackageJson = () => {
  return {
    writing: (context) => {
      return new Promise((resolve) => {
        // Getting the template files
        const pkg = context.fs.readJSON(context.templatePath('_package.json'), {})

        // ============================
        // Bind Functions to context
        // ============================

        // Base Infos
        context.addBaseSettings = addBaseSettings.bind(context)
        context.addAuthorData = addAuthorData.bind(context)
        context.addBrowsersList = addBrowsersList.bind(context)

        // Dependencies
        context.addSassDependencies = addSassDependencies.bind(context)

        // ============================
        // Apply Data to JSON-String
        // ============================
        context.addBaseSettings({pkg})
        context.addAuthorData({pkg})
        context.addBrowsersList({pkg})
        context.addSassDependencies({pkg})

        // Write package.json
        context.fs.writeJSON(context.destinationPath('package.json'), pkg)

        resolve()
      })
    }
  }
}

module.exports = writePackageJson
