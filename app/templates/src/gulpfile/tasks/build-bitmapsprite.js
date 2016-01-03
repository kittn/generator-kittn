/**
 * Build Bitmap Sprite
 * @description Build the Bitmap Sprite File and the SCSS Map
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const buildBitmapSpriteTaks = () => {
  gulp
    .src(kc.src.images.bitmapSprite.files + '**/*.png')
    .pipe($.if('*.png',
      $.spritesmith({
        imgName: kc.src.images.bitmapSprite.name,
        cssName: '_sprite-bitmap.scss',
        imgPath: kc.dist.cssimgRoot + kc.src.images.bitmapSprite.name,
        cssTemplate: kc.src.system + 'tpl_bitmapsprite.scss'
      })
    ))
    .pipe($.if('*.png',gulp.dest(kc.dist.cssimg),gulp.dest(kc.src.style + 'maps/')))
}

gulp.task('build:bitmapSprite', buildBitmapSpriteTaks)
module.exports = buildBitmapSpriteTaks
