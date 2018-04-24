// ===========================
// Package.json Partials
// ===========================
const addBaseConfig = require('../config/base.js')
const addHTMLConfig = require('../config/html.js')
const addCraftConfig = require('../config/craft.js')
const addJoomlaConfig = require('../config/joomla.js')
const addWordpressConfig = require('../config/wordpress.js')

const writeConfigJson = () => {
  return {
    writing: (context) => {
      return new Promise((resolve) => {
        // Getting the template files
        let pkg = context.fs.readJSON(context.templatePath('config.json'), {})

        // ============================
        // Apply Data to JSON-String
        // ============================
        addBaseConfig({pkg}, context)
        addHTMLConfig({pkg}, context)
        addCraftConfig({pkg}, context)
        addJoomlaConfig({pkg}, context)
        addWordpressConfig({pkg}, context)

        // Write package.json
        context.fs.writeJSON(context.destinationPath('config.json'), pkg)

        resolve()
      })
    }
  }
}

module.exports = writeConfigJson
