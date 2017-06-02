import kc from '../../config.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import gulpLoadPlugins from 'gulp-load-plugins'
import errorHandler from '../lib/errorHandler'
import source from 'vinyl-source-stream'
import buffer from 'vinyl-buffer'
import yargs from 'yargs'

const args = yargs.argv
const $ = gulpLoadPlugins()

// Get the Environment Var or set it to 'development'
const env = args.env || 'development'

// Bundle Javascript Files
const bundleJs = (bundler) => {
  return bundler.bundle()
    .on('error', errorHandler)
    .pipe(source(kc.files.jsApp.srcName))
    .pipe(buffer())
    .pipe(env == 'development' ?  $.sourcemaps.init({ loadMaps: true }) : gutil.noop())
    .pipe(env == 'production' ? $.uglify(kc.minify.javascript.options) : gutil.noop())
    .pipe(env == 'development' ?  $.sourcemaps.write('.') : gutil.noop())
    .pipe(gulp.dest(kc.dist.js))
}

module.exports = bundleJs
