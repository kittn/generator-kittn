/**
 * Automatic Deploy
 *
 * @description: Deploy Task for an automated Build Process
 */

import gulp from 'gulp'
import FwdRef from 'undertaker-forward-reference'

gulp.registry(FwdRef())

const buildTask = () => {

  // Overwrite the Changed Check
  global.checkChanged = true

  return gulp.series(
    'version:bump',
    gulp.parallel(
      'copy:launch',
      'copy:fonts',
      'rebuild:js',
      'rebuild:images',<% if (projectusage == 'craft' || projectusage == 'craftCB' ) { %>
      'copy:craftplugins',<% } %>
      'copy:contentimages'<% if (projectusage == 'wordpress' || projectusage == 'wordpressCB' ) { %>,
      'copy:wpconfig',
      'copy:wpplugins'<% } %>
    ),
    gulp.parallel(
      'compiler:css',
      'compiler:html'
    )<% if (projectcritical !== 'undefined' && projectcritical === true) { %>,
    gulp.parallel(
      'optimize:criticalCss'
    )<% } %>,
    gulp.parallel(
      'minify:js',
      'minify:contentimages',
      'minify:inlineimages',
      'minify:css'
    )
  )
}

gulp.task('build', buildTask())

module.exports = buildTask
