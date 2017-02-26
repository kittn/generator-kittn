/**
 * Copy Craft Env
 * @description Copy Craft Public Folder
 */

import kc from '../../config.json'
import gulp from 'gulp'

const copyCraftIndex = () => {
  gulp
    .src([kc.src.system + 'public/**/*', kc.src.system + 'public/**/.*'])
    .pipe(gulp.dest(kc.dist.base))
}

gulp.task('copy:craftindex', copyCraftIndex)
module.exports = copyCraftIndex
