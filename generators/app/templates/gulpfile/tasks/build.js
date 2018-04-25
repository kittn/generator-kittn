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
      'rebuild:images',
      'copy:contentimages'<% if (projectusage == 'wordpress' || projectusage == 'wordpressCB' ) { %>,
      'copy:wpconfig',
      'copy:wpplugins'<% } else if (projectusage == 'joomla' || projectusage == 'joomlaCB') { %>,
      'copy:joomlafiles'<% } %>
    ],
    [
      'compiler:css'<% if (projectusage !== 'joomla' && projectusage == 'joomlaCB') { %>,
      'compiler:html'<% } %>
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
