/**
 * Rebuild all Images
 * Copy to distribution, build Sprites
 */

import gulp from 'gulp'

const rebuildImagesTask = () => {
  return gulp.series(
    gulp.parallel(
      'copy:bitmaps',
      'copy:vectors',
      'build:bitmapSprite',
      'build:vectorSprite'
    ),
    'build:symbolCleanup'
  )
}

gulp.task('rebuild:images', rebuildImagesTask())
module.exports = rebuildImagesTask
