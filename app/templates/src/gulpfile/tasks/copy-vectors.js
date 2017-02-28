/**
 * Copy SVG Images
 * @description Move all SVG Images (from vectorSingle-assets) to the .dist Folder
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import gulpLoadPlugins from 'gulp-load-plugins'
import svgo from 'imagemin-svgo'

const $ = gulpLoadPlugins()

const copyVectorsTask = () => {
  gulp
    .src(kc.src.images.vectors + '**/*.svg')
    .pipe(global.checkChanged === true ? $.changed(kc.dist.vectors) : gutil.noop())
    .pipe($.imagemin({
      svgoPlugins: kc.minify.images.svgoPlugins
    }))
    .pipe(gulp.dest(kc.dist.vectors))
}

gulp.task('copy:vectors', copyVectorsTask)
module.exports = copyVectorsTask
