import kc from '../../config.json'
import browserify from 'browserify'
import babelify from 'babelify'
import yargs from 'yargs'

const args = yargs.argv

// Get the Environment Var or set it to 'development'
const env = args.env || 'development'

const bundleVar = () => {
  if (env === 'development') {
    return browserify(kc.src.js + kc.files.jsApp.srcName, { debug: true }).transform(babelify.configure({presets: ["es2015"]}))
  } else {
    return browserify(kc.src.js + kc.files.jsApp.srcName).transform(babelify.configure({presets: ["es2015"]}))
  }

  return bundler
}

module.exports = bundleVar
