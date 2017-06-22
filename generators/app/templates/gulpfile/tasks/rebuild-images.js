/**
 * Rebuild all Images
 * Copy to distribution, build Sprites
 */

import gulp from 'gulp'
import runSequence from 'run-sequence'

const rebuildImagesTask = (cb) => {
  runSequence(
    [
      'copy:bitmaps',
      'copy:vectors',
      'build:bitmapSprite',
      'build:vectorSprite'
    ],
    [
      'build:symbolCleanup'
    ],
    cb)
}

gulp.task('rebuild:images', rebuildImagesTask)
module.exports = rebuildImagesTask

