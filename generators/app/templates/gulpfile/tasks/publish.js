/**
 * Publish
 * @description Publish all Files in distribution
 * Add a new Versionnumber to Package and Bower
 * Compress Files
 */

import gulp from 'gulp'
import FwdRef from 'undertaker-forward-reference'

gulp.registry(FwdRef())

const publishTask = () => {
  // Overwrite the Changed Check
  global.checkChanged = true

  return gulp.series(
    'version:bump',
    gulp.parallel(
      'minify:js',
      'minify:contentimages',
      'minify:inlineimages',
      'minify:css'
    )
  )
}

gulp.task('publish', publishTask())
module.exports = publishTask
