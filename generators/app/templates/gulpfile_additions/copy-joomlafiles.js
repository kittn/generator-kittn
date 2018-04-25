/**
 * Copy Joomla Files
 * @description Copy all Joomla Files
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const copyJoomlaFiles = () => {
  kc.joomlafiles.forEach(function(item) {
    gulp
      .src([item.src + '**/**'])
      .pipe(global.checkChanged === true ? $.changed(item.dest) : gutil.noop())
      .pipe(gulp.dest(item.dest))
  })
}

gulp.task('copy:joomlafiles', copyJoomlaFiles)
module.exports = copyJoomlaFiles
