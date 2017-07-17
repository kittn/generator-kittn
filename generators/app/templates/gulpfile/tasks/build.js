/**
 * Automatic Deploy
 *
 * @description: Deploy Task for an automated Build Process
 */

import gulp from 'gulp'
import runSequence from 'run-sequence'

const buildTask = (cb) => {

  // Overwrite the Changed Check
  global.checkChanged = true

  runSequence(
    [
      'version:bump',
    ],
    [
      'copy:launch',
      'copy:fonts',
      'rebuild:js',
      'rebuild:images',<% if (projectusage == 'craft' || projectusage == 'craftCB' ) { %>
      'copy:craftplugins',<% } %>
      'copy:contentimages'<% if (projectusage == 'wordpress' || projectusage == 'wordpressCB' ) { %>,
      'copy:wpconfig',
      'copy:wpplugins'<% } %>
    ],
    [
      'compiler:css',
      'compiler:html'
    ]<% if (projectcritical !== 'undefined' && projectcritical === true) { %>,
    [
      'optimize:criticalCss'
    ]<% } %>,
    [
      'minify:js',
      'minify:contentimages',
      'minify:inlineimages',
      'minify:css'
    ],
    cb)
}

gulp.task('build', buildTask)
module.exports = buildTask
