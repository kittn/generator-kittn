/**
 * Build Conditionizr
 * @description Task for Combine and Generate Conditionizr Test File
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const buildConditionizrTask = () => {
  return gulp
    .src(kc.conditionizr.files)
    .pipe($.concat(kc.conditionizr.filename))
    .pipe(gulp.dest(kc.dist.js))
}

gulp.task('build:conditionizr', buildConditionizrTask)
module.exports = buildConditionizrTask
