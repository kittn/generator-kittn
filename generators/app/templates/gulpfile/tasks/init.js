/**
 * Starting Task for the first Build off the Project Structure
 */

import gulp from 'gulp'
import FwdRef from 'undertaker-forward-reference'

gulp.registry(FwdRef())

const initTask = (cb) => {

  // Overwrite the Changed Check
  global.checkChanged = false

  return gulp.series(<% if (projectsassdocs === true) { %>
    'sassdoc:generate',<% } %>
    gulp.parallel(
      'copy:launch',
      'copy:fonts',
      'rebuild:js',
      'rebuild:images',
      'copy:contentimages'<% if (projectusage == 'wordpress' || projectusage == 'wordpressCB') { %>,
      'copy:wpconfig',
      'copy:wpplugins'<% } else if (projectusage == 'craft' || projectusage == 'craftCB') { %>,
      'copy:craftindex',
      'copy:craftplugins',
      'copy:craftenv'<% } %>
    ),
    gulp.parallel(
      'compiler:css',
      'compiler:html'
    )
  )
}

gulp.task('init', initTask())
module.exports = initTask
