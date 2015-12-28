/**
 * Add a Header to CSS and JS files
 */

import kc from '../config.json'
import gulp from 'gulp'
import strip from 'gulp-strip-banner'
import globalMinify from '../lib/global-minify'
import banner from '../lib/banner'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const headerAddTask = () => {
  var files = {
    js: kc.dist.js,
    css: kc.dist.css
  }

  for (const file in files) {
    return gulp
      .src(files[file] + '*.' + file)
      .pipe(strip())
      .pipe($.header(banner, { pkg : pkg } ))
      .pipe(gulp.dest(files[file]))
  }
}

gulp.task('header:add', headerAddTask)
module.exports = headerAddTask
