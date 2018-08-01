/**
 * Tthe Watch Tasks for SASS,
 * JADE, JS and activate BrowserSync
 */

import kc from '../../config.json'
import gulp from 'gulp'
import watch from 'gulp-watch'<% if (projectusage !== 'joomla') { %>
import templateFiles from '../lib/templateFiles'<% } %>
import path from 'path'

const watchTask = () => {
  // Watch the SCSS Folder for changes - compile CSS
  gulp.watch([kc.src.style + '**/**/*.scss', kc.src.style + '**/**/*.sass'], {interval: 500}, ['compiler:css'])

  // Watch the Structure<% if (projectusage !== 'joomla') { %>
  gulp.watch([templateFiles()], {interval: 500}, ['compiler:html'])<% } else { %>
  gulp.watch(kc.watchjoomla, {interval: 500}, ['copy:joomlafiles'])<% } %>
}

gulp.task('watch', watchTask)
module.exports = watchTask
