/**
 * Minify Javascript
 * @description Compress all Javascript Files in the dist folder
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const minifyJsTask = () => {
  return gulp
    .src(kc.dist.js + '*.js')
    .pipe($.uglify(kc.minify.javascript.options))
    .pipe(gulp.dest(kc.dist.js))
}

gulp.task('minify:js', minifyJsTask)
module.exports = minifyJsTask
