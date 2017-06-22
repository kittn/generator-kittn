/**
 * SymbolCleanup
 * @description Remove FillColor from SVG Symbols
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const buildSymbolCleanupTask = () => {
  return gulp
    .src([kc.dist.cssimg + kc.src.images.vectorSprite.symbolName, kc.dist.vectors + '**'], { base: './' })
    .pipe($.cheerio({
      run: function ($) {
        $('[fill^="#"]').removeAttr('fill')
        $('[fill^="none"]').removeAttr('fill')
        $('[fill-rule]').removeAttr('fill-rule')
      },
      parserOptions: { xmlMode: true }
    }))
    .pipe(gulp.dest('./'))
}

gulp.task('build:symbolCleanup', buildSymbolCleanupTask)
module.exports = buildSymbolCleanupTask
