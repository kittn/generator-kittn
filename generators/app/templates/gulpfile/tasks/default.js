/**
 * Default gulp Task 'gulp'
 * watch the working dirs - activates the compilers and refresh the browser
 */
import gulp from 'gulp'
import runSequence from 'run-sequence'

const defaultTask = (cb) => {

  // Overwrite Changed Checks
  global.checkChanged = true

  runSequence(
    [
      'watch'
    ],
    [
      'browser-sync'
    ],
    cb)
}


gulp.task('default', defaultTask)
module.exports = defaultTask
