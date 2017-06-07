const extend = require('deep-extend')

function addBaseDependencies (files = {}, context) {
  extend(files.pkg, {
    devDependencies: {
      'ansi-html': '^0.0.7',
      'babel-core': '^6.24.1',
      'babel-preset-es2015': '^6.24.1',
      'browser-sync': '^2.18.7',
      'gulp-notify': '^3.0.0',
      'require-dir': '^0.3.2'
    }
  })
}

module.exports = addBaseDependencies
