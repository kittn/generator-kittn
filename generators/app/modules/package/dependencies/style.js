const extend = require('deep-extend')

function addStyleDependencies (files = {}, context) {
  extend(files.pkg, {
    devDependencies: {
      'autoprefixer': '^7.1.1',
      'cssnano': '^3.10.0',
      'gulp': '^3.9.1',
      'gulp-load-plugins': '^1.5.0',
      'gulp-postcss': '^6.3.0',
      'gulp-sass': '^3.1.0',
      'gulp-size': '^2.1.0',
      'gulp-sourcemaps': '^2.6.0',
      'gulp-util': '^3.0.8',
      'postcss-aspect-ratio': '^1.0.1',
      'postcss-assets': '^4.1.0',
      'postcss-calc': '^5.3.1',
      'postcss-custom-media': '^6.0.0',
      'postcss-custom-properties': '^6.0.1',
      'postcss-custom-selectors': '^4.0.1',
      'postcss-easings': '^1.0.0',
      'postcss-flexbugs-fixes': '^3.0.0',
      'postcss-pseudo-class-any-link': '^4.0.0',
      'postcss-short-size': '^3.0.0',
      'postcss-scss': '^1.0.1',
      'postcss-svg': '^2.1.0',
      'rucksack-css': '^0.9.1',
      'yargs': '^6.6.0'
    }
  })

  /**
   * If User wants stylelint
   * @method if
   * @param  {object} context The global context with prompts
   */
  if (context.props.projectstylelint === true) {
    extend(files.pkg, {
      scripts: {
        'stylelint': "stylelint 'src/style/**/**/*.scss'"
      },
      devDependencies: {
        'gulp-stylelint': '^3.9.0',
        'stylelint': '^7.10.1',
        'stylelint-config-sass-guidelines': '^2.1.0',
        'stylelint-order': '^0.4.4',
        'stylelint-scss': '^1.4.4',
        'stylelint-selector-bem-pattern': '^1.0.0'
      }
    })
  }

  /**
   * If User wants to generate above the fold CSS
   * @method if
   * @param  {object} context The global context with prompts
   */
  if (context.props.projectcritical === true) {
    extend(files.pkg, {
      devDependencies: {
        'critical': '^0.8.1'
      }
    })
  }

  /**
   * For the Craft Contentbuilder ad some CriticalCSS Function
   * @method if
   * @param  {object} context The global context with prompts
   */
  if (context.props.projectusage === 'craftCB') {
    extend(files.pkg, {
      scripts: {
        'critical': 'node nodescripts/critical.js'
      },
      devDependencies: {
        'critical': '^0.8.1',
        'fancy-log': '^1.3.0'
      }
    })
  }

  if (context.props.projectnormalize === 'regular') {
    extend(files.pkg, {
      devDependencies: {
        'postcss-normalize': '^3.0.0'
      }
    })
  }
}

module.exports = addStyleDependencies
