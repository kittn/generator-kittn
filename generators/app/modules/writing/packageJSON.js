// ===========================
// Package.json Partials
// ===========================
const addBaseSettings = require('../package/info/base.js')
const addAuthorData = require('../package/info/author.js')
const addBrowsersList = require('../package/info/browserslist.js')

// Dependencies
const addBaseDependencies = require('../package/dependencies/base.js')
const addSassDependencies = require('../package/dependencies/sass.js')

const writePackageJson = () => {
  return {
    writing: (context) => {
      return new Promise((resolve) => {
        // Getting the template files
        const pkg = context.fs.readJSON(context.templatePath('_package.json'), {})

        // ============================
        // Apply Data to JSON-String
        // ============================
        addBaseSettings({pkg}, context)
        addAuthorData({pkg}, context)
        addBrowsersList({pkg}, context)

        addBaseDependencies({pkg}, context)
        addSassDependencies({pkg}, context)

        // Write package.json
        context.fs.writeJSON(context.destinationPath('package.json'), pkg)

        resolve()
      })
    }
  }
}

module.exports = writePackageJson
