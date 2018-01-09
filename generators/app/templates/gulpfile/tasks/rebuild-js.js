/**
 * Rebuild all JS Files
 * Copy to distribution
 */

import { series, task } from 'gulp'

const rebuildJsTask = () => {
  return series(
    // 'build:modernizr',
    'copy:js'
  )
}

task('rebuild:js', rebuildJsTask())
module.exports = rebuildJsTask
