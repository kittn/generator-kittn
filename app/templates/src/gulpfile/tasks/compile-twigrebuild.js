/**
 * Template Compiler
 *
 * @description Compiles Twig without Changed Check, used for Affected Files like layout.twig
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

const compilerTwigRebuildTask = () => {
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
  return gulp.src(kc.src.template + '*.twig')
    .pipe($.plumber())
    .pipe($.twig({ data: templateLocals }))
    .on('error', errorHandler)
    .pipe($.prettify({
      'indent_size': 2
    }))
    .pipe(gulp.dest(kc.dist.markup))
}

gulp.task('compiler:twigRebuild', compilerTwigRebuildTask)
module.exports = compilerTwigRebuildTask
