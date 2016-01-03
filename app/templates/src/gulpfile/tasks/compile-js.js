/**
 * Compile JS with Babelify and Watchify
 */

import gulp from 'gulp'
import bundleJs from '../lib/bundle-js'
import bundleVar from '../lib/bundle-var'

// Compile only
const compileJsTask = () => {
  const bundler = bundleVar()
  return bundleJs(bundler)

  bundleJs(bundler)
}

gulp.task('compiler:js', compileJsTask)
module.exports = compileJsTask
