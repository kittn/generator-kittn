/**
 * Automatic Deploy
 *
 * @description: Deploy Task for an automated Build Process
 */

import gulp from 'gulp'
import runSequence from 'run-sequence'

const deployTask = (cb) => {

  // Overwrite the Changed Check
  global.changedOverride = true

  runSequence(
    [
      'version:bump',
    ],
    [
      'build:favicon',
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

gulp.task('deploy', deployTask)
module.exports = deployTask

