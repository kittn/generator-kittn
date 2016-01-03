/**
 * Bump
 * @description Bump the version property within `bower.json` and `package.json`.
 * --type=pre will bump the prerelease version *.*.*-x
 * --type=patch or no flag will bump the patch version *.*.x
 * --type=minor will bump the minor version *.x.*
 * --type=major will bump the major version x.*.*
 * --version=1.2.3 will bump to a specific version and ignore other flags
 */

import kc from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import yargs from 'yargs'

const args = yargs.argv
const $ = gulpLoadPlugins()

const versionBump = () => {
  const type = args.type || 'patch';
  const version = args.version;
  const options = {};

  if (version) {
    options.version = version;

  } else {
    options.type = type;
  }

  return gulp.src(['./bower.json', './package.json'])
    .pipe($.bump(options))
    .pipe(gulp.dest('./'))
}

gulp.task('version:bump', versionBump)
module.exports = versionBump
