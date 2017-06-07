const extend = require('deep-extend')

function addScriptDependencies (files = {}, context) {
  extend(files.pkg, {
    scripts: {
    },
    devDependencies: {
    }
  })
}

module.exports = addScriptDependencies
