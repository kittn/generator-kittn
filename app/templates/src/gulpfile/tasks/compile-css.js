/**
 * CSS Compiler Task
 * watch the working dirs - activates the compilers and refresh the browser
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import browserSync from 'browser-sync'
import gulpLoadPlugins from 'gulp-load-plugins'
import errorHandler from '../lib/errorHandler'
import preCssConf from '../lib/prePostCssConf'
import postCssNano from '../lib/postCssNano'
import yargs from 'yargs'

const args = yargs.argv
const $ = gulpLoadPlugins()

// Gulp Task with two Ways one Libsass (default) one Rubysass
const compilerCssTask = () => {
  const env = args.env || 'development'

  return gulp
    .src([kc.src.style + '**/*.scss', kc.src.style + '**/*.sass'])
    .pipe(env == 'development' ? $.sourcemaps.init() : gutil.noop())
    .pipe($.sass({})
      .on('error', errorHandler))
    .pipe($.postcss(preCssConf()))
    .pipe($.size({
        title: '>>> CSS File Size: '
    }))
    .pipe(env == 'development' ? $.sourcemaps.write('.') : gutil.noop())
    .pipe(gulp.dest(kc.dist.css))
};

gulp.task('compiler:css', compilerCssTask)
module.exports = compilerCssTask
