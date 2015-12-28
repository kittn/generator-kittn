/**
 * CSS Compiler Task
 * watch the working dirs - activates the compilers and refresh the browser
 */
import kc from '../config.json'
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

  // Libsass Compiler
  if(kc.css.compiler === 'libsass') {
    return gulp
      .src(kc.src.style + '**/*.scss')
      .pipe(env == 'development' ? $.sourcemaps.init() : gutil.noop())
      .pipe($.sass({})
        .on('error', errorHandler))
      .pipe($.postcss(preCssConf()))
      .pipe(kc.css.sourcemap ? $.sourcemaps.write('.') : gutil.noop())
      .pipe(gulp.dest(kc.dist.css))

    // Rubysass Compiler
  } else if(kc.css.compiler === 'rubysass') {

    // Use the Environment Var and transform to BOOL
    if (env === 'development') {
      const rubySourceMap = true
    } else {
      const rubySourceMap = false
    }

    return $.rubySass(kc.src.style + '**/*.scss', { sourcemap: rubySourceMap })
      .on('error', errorHandler)
      .pipe($.postcss(preCssConf))
      .pipe(rubySourceMap ? $.sourcemaps.write('.') : gutil.noop())
      .pipe(gulp.dest(kc.dist.css))
  }
};

gulp.task('compiler:css', compilerCssTask)
module.exports = compilerCssTask
