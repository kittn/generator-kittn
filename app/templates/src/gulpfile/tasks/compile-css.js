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
import yargs from 'yargs'<% if ( projectstylelint ) { %>
import ansiHTML from 'ansi-html'
import api from 'stylelint'<% } %>

const args = yargs.argv
const $ = gulpLoadPlugins()

// Gulp Task with two Ways one Libsass (default) one Rubysass
const compilerCssTask = () => {
  const env = args.env || 'development'

  return gulp
    .src([kc.src.style + '**/*.scss', kc.src.style + '**/*.sass'])
    .pipe(env === 'development' ? $.sourcemaps.init() : gutil.noop())<% if ( projectstylelint ) { %>
    .pipe(env === 'development' ? $.stylelint({
        syntax: 'scss',
        failAfterError: false,
        reporters: [
            {formatter: 'string', console: true},
            {
                formatter(results) {
                    if (!api.formatters.string(results).length) return
                    const warning = `
                    <div class="bs-fullscreen"
                      style="position: fixed;
                      bottom: 0;
                      left: 0;
                      width: 100%;
                      background: rgba(0,0,0,.85);
                      height: 50vh;
                      max-height: 200px;
                      overflow-y: scroll;
                      color: #e8e8e8;
                      text-align: left;
                      white-space: pre;
                      font-family: Menlo, Consolas, monospace;
                      font-size: 13px;
                      padding: 10px;
                      line-height: 1.2;">
                      ${ansiHTML(api.formatters.string(results))}
                    </div>`
                    browserSync.notify(warning, 100000)
                }
            }
        ]
    }) : gutil.noop())<% } %>
    .pipe($.sass({})
      .on('error', errorHandler))
    .pipe($.postcss(preCssConf()))
    .pipe(env === 'development' ? $.size({
        title: '>>> CSS File Size: '
    }) : gutil.noop())
    .pipe(env == 'development' ? $.sourcemaps.write('.') : gutil.noop())
    .pipe(gulp.dest(kc.dist.css))
};

gulp.task('compiler:css', compilerCssTask)
module.exports = compilerCssTask
