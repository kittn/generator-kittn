/**
 * Starting Task for the first Build off the Project Structure
 */

import gulp from 'gulp'
import runSequence from 'run-sequence'

const initTask = (cb) => {

  // Overwrite the Changed Check
  global.changedOverride = true

  runSequence(
    [
      'sassdoc:generate'
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
    cb)
}

gulp.task('init', initTask)
module.exports = initTask
