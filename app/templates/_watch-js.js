/**
 * Watch JS Files with Watchify and recompile it with Browserify and Babelify
 */

import kc from '../../config.json'
import gulp from 'gulp'
import bundleJs from '../lib/bundle-js'
import browserify from 'browserify'
import watchify from 'watchify'
import babelify from 'babelify'
import merge from 'utils-merge'<% if (projectvue == true ) { %>
import vueify from 'vueify'
import hmr from 'browserify-hmr'<% } %>

const watchJsTask = () => {
  var args = merge(watchify.args, { debug: true })
  var bundler = watchify(browserify(kc.src.js + kc.files.jsApp.srcName, args))<% if (projectvue == true ) { %>.plugin(hmr)<% } %>.transform(babelify.configure({presets: ["es2015"]}))<% if (projectvue == true ) { %>.transform(vueify)<% } %>

  bundleJs(bundler)

  bundler.on('update', function () {
    bundleJs(bundler)
    console.log('Bundeled JS Files')
  })
}

gulp.task('watch:js', watchJsTask)
module.exports = watchJsTask
