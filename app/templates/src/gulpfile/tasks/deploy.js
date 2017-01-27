/**
 * Automatic Deploy
 *
 * @description: Deploy Task for an automated Build Process
 */

import gulp from 'gulp'
import runSequence from 'run-sequence'

const deployTask = (cb) => {

  // Overwrite the Changed Check
  global.changedOverride = true

  runSequence(
    [
      'version:bump',
    ],
    [
      'copy:launch',
      'copy:fonts',
      'rebuild:js',
      'rebuild:images',
      'copy:contentimages'<% if (projectUsage === 'Integrate in Wordpress' ) { %>,
      'copy:wpconfig',
      'copy:wpplugins'<% } %>
    ],
    [
      'compiler:css',
      'compiler:html'
    ],
    [
      'minify:js',
      'minify:contentimages',
      'minify:inlineimages',
      'minify:css'
    ],
    cb)
}

gulp.task('deploy', deployTask)
module.exports = deployTask

