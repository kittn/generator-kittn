/**
 * Styleguide Assets
 * @description Copy all Assets to Styleguide
 */

import kc from '../../config.json'
import gulp from 'gulp'

const styleguideAssetsTask = () => {
  // Copy Fonts
  gulp
    .src(kc.dist.fonts + '**/*')
    .pipe(gulp.dest('doc/styleguide/assets/fonts'))

  // Copy CSS Images
  gulp
    .src(kc.dist.cssimg + '**/*')
    .pipe(gulp.dest('doc/styleguide/assets/img'))

  // Copy HTML Images
  gulp
    .src(kc.dist.htmlimg + '**/*')
    .pipe(gulp.dest('doc/styleguide/images'))

  // Copy JS
  gulp
    .src(kc.dist.js + '**/*')
    .pipe(gulp.dest('doc/styleguide/assets/js'))
}

gulp.task('styleguide:assets', styleguideAssetsTask)
module.exports = styleguideAssetsTask
