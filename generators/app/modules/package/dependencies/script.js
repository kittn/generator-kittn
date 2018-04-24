const extend = require('deep-extend')

function addScriptDependencies (files = {}, context) {
  extend(files.pkg, {
    scripts: {
      'webpack:analyze':
        'webpack-bundle-analyzer webpack/stats.json dist/assets/'
    },
    devDependencies: {
      '@babel/plugin-proposal-class-properties': '^7.0.0-beta.44',
      '@babel/plugin-proposal-object-rest-spread': '^7.0.0-beta.44',
      '@babel/plugin-syntax-dynamic-import': '^7.0.0-beta.44',
      '@babel/plugin-transform-runtime': '^7.0.0-beta.44',
      '@babel/preset-env': '^7.0.0-beta.44',
      '@babel/register': '^7.0.0-beta.44',
      '@babel/polyfill': '^7.0.0-beta.44',
      'babel-loader': '^8.0.0-beta.0',
      'babel-eslint': '^8.2.1',
      'clean-webpack-plugin': '^0.1.19',
      'eslint': '^4.19.1',
      'eslint-config-standard': '^11.0.0',
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
      'html-webpack-plugin': '^3.1.0',
      'optimize-css-assets-webpack-plugin': '^4.0.0',
      'webpack': '^4.6.0',
      'webpack-cli': '^2.0.13',
      'webpack-bundle-analyzer': '^2.11.1',
      'webpack-config-utils': '^2.3.0',
      'webpack-dev-middleware': '^3.1.0',
      'webpack-hot-middleware': '^2.21.2',
      'webpackbar': '^1.5.1',
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
        '@babel/preset-react': '^7.0.0-beta.44'
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
      devDependencies: {
        'css-loader': '^0.28.11',
        'eslint-config-vue': '^2.0.2',
        'eslint-plugin-vue': '^4.4.0',
        'file-loader': '^1.1.11',
        'postcss-loader': '^2.1.3',
        'sass-loader': '^7.0.1',
        svgo: '^1.0.5',
        'svgo-loader': '^2.1.0',
        'svg-fill-loader': '^0.0.8',
        'svg-sprite-loader': '^3.7.0',
        'style-loader': '^0.20.3',
        'url-loader': '^1.0.0',
        'vue-loader': '^14.2.2',
        'vue-style-loader': '^4.1.0',
        'vue-template-compiler': '^2.5.16'
      },
      dependencies: {
        vue: '^2.5.16'
      }
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
          'node-sass': '^4.7.2',
          portfinder: '^1.0.13',
          'webpack-dev-server': '^3.1.0'
        }
      })
    }
  }

  // If Vue with E2E Testing
  if (
    context.props.projectjsframework === 'vue' &&
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
    context.props.projectjsframework === 'vue' &&
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
    context.props.projectjsframework === 'vue' &&
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
      devDependencies: {
        'easy-stylelint-plugin': '^0.0.9',
        stylelint: '^9.2.0'
        // 'stylelint-webpack-plugin': '^0.10.3'
      }
    })
  }

  if (context.props.projecttypescript === true) {
    extend(files.pkg, {
      devDependencies: {
        'ts-loader': '^4.2.0',
        typescript: '^2.8.1'
      }
    })
  }

  // Vue Plugins
  if (
    context.props.projectusage === 'webpackApp' ||
    (typeof context.props.projectvueplugins !== 'undefined' &&
      context.props.projectvueplugins === true)
  ) {
    extend(files.pkg, {
      dependencies: {
        'vue-router': '^3.0.1',
        axios: '^0.18.0',
        vuex: '^3.0.1',
        'vuex-router-sync': '^5.0.0'
      }
    })
  }
}

module.exports = addScriptDependencies
