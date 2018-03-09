/**
 * Combined Image Minify Function
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import pngquant from 'imagemin-pngquant'
import svgo from 'imagemin-svgo'
import jpegCompress from 'imagemin-jpeg-recompress'

const $ = gulpLoadPlugins()

const minifyImages = (srcfiles, distfiles) => {
  gulp.src(['!' + srcfiles + 'system/**', srcfiles + '/**', '!' + srcfiles + kc.src.images.vectorSprite.symbolName])
    .pipe($.imagemin([
      $.imagemin.gifsicle({interlaced: kc.minify.images.interlaced}),
      $.imagemin.jpegtran({progressive: kc.minify.images.progressive}),
      $.imagemin.optipng({optimizationLevel: kc.minify.images.optimizationLevel}),
      $.imagemin.svgo({
        plugins: kc.minify.images.svgoPlugins
      })
    ]))
    .pipe(gulp.dest(distfiles))
}

module.exports = minifyImages
