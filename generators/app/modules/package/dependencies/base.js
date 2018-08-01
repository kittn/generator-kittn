const extend = require('deep-extend')
const { gulpDependencies, gulpScripts } = require('./partials/gulp')

function addBaseDependencies (files = {}, context) {
  extend(files.pkg, {
    scripts: {
      build: 'cross-env NODE_ENV=production npm run subtask:bundlewebpack',
      deploy: 'npm run build',
      dev: 'cross-env NODE_ENV=development gulp',
      init: 'npm run build'
    },
    devDependencies: {
      '@babel/cli': '^7.0.0-beta.44',
      '@babel/core': '^7.0.0-beta.44',
      'cross-env': '^5.1.4'
    }
  })

  if (context.props.projectusage !== 'webpackApp') {
    extend(files.pkg, {
      scripts: gulpScripts,
      devDependencies: gulpDependencies
    })
  }

  if (context.props.projectprettier === true) {
    extend(files.pkg, {
      scripts: {
        prettify: 'prettier prettier --loglevel=warn --write "{webpack,src}/**/*.{js,scss}"'
      },
      devDependencies: {
        'eslint-config-prettier': '^2.9.0',
        'eslint-plugin-prettier': '^2.6.0',
        'prettier': '^1.11.1'
      }
    })
  }

  if (context.props.projecttestinge2e === true) {
    extend(files.pkg, {
      scripts: {
        'e2e:open': 'cypress open',
        'e2e': 'cypress'
      },
      devDependencies: {
        'eslint-plugin-cypress': '^2.0.1',
        'cypress': '^3.0.3'
      }
    })
  }
}

module.exports = addBaseDependencies
