/**
 * Rebuild all JS Files
 * Copy to distribution
 */

import gulp from 'gulp'

const rebuildJsTask =
  [
    'build:modernizr',
    'build:conditionizr',
    'copy:js',
    'compiler:js'
  ]


gulp.task('rebuild:js', rebuildJsTask)
module.exports = rebuildJsTask
