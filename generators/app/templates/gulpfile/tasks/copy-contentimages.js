/**
 * Contentimages
 * @description Copy and Compress all Images
 * Inline Images (SVG, PNG, JPG, GIF)
 */

import kc from '../../config.json'
import gulp from 'gulp'
import copyImages from '../lib/copyImages'

const copyContentimagesTask = (cb) => {
  // Call the Function
  copyImages(kc.src.contentimage, kc.dist.contentimage)
  cb()
}

gulp.task('copy:contentimages', copyContentimagesTask)
module.exports = copyContentimagesTask
