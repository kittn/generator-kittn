/**
 * Copy Wordpress Config
 * @description Copy all Wordpress Config Files for init
 */

import kc from '../../config.json'
import gulp from 'gulp'

const copyWPConfig = () => {
  gulp
    .src(kc.src.config + '**/*')
    .pipe(gulp.dest(kc.dist.dist))
}

gulp.task('copy:wpconfig', copyWPConfig)
module.exports = copyWPConfig
