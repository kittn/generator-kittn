/**
 * Javascript Code Quality
 * @description Check the JS Code Quality
 */

import kc from '../../config.json'
import gulp from 'gulp'
import stylish from 'jshint-stylish'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const codequalityJsTask = () => {
  gulp
    .src([kc.dist.js + '*.js'])
    .pipe($.jshint())
    .pipe($.jshint.reporter(stylish))
}

gulp.task('codequality:js', codequalityJsTask)
module.exports = codequalityJsTask
