/**
 * Styleguide
 * @description Build the Styleguide
 * --guide=no will disable the Building on the Publish Task
 */

import kc from '../../config.json'
import gulp from 'gulp'
import yargs from 'yargs'
import runSequence from 'run-sequence'

const args = yargs.argv

const styleguideGenerateTask = (callback) => {
  // Default Build Variable
  var guide = args.guide || 'yes';

  if (guide == 'yes') {
    runSequence(
      [
        'compiler:css'
      ],
      [
        'styleguide:readout',
        'styleguide:assets'
      ],
      callback)
  }
}

gulp.task('styleguide:generate', styleguideGenerateTask)
module.exports = styleguideGenerateTask
