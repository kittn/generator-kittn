/**
 * Copy Asset Files
 * @description Copy all Assets into the Pattern Lib Directory
 */

import kc from '../../config.json'
import gulp from 'gulp'

const copyAssets = () => {
  gulp
    .src(kc.dist.assets + '**/*')
    .pipe(gulp.dest('doc/pattern-library/assets/'))
}

gulp.task('copy:assets', copyAssets)
module.exports = copyAssets
