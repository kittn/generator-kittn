/**
 * Starting Task for the first Build off the Project Structure
 */

import gulp from 'gulp'
import runSequence from 'run-sequence'

const initTask = (cb) => {

  // Overwrite the Changed Check
  global.checkChanged = false

  runSequence(<% if (projectsassdocs === true) { %>
    [
      'sassdoc:generate'
    ],<% } %>
    [
      'copy:launch',
      'copy:fonts',
      'rebuild:js',
      'rebuild:images',
      'copy:contentimages'<% if (projectusage == 'wordpress' || projectusage == 'wordpressCB') { %>,
      'copy:wpconfig',
      'copy:wpplugins'<% } else if (projectusage == 'craft' || projectusage == 'craftCB') { %>,
      'copy:craftindex',
      'copy:craftplugins',
      'copy:craftenv'<% } else if (projectusage == 'joomla' || projectusage == 'joomlaCB') { %>,
      'copy:joomlafiles'<% } %>
    ],
    [
      'compiler:css'<% if (projectusage !== 'joomla' && projectusage == 'joomlaCB') { %>,
      'compiler:html'<% } %>
    ],
    cb)
}

gulp.task('init', initTask)
module.exports = initTask
