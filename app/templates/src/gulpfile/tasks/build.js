/**
 * Automatic Deploy
 *
 * @description: Deploy Task for an automated Build Process
 */

import gulp from 'gulp'
import runSequence from 'run-sequence'

const buildTask = (cb) => {

  // Overwrite the Changed Check
  global.changedOverride = true

  runSequence(
    [
      'version:bump',
    ],
    [
      'copy:launch',
      'copy:fonts',
      'rebuild:js',
      'rebuild:images',
      'copy:contentimages'
    ],
    [
      'compiler:css',
      'compiler:html'
    ],
    [
      'minify:js',
      'minify:contentimages',
      'minify:inlineimages',
      'minify:css'
    ],
    [
      'optimize:criticalCss'
    ],
    cb)
}

gulp.task('build', buildTask)
module.exports = buildTask