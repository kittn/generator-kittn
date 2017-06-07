/**
 * Critical CSS
 * @description Generate Inline CSS for the Above the fold optimization
 */

import kc from '../../config.json'
import gulp from 'gulp'
import critical from 'critical'
import yargs from 'yargs'

const args = yargs.argv

const criticalCss = () => {

  // Default Build Variable
  var generateCritical = args.critical || false;

  if(generateCritical) {
    kc.cssabove.sources.forEach(function(item) {
      return critical.generate({
        inline: kc.cssabove.inline,
        base: kc.dist.markup,
        src: item,
        dest: <% if (projectcriticalinline == 'Inline') { %>item<% } else { %>kc.templatePath.css + kc.cssabove.destFilename<% } %>,
        minify: kc.cssabove.minify,
        width: kc.cssabove.width,
        height: kc.cssabove.height
      })
    })
  }
}

gulp.task('optimize:criticalCss', criticalCss)
module.exports = criticalCss
