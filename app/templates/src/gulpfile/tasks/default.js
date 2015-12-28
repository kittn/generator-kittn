/**
 * Default gulp Task 'gulp'
 * watch the working dirs - activates the compilers and refresh the browser
 */
import gulp from 'gulp'

// Overwrite Changed Checks
global.htmlChangedCheck = false

const defaultTask = [
  'browser-sync',
  'watch',
  'watch:js'
]

gulp.task('default', defaultTask)

module.exports = defaultTask
