const extend = require('deep-extend')

function addStyleDependencies (files = {}, context) {
  extend(files.pkg, {
    devDependencies: {
      'autoprefixer': '^8.2.0',
      'cssnano': '^4.0.0-rc.2',
      'postcss-aspect-ratio': '^1.0.1',
      'postcss-assets': '^5.0.0',
      'postcss-calc': '^6.0.1',
      'postcss-custom-media': '^6.0.0',
      'postcss-custom-properties': '^7.0.0',
      'postcss-custom-selectors': '^4.0.1',
      'postcss-easings': '^1.0.0',
      'postcss-flexbugs-fixes': '^3.3.0',
      'postcss-pseudo-class-any-link': '^5.0.0',
      'postcss-short-size': '^3.0.0',
      'postcss-scss': '^1.0.5',
      'postcss-svg': '^2.4.0',
      'rucksack-css': '^1.0.2'
    }
  })

  /**
   * If User wants stylelint
   * @method if
   * @param  {object} context The global context with prompts
   */
  if (
    context.props.projectstylelint === true ||
    context.props.projectstylelint === 'strict'
  ) {
    extend(files.pkg, {
      scripts: {
        stylelint: "stylelint 'src/style/**/**/*.scss'"
      },
      devDependencies: {
        stylelint: '^9.2.0',
        'stylelint-config-sass-guidelines': '^5.0.0',
        'stylelint-order': '^0.8.1',
        'stylelint-scss': '^3.0.0',
        'stylelint-selector-bem-pattern': '^2.0.0'
      }
    })

    if (context.props.projectusage !== 'webpackApp') {
      extend(files.pkg, {
        devDependencies: {
          'gulp-stylelint': '^7.0.0'
        }
      })
    }
  }

  /**
   * If User wants to generate above the fold CSS
   * @method if
   * @param  {object} context The global context with prompts
   */
  if (context.props.projectcritical === true) {
    extend(files.pkg, {
      devDependencies: {
        critical: '^0.8.1'
      }
    })
  }

  /**
   * For the Craft Contentbuilder ad some CriticalCSS Function
   * @method if
   * @param  {object} context The global context with prompts
   */
  if (context.props.projectusage === 'craftCB' || context.props.projectusage === 'joomlaCB') {
    extend(files.pkg, {
      scripts: {
        critical: 'node nodescripts/critical.js'
      },
      devDependencies: {
        critical: '^0.8.1',
        'fancy-log': '^1.3.0'
      }
    })
  }

  if (context.props.projectnormalize === 'regular') {
    extend(files.pkg, {
      devDependencies: {
        'postcss-normalize': '^4.0.0'
      }
    })
  }
}

module.exports = addStyleDependencies
