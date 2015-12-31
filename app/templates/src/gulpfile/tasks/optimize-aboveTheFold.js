/**
 * AboveTheFold CSS
 * @description Generate Inline CSS for the Above the fold optimization
 */
import kc from '../config.json'
import gulp from 'gulp'
import critical from 'critical'

const aboveTheFoldTask = () => {
  kc.cssabove.sources.forEach(function(item) {
    return critical.generate({
      inline: kc.cssabove.inline,
      base: kc.dist.base,
      src: item,
      dest: kc.src.system + 'above/' + item,
      minify: kc.cssabove.minify,
      width: kc.cssabove.width,
      height: kc.cssabove.height
    })
  })
}

gulp.task('optimize:aboveTheFold', aboveTheFoldTask)
module.exports = aboveTheFoldTask
