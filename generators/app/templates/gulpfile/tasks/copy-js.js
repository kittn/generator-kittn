/**
 * Copy JS
 * @description Copy Bower Files to 'dist/'. Use the JSON Array in the config.json [files:jsCopy]]
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const copyJsTask = (cb) => {
  kc.files.jsCopy.forEach((item) => {
    gulp
      .src(item)
      .pipe(global.checkChanged === true ? $.changed(kc.dist.js) : gutil.noop())
      .pipe(gulp.dest(kc.dist.js))
  })

  cb()
}

gulp.task('copy:js', copyJsTask)
module.exports = copyJsTask
