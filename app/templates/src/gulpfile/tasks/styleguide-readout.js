/**
 * Styleguide Generate
 * @description Read out CSS File to Generate the Styleguide
 */

import kc from '../config.json'
import pkg from '../../package.json'
import gulp from 'gulp'
import styleguide from 'sc5-styleguide'

const styleguideReadoutTask = () => {
  return gulp.src(kc.dist.css + kc.css.filename + '.css')
    .pipe(styleguide.generate({
      title: 'Styleguide for: '+pkg.name+' (v.'+pkg.version+')',
      server: false,
      rootPath: 'doc/styleguide/',
      commonClass: 'sg-body',
      appRoot: kc.styleguide.appRoot,
      overviewPath: kc.styleguide.overviewPath,
      disableHtml5Mode: kc.styleguide.disableHtml5Mode,
      disableEncapsulation: kc.styleguide.disableEncapsulation,
      extraHead: kc.styleguide.extraHead
    }))
    .pipe(styleguide.applyStyles())
    .pipe(gulp.dest('doc/styleguide/'))
}

gulp.task('styleguide:readout', styleguideReadoutTask)
module.exports = styleguideReadoutTask
