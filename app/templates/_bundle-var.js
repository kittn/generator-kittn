import kc from '../../config.json'
import browserify from 'browserify'
import babelify from 'babelify'
import yargs from 'yargs'<% if (projectvue == true ) { %>
import vueify from 'vueify'<% } %>

const args = yargs.argv

// Get the Environment Var or set it to 'development'
const env = args.env || 'development'

const bundleVar = () => {
  if (env === 'development') {
    return browserify(kc.src.js + kc.files.jsApp.srcName, { debug: true }).transform(babelify.configure({presets: ["es2015"]}))<% if (projectvue == true ) { %>.transform(vueify)<% } %>
  } else {
    return browserify(kc.src.js + kc.files.jsApp.srcName).transform(babelify.configure({presets: ["es2015"]}))<% if (projectvue == true ) { %>.transform(vueify)<% } %>
  }

  return bundler
}

module.exports = bundleVar
