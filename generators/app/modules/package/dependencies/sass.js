const extend = require('deep-extend')

function addSassDependencies (files = {}, context) {
  extend(files.pkg, {
    scripts: {
      styles: 'gulp compiler:css',
      stylesMinify: 'gulp minify:css'
    },
    devDependencies: {
      'autoprefixer': '^7.1.1',
      'cssnano': '^3.10.0',
      'gulp': '^3.9.1',
      'gulp-load-plugins': '^1.5.0',
      'gulp-postcss': '^6.3.0',
      'gulp-sass': '^3.1.0',
      'gulp-size': '^2.1.0',
      'gulp-sourcemaps': '^2.6.0',
      'gulp-stylelint': '^3.9.0', // Make Conditional
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
      'postcss-svg-fragments': '^2.2.0',
      'rucksack-css': '^0.9.1',
      'stylelint': '^7.10.1', // Make Conditional
      'stylelint-config-sass-guidelines': '^2.1.0', // Make Conditional
      'stylelint-order': '^0.4.4', // Make Conditional
      'stylelint-scss': '^1.4.4', // Make Conditional
      'stylelint-selector-bem-pattern': '^1.0.0', // Make Conditional
      'yargs': '^6.6.0'
    }
  })
}

module.exports = addSassDependencies
