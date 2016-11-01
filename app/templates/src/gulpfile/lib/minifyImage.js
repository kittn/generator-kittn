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
    .pipe(
      $.imagemin({
        optimizationLevel: kc.minify.images.optimizationLevel,
        use: [
          pngquant(kc.minify.images.pngquant),
          jpegCompress({
            loops: 3,
            min: 75,
            max: 95
          })
        ],
        svgoPlugins: kc.minify.images.svgoPlugins,
        progressive: kc.minify.images.progressive,
        interlaced: kc.minify.images.interlaced
      })
    )
    .pipe(gulp.dest(distfiles))
}

module.exports = minifyImages
