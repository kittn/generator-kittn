/**
 * Copy Launch Files
 * @description Copy the Default Build Files to distribution
 */

import kc from '../../config.json'
import gulp from 'gulp'

const copyLaunchTask = () => {
  kc.files.launch.forEach(function(item) {
    gulp
      .src(kc.src.system + item.src)
      .pipe(gulp.dest(kc.dist.base + item.dest))
  })
}

gulp.task('copy:launch', copyLaunchTask)
module.exports = copyLaunchTask
