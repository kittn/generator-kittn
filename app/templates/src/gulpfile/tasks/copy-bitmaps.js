/**
 * Copy Bitmaps
 * @description Move all Bitmap Images (from bitmapSingle-assets) to the .dist Folder
 */
import kc from '../../config.json'
import gulp from 'gulp'
import copyImages from '../lib/copyImages'

const copyBitmapsTask = () => {
  // Call the Function
  copyImages(kc.src.images.bitmaps,kc.dist.bitmaps)
}

gulp.task('copy:bitmaps', copyBitmapsTask)
module.exports = copyBitmapsTask
