/**
 * Default gulp Task 'gulp'
 * watch the working dirs - activates the compilers and refresh the browser
 */
import gulp from 'gulp'
import FwdRef from 'undertaker-forward-reference'

gulp.registry(FwdRef())

const defaultTask = () => {
  // Overwrite Changed Checks
  global.checkChanged = true

  return gulp.series(
    'watch',
    'browser-sync'
  )
}

gulp.task('default', defaultTask())
module.exports = defaultTask
