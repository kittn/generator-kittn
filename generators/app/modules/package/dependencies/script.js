const extend = require('deep-extend')

function addScriptDependencies (files = {}, context) {
  extend(files.pkg, {
    scripts: {
      'webpack:analyze': 'webpack-bundle-analyzer webpack/stats.json dist/assets/'
    },
    devDependencies: {
      '@babel/plugin-proposal-object-rest-spread': '^7.0.0-beta.40',
      '@babel/plugin-syntax-dynamic-import': '^7.0.0-beta.40',
      '@babel/plugin-transform-runtime': '^7.0.0-beta.40',
      '@babel/preset-env': '^7.0.0-beta.40',
      '@babel/register': '^7.0.0-beta.40',
      '@babel/polyfill': '^7.0.0-beta.40',
      'babel-loader': '^8.0.0-beta.0',
      'babel-eslint': '^8.2.1',
      'clean-webpack-plugin': '^0.1.18',
      'eslint': '^4.15.0',
      'eslint-config-standard': '^11.0.0',
      'eslint-plugin-promise': '^3.4.1',
      'eslint-plugin-standard': '^3.0.1',
      'eslint-formatter-pretty': '^1.1.0',
      'eslint-friendly-formatter': '^3.0.0',
      'eslint-loader': '^2.0.0',
      'eslint-plugin-html': '^4.0.0',
      'eslint-plugin-import': '^2.2.0',
      'eslint-plugin-jsx-a11y': '^6.0.0',
      'eslint-plugin-node': '^5.2.1',
      'eslint-import-resolver-webpack': '^0.8.1',
      'extract-text-webpack-plugin': '^4.0.0-beta.0',
      'friendly-errors-webpack-plugin': '^1.6.1',
      'html-webpack-plugin': '^3.0.0',
      'optimize-css-assets-webpack-plugin': '^3.2.0',
      'webpack': '^4.1.0',
      'webpack-cli': '^2.0.4',
      'webpack-bundle-analyzer': '^2.8.2',
      'webpack-config-utils': '^2.3.0',
      'webpack-dev-middleware': '^3.0.0',
      'webpack-hot-middleware': '^2.18.0',
      'webpack-merge': '^4.1.2'
    },
    dependencies: {
      'bowser': '^1.9.1',
      'pyrsmk-toast': '^2.1.1',
      'svgxuse': '^1.2.1'
    }
  })

  if ((context.props.projectusage === 'html' && context.props.projectstructure === 'uncompiled') || context.props.projectusage === 'webpackApp') {
    extend(files.pkg, {
      devDependencies: {
        'write-file-webpack-plugin': '^4.2.0'
      }
    })
  }

  if (context.props.projectusage !== 'webpackApp') {
    extend(files.pkg, {
      scripts: {
        'subtask:bundlewebpack': 'cross-env NODE_ENV=production webpack --config=webpack/webpack.prod.babel.js -p --colors --mode=production',
        'scripts': 'gulp rebuild:js --env=init'
      },
      dependencies: {
        'lazysizes': '^3.0.0'
      }
    })
  }

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
        '@babel/preset-react': '^7.0.0-beta.40'
      },
      dependencies: {
        'react': '^15.5.4',
        'react-dom': '^15.5.4'
      }
    })
  }

  // Vue
  if (context.props.projectjsframework === 'vue' || context.props.projectusage === 'webpackApp') {
    extend(files.pkg, {
      devDependencies: {
        'css-loader': '^0.26.1',
        'eslint-config-vue': '^2.0.2',
        'eslint-plugin-html': '^4.0.0',
        'eslint-plugin-vue': '^4.3.0',
        'file-loader': '^1.1.10',
        'optimize-css-assets-webpack-plugin': '^3.1.1',
        'postcss-loader': '^2.0.6',
        'sass-loader': '^6.0.6',
        'svgo': '^1.0.5',
        'svgo-loader': '^2.1.0',
        'svg-fill-loader': '^0.0.8',
        'svg-sprite-loader': '^3.7.0',
        'style-loader': '^0.20.3',
        'url-loader': '^1.0.0',
        'vue-loader': '^14.1.0',
        'vue-style-loader': '^4.0.0',
        'vue-template-compiler': '^2.5.0'
      },
      dependencies: {
        'vue': '^2.5.0'
      }
    })

    if (context.props.projectusage === 'webpackApp') {
      extend(files.pkg, {
        scripts: {
          'build': 'cross-env NODE_ENV=production webpack --config=webpack/webpack.prod.babel.js -p --colors --mode production',
          'dev': 'cross-env NODE_ENV=development webpack-dev-server --config=webpack/webpack.dev.babel.js --mode development'
        },
        devDependencies: {
          'node-sass': '^4.7.2',
          'portfinder': '^1.0.13',
          'webpack-dev-server': '^3.1.0'
        }
      })
    }
  }

  if ((context.props.projectjsframework === 'vue' || context.props.projectusage === 'webpackApp') && context.props.projectstylelint === true) {
    extend(files.pkg, {
      devDependencies: {
        'stylelint': '^9.1.3',
        'stylelint-webpack-plugin': '^0.10.3'
      }
    })
  }

  // Vue Plugins
  if (context.props.projectusage === 'webpackApp' || (typeof context.props.projectvueplugins !== 'undefined' && context.props.projectvueplugins === true)) {
    extend(files.pkg, {
      dependencies: {
        'vue-router': '^3.0.1',
        'axios': '^0.15.3',
        'vuex': '^3.0.0',
        'vuex-router-sync': '^5.0.0'
      }
    })
  }
}

module.exports = addScriptDependencies
