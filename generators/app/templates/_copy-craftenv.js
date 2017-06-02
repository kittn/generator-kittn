/**
 * Copy Craft Env
 * @description Copy all Craft Env Files
 */

import kc from '../../config.json'
import gulp from 'gulp'

const copyCraftEnv = () => {
  gulp
    .src([kc.src.system + 'env/**/*', kc.src.system + 'env/**/.*'])
    .pipe(gulp.dest(kc.dist.dist))
}

gulp.task('copy:craftenv', copyCraftEnv)
module.exports = copyCraftEnv
