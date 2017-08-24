/**
 * Copy Launch Files
 * @description Copy the Default Build Files to distribution
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const copyLaunchTask = () => {
  kc.files.launch.forEach((item) => {
    gulp
      .src(kc.src.system + item.src)
      .pipe(global.checkChanged === true ? $.changed(kc.dist.base + item.dest) : gutil.noop())
      .pipe(gulp.dest(kc.dist.base + item.dest))
  })
}

gulp.task('copy:launch', copyLaunchTask)
module.exports = copyLaunchTask
