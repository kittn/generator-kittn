/**
 * Template Compiler
 *
 * @description Compile Twig Files to HTML or copy Structure Files (usefull for PHP or Source Files for a CMS Compiler.
 */

import kc from '../../config.json'
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
    // TWIG Compiler
    return gulp.src(kc.src.template + '**/[^_]*.{html,twig,rss}')
      .pipe(global.checkChanged === true ? $.changed(kc.dist.markup, {extension: '.{html,twig,rss}'}) : gutil.noop())
      .pipe($.plumber())
      .pipe($.twig({ data: templateLocals }))
      .on('error', errorHandler)
      .pipe($.htmlPrettify({
        indent_char: ' ',
        indent_size: 2
      }))
      .pipe(gulp.dest(kc.dist.markup))

  } else {
    // Simple Copy Files
    gulp.src([kc.src.structure + '**/**', kc.src.structure + '**/.*'])
      .pipe(global.checkChanged === true ? $.changed(kc.dist.markup) : gutil.noop())
      .pipe(gulp.dest(kc.dist.markup))
  }
}

gulp.task('compiler:html', compilerHtmlTask)
module.exports = compilerHtmlTask
