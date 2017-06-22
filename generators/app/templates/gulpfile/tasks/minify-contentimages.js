/**
 * Minify Content Images
 * @description Compress all Images in distribution
 * Inline Images (SVG, PNG, JPG, GIF)
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import minifyImages from '../lib/minifyImage'

const $ = gulpLoadPlugins()

const minifyContentimagesTask = () => {
  minifyImages(kc.dist.contentimage,kc.dist.contentimage)
}

gulp.task('minify:contentimages', minifyContentimagesTask)
module.exports = minifyContentimagesTask
