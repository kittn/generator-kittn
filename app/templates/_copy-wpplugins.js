/**
 * Copy Wordpress Plugins
 * @description Copy all Wordpress Plugins
 */

import kc from '../../config.json'
import gulp from 'gulp'

const copyWPPlugins = () => {
  gulp
    .src(kc.src.plugins + '**/*')
    .pipe(gulp.dest(kc.dist.dist + 'wp-content/plugins/'))
}

gulp.task('copy:wpplugins', copyWPPlugins)
module.exports = copyWPPlugins
