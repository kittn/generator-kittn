/**
 * Build SVG Sprite File
 * @description Build an SVG Vector Sprite and a Map file
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import svgo from 'imagemin-svgo'

const $ = gulpLoadPlugins()

const buildVectorSpriteTask = () => {
  return gulp
    .src(kc.src.images.vectorSprite.files + '**/*.svg')
    .pipe($.imagemin({
      svgoPlugins: kc.minify.images.svgoPlugins
    }))
    .pipe($.svgSprite(
      {
        shape: {
          dimension : {  // Set maximum dimensions
            maxWidth : kc.src.images.vectorSprite.maxWidth,
            maxHeight : kc.src.images.vectorSprite.maxHeight
          },
          spacing : { // Add padding
            padding : kc.src.images.vectorSprite.padding
          },
          dest : kc.dist.vectors
        },
        mode: {
          view: {  // Activate the «view» mode
            sprite: kc.dist.cssimg + kc.src.images.vectorSprite.name,
            dest: '.',
            bust : false,
            prefix: '%%svg',
            render : {
              scss : {
                template: kc.src.system + 'tpl_svgsprite.scss',
                dest: kc.src.style +'maps/_sprite-svg.scss'
              }
            }
          },
          symbol : {
            sprite: kc.src.images.vectorSprite.symbolName,
            dest: kc.dist.cssimg
          }
        }
      }
    ))
    .pipe(gulp.dest('./'))
}

gulp.task('build:vectorSprite', buildVectorSpriteTask)
module.exports = buildVectorSpriteTask
