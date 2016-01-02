/**
 * Template Compiler
 *
 * @description Compiles with Jade or Twig (the decision too has been taken in the packet generating), also copy only the Files.
 */

import kc from '../config.json'
import pkg from '../../package.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import gulpLoadPlugins from 'gulp-load-plugins'
import errorHandler from '../lib/errorHandler'
import yargs from 'yargs'

const args = yargs.argv
const $ = gulpLoadPlugins()

const compilerHtmlTask = () => {
  const siteEnv = args.env || 'development'

  // Set Base Locals
  const templateLocals = {
    siteTitle: kc.template.globalTitle,
    cssName: pkg.cssFileName,
    assetsCss: kc.templatePath.css,
    assetsImg: kc.templatePath.contentimage,
    assetsJs: kc.templatePath.js,
    assetsCssImg: kc.templatePath.cssimage,
    environment: siteEnv
  };

  // Twig Compiler
  if(kc.template.compiler) {
    // TWIG // Jade
    return <% if ( projectstructure == 'Twig Template' ) { %>gulp.src(kc.src.template + '*.twig')<% } else if ( projectstructure == 'Jade Template' ) { %>gulp.src([kc.src.template + '*.jade',kc.src.template + '_*.jade'])<% } %><% if ( projectstructure == 'Twig Template' ) { %>
      .pipe(global.changedOverride === false ? $.changed(kc.dist.markup, {extension: '.html'}) : gutil.noop())<% } %>
      .pipe($.plumber())<% if ( projectstructure == 'Twig Template' ) { %>
      .pipe($.twig({ data: templateLocals }))<% } else if ( projectstructure == 'Jade Template' ) { %>
      .pipe($.jadeFindAffected())
      .pipe($.jade({
        pretty: true,
        locals: templateLocals
      }))<% } %>
      .on('error', errorHandler)
      .pipe($.prettify({
        'indent_size': 2
      }))
      .pipe(gulp.dest(kc.dist.markup))

    // Simple Copy Files
  } else {
    gulp.src(kc.src.structure + '**/**')
      .pipe(global.changedOverride === false ? $.changed(kc.dist.markup) : gutil.noop())
      .pipe(gulp.dest(kc.dist.markup))
  }
}

gulp.task('compiler:html', compilerHtmlTask)
module.exports = compilerHtmlTask
