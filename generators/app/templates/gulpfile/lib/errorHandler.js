/**
 * Error Handler for Gulp
 */

import notify from 'gulp-notify'
import yargs from 'yargs'
const args = yargs.argv

module.exports = function (errorObject, callback) {
  const env = args.env || 'development'

  notify
    .onError(function (options) {
      const message = options.message || options
      return message
        .toString()
        .split(': ')
        .join(':\n')
    })
    .apply(this, arguments)

  // Keep gulp from hanging on this task
  if (typeof this.emit === 'function' || env === 'development') this.emit('end')

  // Crash Build Process on error in production-mode
  if (env !== 'development') process.exit(1)
}
