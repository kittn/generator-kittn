const extend = require('deep-extend')

function addSassDependencies (files = {}) {
  extend(files.pkg, {
    devDependencies: {
      'gulp-sass': '^3.1.0'
    }
  })
}

module.exports = addSassDependencies
