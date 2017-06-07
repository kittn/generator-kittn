/**
 * Combined Image Copy Function
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import gulpLoadPlugins from 'gulp-load-plugins'
import pngquant from 'imagemin-pngquant'
import svgo from 'imagemin-svgo'
import jpegCompress from 'imagemin-jpeg-recompress'

const $ = gulpLoadPlugins()

const copyImages = (srcfiles, distfiles) => {
  return gulp
    .src(srcfiles + '**/*.{png,jpeg,jpg,gif,webp,svg}')
    .pipe(global.checkChanged === true ? $.changed(kc.dist.bitmaps) : gutil.noop())
    .pipe(gulp.dest(distfiles))
}

module.exports = copyImages

