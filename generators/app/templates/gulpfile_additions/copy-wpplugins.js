/**
 * Copy Wordpress Plugins
 * @description Copy all Wordpress Plugins
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const copyWPPlugins = () => {
  gulp
    .src(kc.src.plugins + '**/*')
    .pipe(global.checkChanged === true ? $.changed(kc.dist.dist + 'wp-content/plugins/') : gutil.noop())
    .pipe(gulp.dest(kc.dist.dist + 'wp-content/plugins/'))
}

gulp.task('copy:wpplugins', copyWPPlugins)
module.exports = copyWPPlugins
