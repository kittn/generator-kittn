const extend = require('deep-extend')

function addScriptDependencies (files = {}, context) {
  extend(files.pkg, {
    scripts: {
      'subtask:bundlewebpack': 'webpack --config=webpack/webpack.config.babel.js -p --colors --env.bundle=production --env=production',
      'scripts': 'gulp rebuild:js --env=init',
      'webpack:analyze': 'webpack-bundle-analyzer webpack/stats.json dist/assets/'
    },
    devDependencies: {
      'babel-loader': '^7.1.0',
      'babel-eslint': '^7.2.3',
      'babel-plugin-transform-runtime': '^6.22.0',
      'babel-plugin-syntax-dynamic-import': '^6.18.0',
      'babel-preset-env': '^1.2.2',
      'babel-register': '^6.22.0',
      'eslint': '^3.15.0',
      'eslint-config-standard': '^6.2.1',
      'eslint-plugin-promise': '^3.4.1',
      'eslint-plugin-standard': '^2.0.1',
      'eslint-formatter-pretty': '^1.1.0',
      'eslint-friendly-formatter': '^2.0.7',
      'eslint-loader': '^1.6.1',
      'eslint-plugin-html': '^2.0.0',
      'eslint-plugin-import': '^2.2.0',
      'eslint-plugin-jsx-a11y': '^4.0.0',
      'eslint-import-resolver-webpack': '^0.8.1',
      'extract-text-webpack-plugin': '3.0.0',
      'friendly-errors-webpack-plugin': '^1.6.1',
      'html-webpack-plugin': '^2.29.0',
      'webpack': '^3.2.0',
      'webpack-bundle-analyzer': '^2.8.2',
      'webpack-config-utils': '^2.3.0',
      'webpack-dev-middleware': '^1.10.0',
      'webpack-hot-middleware': '^2.18.0',
      'webpack-merge': '^2.6.1',
      'webpack2-polyfill-plugin': '^0.0.2',
      'write-file-webpack-plugin': '^4.1.0'
    },
    dependencies: {
      'babel-polyfill': '^6.23.0',
      'bowser': '^1.7.1',
      'lazysizes': '^3.0.0',
      'pyrsmk-toast': '^2.1.1',
      'svgxuse': '^1.2.1'
    }
  })

  // Webpack Bundle analyzer
  if (context.props.projectusage === 'craftCB' || context.props.projectusage === 'craft') {
    extend(files.pkg, {
      scripts: {
        'webpack:analyze': 'webpack-bundle-analyzer webpack/stats.json dist/public/assets/'
      }
    })
  }

  // Webpack Bundle analyzer
  if (context.props.projectusage === 'wordpress' || context.props.projectusage === 'wordpressCB') {
    extend(files.pkg, {
      scripts: {
        'webpack:analyze': `webpack-bundle-analyzer webpack/stats.json dist/wp-content/themes/${context.props.projectname}/assets/`
      }
    })
  }

  // Container-Queries
  if (context.props.projectcontainerqueries === true || context.props.projectusage === 'craftCB' || context.props.projectusage === 'wordpressCB') {
    extend(files.pkg, {
      dependencies: {
        'cq-prolyfill': '^0.4.0'
      }
    })
  }

  // React
  if (context.props.projectjsframework === 'react') {
    extend(files.pkg, {
      devDependencies: {
        'eslint-plugin-react': '^6.9.0',
        'babel-preset-react': '^6.24.1'
      },
      dependencies: {
        'react': '^15.5.4',
        'react-dom': '^15.5.4'
      }
    })
  }

  // Vue
  if (context.props.projectjsframework === 'vue') {
    extend(files.pkg, {
      devDependencies: {
        'babel-preset-es2015': '^6.24.1',
        'babel-preset-stage-2': '^6.24.1',
        'css-loader': '^0.26.1',
        'eslint-config-vue': '^2.0.2',
        'eslint-plugin-html': '^3.0.0',
        'eslint-plugin-vue': '^2.0.1',
        'file-loader': '^0.11.2',
        'json-loader': '^0.5.7',
        'optimize-css-assets-webpack-plugin': '^3.1.1',
        'postcss-loader': '^2.0.6',
        'sass-loader': '^6.0.6',
        'sass-resources-loader': '^1.3.0',
        'stylelint-webpack-plugin': '^0.8.0',
        'svg-sprite-loader': '^3.2.4',
        'vue-loader': '^13.0.2',
        'vue-style-loader': '^3.0.0',
        'vue-template-compiler': '^2.1.10'
      },
      dependencies: {
        'vue': '^2.4.0'
      }
    })
  }

  if (context.props.projectjsframework === 'vue' && context.props.projectstylelint === true) {
    extend(files.pkg, {
      devDependencies: {
        'stylelint-webpack-plugin': '^0.8.0'
      }
    })
  }

  // Vue Plugins
  if (typeof context.props.projectvueplugins !== 'undefined') {
    if (context.props.projectvueplugins === true) {
      extend(files.pkg, {
        dependencies: {
          'vue-router': '^2.2.0',
          'axios': '^0.15.3',
          'vue-axios': '^1.2.2',
          'vuex': '^2.1.2',
          'vuex-router-sync': '^4.1.2'
        }
      })
    }
  }
}

module.exports = addScriptDependencies
