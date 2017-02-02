/**
 * Copy Craft Env
 * @description Copy all Craft Env Files
 */

import kc from '../../config.json'
import gulp from 'gulp'

const copyCraftIndex = () => {
  gulp
    .src(kc.src.system + 'index.php')
    .pipe(gulp.dest(kc.dist.base))
}

gulp.task('copy:craftindex', copyCraftIndex)
module.exports = copyCraftIndex
