/**
 * Minify CSS Files
 * @description Compress CSS Files in distribution
 */

import kc from '../../config.json'<% if (typeof projecttailwind !== 'undefined' && projecttailwind === 'hybrid') { %>
import purgeConfig from '../../purgecss.pattern'<% } %>
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()<% if (typeof projecttailwind !== 'undefined' && projecttailwind === 'hybrid') { %>

class TailwindExtractor {
  static extract(content) {
    return content.match(/[A-z0-9-:\/]+/g);
  }
}<% } %>

const minifyCssTask = () => {
  return gulp
    .src(kc.dist.css + '*.css')<% if (typeof projecttailwind !== 'undefined' && projecttailwind === 'hybrid') { %>
    .pipe($.purgecss({
      extractors: [{
        extractor: TailwindExtractor,
        extensions: ['html', 'twig', 'css', 'js', 'vue', 'php']
      }],
      whitelist: purgeConfig.whitelist,
      whitelistPatterns: purgeConfig.whitelistPatterns,
      whitelistPatternsChildren: purgeConfig.whitelistPatternsChildren,
      content: kc.minify.purgeCSS
    }))<% } %>
    .pipe($.postcss())
    .pipe($.size({
      title: '>>> CSS File Size: '
    }))
    .pipe(gulp.dest(kc.dist.css))
}

gulp.task('minify:css', minifyCssTask)
module.exports = minifyCssTask
