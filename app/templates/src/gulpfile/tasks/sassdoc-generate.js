/**
 * Build the CSS Framework Documentation
 */

import gulp from 'gulp'
import sassdoc from 'sassdoc'

const sassdocGenerateTask = () => {
  return gulp
    .src('src/framework/**/*.scss')
    .pipe(sassdoc(
      {
        dest: 'doc/sassdoc'
      }
    ))
}

gulp.task('sassdoc:generate', sassdocGenerateTask)
module.exports = sassdocGenerateTask
