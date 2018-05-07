const extend = require('deep-extend')
const { vueDevDependencies, vueDependencies, vuePluginsDependencies } = require('./partials/vue')
const { stylelintWebpackDependencies } = require('./partials/stylelint')
const { typescriptDevDependencies } = require('./partials/typescript')
const { containerQueryDependencies } = require('./partials/contentBuilder')

function addScriptDependencies (files = {}, context) {
  extend(files.pkg, {
    scripts: {
      'webpack:analyze':
        'webpack-bundle-analyzer webpack/stats.json dist/assets/'
    },
    devDependencies: {
      '@babel/plugin-proposal-class-properties': '^7.0.0-beta.46',
      '@babel/plugin-proposal-object-rest-spread': '^7.0.0-beta.46',
      '@babel/plugin-syntax-dynamic-import': '^7.0.0-beta.46',
      '@babel/plugin-transform-runtime': '^7.0.0-beta.46',
      '@babel/preset-env': '^7.0.0-beta.46',
      '@babel/register': '^7.0.0-beta.46',
      '@babel/polyfill': '^7.0.0-beta.46',
      'babel-loader': '^8.0.0-beta.2',
      'babel-eslint': '^8.2.1',
      'clean-webpack-plugin': '^0.1.19',
      'eslint': '^4.19.1',
      'eslint-config-standard': '^12.0.0-alpha.0',
      'eslint-plugin-promise': '^3.7.0',
      'eslint-plugin-standard': '^3.0.1',
      'eslint-formatter-pretty': '^1.3.0',
      'eslint-friendly-formatter': '^4.0.0',
      'eslint-loader': '^2.0.0',
      'eslint-plugin-import': '^2.10.0',
      'eslint-plugin-jsx-a11y': '^6.0.3',
      'eslint-plugin-node': '^6.0.1',
      'eslint-import-resolver-webpack': '^0.9.0',
      'extract-text-webpack-plugin': '^4.0.0-beta.0',
      'friendly-errors-webpack-plugin': '^1.6.1',
      'html-webpack-plugin': '^3.2.0',
      'optimize-css-assets-webpack-plugin': '^4.0.0',
      'webpack': '^4.7.0',
      'webpack-cli': '^2.1.3',
      'webpack-bundle-analyzer': '^2.11.1',
      'webpack-config-utils': '^2.3.0',
      'webpack-dev-middleware': '^3.1.0',
      'webpack-hot-middleware': '^2.21.2',
      'webpackbar': '^2.6.1',
      'webpack-stylish': '^0.1.8',
      'webpack-merge': '^4.1.2',
      'write-file-webpack-plugin': '^4.2.0'
    },
    dependencies: {
      'bowser': '^1.9.3',
      'pyrsmk-toast': '^2.2.0',
      'svgxuse': '^1.2.6'
    }
  })

  if (context.props.projectusage !== 'webpackApp') {
    extend(files.pkg, {
      scripts: {
        'subtask:bundlewebpack':
          'cross-env NODE_ENV=production webpack --config=webpack/webpack.prod.babel.js -p --colors --mode=production',
        scripts: 'gulp rebuild:js --env=init'
      },
      dependencies: {
        lazysizes: '^4.0.2'
      }
    })
  }

  // Webpack Bundle analyzer
  if (
    context.props.projectusage === 'craftCB' ||
    context.props.projectusage === 'craft'
  ) {
    extend(files.pkg, {
      scripts: {
        'webpack:analyze':
          'webpack-bundle-analyzer webpack/stats.json dist/public/assets/'
      }
    })
  }

  // Webpack Bundle analyzer
  if (
    context.props.projectusage === 'wordpress' ||
    context.props.projectusage === 'wordpressCB'
  ) {
    extend(files.pkg, {
      scripts: {
        'webpack:analyze': `webpack-bundle-analyzer webpack/stats.json dist/wp-content/themes/${
          context.props.projectname
        }/assets/`
      }
    })
  }

  // Webpack Bundle analyzer
  if (
    context.props.projectusage === 'joomla' ||
    context.props.projectusage === 'joomlaCB'
  ) {
    extend(files.pkg, {
      scripts: {
        'webpack:analyze': `webpack-bundle-analyzer webpack/stats.json dist/templates/${
          context.props.projectname
        }/assets/`
      }
    })
  }

  // Container-Queries
  if (
    context.props.projectcontainerqueries === true ||
    context.props.projectusage === 'craftCB' ||
    context.props.projectusage === 'joomlaCB' ||
    context.props.projectusage === 'wordpressCB'
  ) {
    extend(files.pkg, {
      dependencies: containerQueryDependencies
    })
  }

  // React
  if (context.props.projectjsframework === 'react') {
    extend(files.pkg, {
      devDependencies: {
        'eslint-plugin-react': '^6.9.0',
        '@babel/preset-react': '^7.0.0-beta.46'
      },
      dependencies: {
        react: '^15.5.4',
        'react-dom': '^15.5.4'
      }
    })
  }

  // Vue
  if (
    context.props.projectjsframework === 'vue' ||
    context.props.projectusage === 'webpackApp'
  ) {
    extend(files.pkg, {
      devDependencies: vueDevDependencies,
      dependencies: vueDependencies
    })
    if (context.props.projectusage === 'webpackApp') {
      extend(files.pkg, {
        scripts: {
          build:
            'cross-env NODE_ENV=production webpack --config=webpack/webpack.prod.babel.js -p --colors --mode production',
          dev:
            'cross-env NODE_ENV=development webpack-dev-server --config=webpack/webpack.dev.babel.js --mode development'
        },
        devDependencies: {
          'node-sass': '^4.9.0',
          portfinder: '^1.0.13',
          'webpack-dev-server': '^3.1.0'
        }
      })
    }
  }

  // If Vue with E2E Testing
  if (
    (context.props.projectjsframework === 'vue' ||
    context.props.projectusage === 'webpackApp') &&
    context.props.projecttestinge2e === true
  ) {
    extend(files.pkg, {
      devDependencies: {
        '@vue/cli-plugin-e2e-cypress': '^3.0.0-beta.6'
      }
    })
  }

  // If Vue with Unit Testing
  if (
    (context.props.projectjsframework === 'vue' ||
    context.props.projectusage === 'webpackApp') &&
    context.props.projecttestingunit === true
  ) {
    extend(files.pkg, {
      scripts: {
        'unit': 'jest'
      },
      devDependencies: {
        '@vue/babel-preset-app': '^3.0.0-beta.6',
        '@vue/server-test-utils': '^1.0.0-beta.14',
        '@vue/test-utils': '^1.0.0-beta.14',
        'babel-7-jest': '^21.3.3',
        'babel-core': '^7.0.0-0',
        'babel-jest': '^22.4.3',
        'jest': '^22.4.3',
        'jest-vue-preprocessor': '^1.4.0',
        'regenerator-runtime': '^0.11.1',
        'vue-jest': '^2.5.0'
      }
    })
  }

  // Adding Wallaby
  // If Vue with Unit Testing
  if (
    (context.props.projectjsframework === 'vue' ||
    context.props.projectusage === 'webpackApp') &&
    context.props.projecttestingwallaby === true
  ) {
    extend(files.pkg, {
      devDependencies: {
        'wallaby-vue-compiler': '^1.0.2'
      }
    })
  }

  if (
    (context.props.projectjsframework === 'vue' ||
      context.props.projectusage === 'webpackApp') &&
    (context.props.projectstylelint === true ||
      context.props.projectstylelint === 'strict')
  ) {
    extend(files.pkg, {
      devDependencies: stylelintWebpackDependencies
    })
  }

  if (context.props.projecttypescript === true) {
    extend(files.pkg, {
      devDependencies: typescriptDevDependencies
    })
  }

  // Vue Plugins
  if (
    context.props.projectusage === 'webpackApp' ||
    (typeof context.props.projectvueplugins !== 'undefined' &&
      context.props.projectvueplugins === true)
  ) {
    extend(files.pkg, {
      dependencies: vuePluginsDependencies
    })
  }
}

module.exports = addScriptDependencies
