/**
 * Copy Fonts
 * @description Copy the Font Fils to distribution
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const copyFontsTask = () => {
  kc.files.fonts.forEach(function(item) {
    gulp
      .src(item)
      .pipe(global.checkChanged === true ? $.changed(kc.dist.fonts) : gutil.noop())
      .pipe(gulp.dest(kc.dist.fonts))
  })
}

gulp.task('copy:fonts', copyFontsTask)
module.exports = copyFontsTask
