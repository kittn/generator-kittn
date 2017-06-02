/**
 * Build Modernizr
 * @description Build a customized Modernizr File
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const buildModernizrTask = () => {
  return gulp
    .src('node_modules/gulp-modernizr/build/modernizr-custom.js')
    .pipe($.modernizr({
      crawl: false,
      options : kc.modernizr.options,
      tests: kc.modernizr.tests
    }))
    .pipe(gulp.dest(kc.dist.js))
}

gulp.task('build:modernizr', buildModernizrTask)
module.exports = buildModernizrTask
