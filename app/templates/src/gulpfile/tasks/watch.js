/**
 * Tthe Watch Tasks for SASS,
 * JADE, JS and activate BrowserSync
 */

import kc from '../../config.json'
import gulp from 'gulp'
import watch from 'gulp-watch'
import templateFiles from '../lib/templateFiles'
import path from 'path'

const watchTask = () => {

  // Watch the SCSS Folder for changes - compile CSS
  gulp.watch([kc.src.style + '**/*.scss'], ['compiler:css'])

  // Watch the Structure
  gulp.watch([templateFiles()], ['compiler:html'])

  <% if ( projectstructure == 'Twig Template' ) { %>// When a Template File is modified all Child rerendered
  if(kc.template.compiler) {
    gulp.watch([kc.src.template + 'templates/*.twig'], ['compiler:twigRebuild'])
  }<% }%>
}

gulp.task('watch', ['browser-sync'], watchTask)
module.exports = watchTask
