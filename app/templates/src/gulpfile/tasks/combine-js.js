/**
 * Combine JS
 * @description Combine Scripts from Browser to script.js
 * Added as Alternative to Browserify
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const combineJsTask = () => {
  return gulp
    .src(kc.files.jsCombine.files)
    .pipe($.concat(kc.files.jsCombine.filename))
    .pipe(gulp.dest(kc.dist.js))
}

gulp.task('combine:js', combineJsTask)
module.exports = combineJsTask
