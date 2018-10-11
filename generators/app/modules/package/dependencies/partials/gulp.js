/**
 * Dependencies for Gulp
 *
 * @package  generator-kittn
 * @author   Lars Eichler <larseichler.le@gmail.com>
 */

'use strict'

exports.gulpDependencies = {
  'ansi-html': '^0.0.7',
  'browser-sync': '^2.23.6',
  'gulp': '^3.9.1',
  'gulp-bump': '^3.1.0',
  'gulp-changed': '^3.2.0',
  'gulp-cheerio': '^0.6.3',
  'gulp-concat': '^2.6.1',
  'gulp-favicons': '^2.2.7',
  'gulp-html-prettify': '^0.0.1',
  'gulp-if': '^2.0.2',
  'gulp-imagemin': '^4.1.0',
  'gulp-load-plugins': '^1.5.0',
  'gulp-notify': '^3.2.0',
  'gulp-plumber': '^1.2.0',
  'gulp-postcss': '^8.0.0',
  'gulp-sass': '^4.0.1',
  'gulp-size': '^3.0.0',
  'gulp-sourcemaps': '^2.6.4',
  'gulp.spritesmith': '^6.9.0',
  'gulp-svg-sprite': '^1.4.0',
  'gulp-twig': '^1.2.0',
  'gulp-uglify': '^3.0.0',
  'gulp-util': '^3.0.8',
  'gulp-watch': '^5.0.0',
  'imagemin-jpeg-recompress': '^5.1.0',
  'imagemin-pngquant': '^6.0.0',
  'imagemin-svgo': '^7.0.0',
  'require-dir': '^1.0.0',
  'run-sequence': '^2.2.1',
  'yargs': '^12.0.2'
}

exports.gulpScripts = {
  'subtask:buildgulp': 'gulp build --env=production',
  assets: 'gulp copy:assets --env=init',
  build: 'cross-env NODE_ENV=production npm run subtask:buildgulp && cross-env NODE_ENV=production npm run subtask:bundlewebpack',
  deploy: 'npm run build',
  dev: 'cross-env NODE_ENV=development gulp',
  favicon: 'gulp build:favicon --env=init',
  htmlassets: 'gulp copy:contentimages --env=init',
  init: 'cross-env NODE_ENV=production gulp init --env=init && cross-env NODE_ENV=production  npm run subtask:bundlewebpack',
  template: 'gulp compiler:html --env=init',
  uiimages: 'gulp rebuild:images --env=init',
  fonts: 'gulp copy:fonts --env=init'
}
