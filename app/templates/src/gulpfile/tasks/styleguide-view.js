/**
 * Styleguide View
 * @description Use the BrowserSync Server for Display the Styleguide
 */

import gulp from 'gulp'
import browserSync from 'browser-sync'

const styleguideViewTask = () => {
  // Browser Sync
  browserSync.init([],
    { options: {
      debugInfo: true,
      watchTask: false,
      ghostMode: false
    },
      server: 'doc/styleguide/',
      open: true
    })
}

gulp.task('styleguide:view', styleguideViewTask)
module.exports = styleguideViewTask
