const extend = require('deep-extend')

function addBaseDependencies (files = {}, context) {
  extend(files.pkg, {
    scripts: {
      'assets': 'gulp copy:assets --env=init',
      'build': 'npm run subtask:bundlewebpack && NODE_ENV=production npm run subtask:buildgulp',
      'deploy': 'npm run subtask:bundlewebpack && npm run subtask:buildgulp',
      'dev': 'NODE_ENV=development gulp',
      'favicon': 'gulp build:favicon --env=init',
      'htmlassets': 'gulp copy:contentimages --env=init',
      'init': 'gulp init --env=init && npm run subtask:bundlewebpack',
      'template': 'gulp compiler:html --env=init',
      'uiimages': 'gulp rebuild:images --env=init'
    },
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
