/**
 * Build Bitmap Sprite
 * @description Build the Bitmap Sprite File and the SCSS Map
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import yaml from 'js-yaml'

const $ = gulpLoadPlugins()

const buildBitmapSpriteTaks = () => {
  gulp
    .src(kc.src.images.bitmapSprite.files + '**/*.png')
    .pipe($.if('*.png',
      $.spritesmith({
        imgName: kc.src.images.bitmapSprite.name,
        cssName: 'sprites.yml',
        imgPath: kc.dist.cssimgRoot + kc.src.images.bitmapSprite.name,
        cssTemplate: function (data) {
          var spriteObj = {}

          data.sprites.forEach(function (sprite) {
            var name = sprite.name
            spriteObj[name] = sprite
            delete sprite.name
          })

          return yaml.safeDump(spriteObj);
        }
      })
    ))
    .pipe($.if('*.png',gulp.dest(kc.dist.cssimg),gulp.dest(kc.src.style + '_config/')))
}

gulp.task('build:bitmapSprite', buildBitmapSpriteTaks)
module.exports = buildBitmapSpriteTaks
