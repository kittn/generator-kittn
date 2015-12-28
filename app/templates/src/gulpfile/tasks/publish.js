/**
 * Publish
 * @description Publish all Files in distribution
 * Add a new Versionnumber to Package and Bower
 * Compress Files
 */

import gulp from 'gulp'
import runSequence from 'run-sequence'

const publishTask = (cb) => {

  runSequence(
    [
      'version:bump',
    ],
    [
      'styleguide:generate'
    ],
    [
      'minify:js',
      'minify:contentimages',
      'minify:inlineimages',
      'minify:css'
    ],
    [
      'header:add'
    ],
    cb)
}

gulp.task('publish', publishTask)
module.exports = publishTask
