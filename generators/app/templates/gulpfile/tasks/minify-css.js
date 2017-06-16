/**
 * Minify CSS Files
 * @description Compress CSS Files in distribution
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const minifyCssTask = () => {
  return gulp
    .src(kc.dist.css + '*.css')
    .pipe($.postcss())
    .pipe($.size({
      title: '>>> CSS File Size: '
    }))
    .pipe(gulp.dest(kc.dist.css))
}

gulp.task('minify:css', minifyCssTask)
module.exports = minifyCssTask
