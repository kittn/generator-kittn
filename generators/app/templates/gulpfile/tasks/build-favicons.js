/**
 * BuildFavicon
 * @description Build a set of Favicons
 */

import kc from '../../config.json'
import pkg from '../../package.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const buildFaviconTask = () => {
  return gulp
    .src(kc.src.system + 'favicon.png')
    .pipe($.favicons({
      appName: pkg.name,
      appDescription: pkg.description,
      developerName: pkg.author.name,
      developerURL: pkg.author.url,
      background: kc.src.baseconf.themecolor,
      path: kc.dist.cssimgRoot + 'system/',
      url: '',
      display: 'standalone',
      orientation: 'portrait',
      version: pkg.version,
      logging: false,
      online: false,
      icons: {
        android: true,
        appleIcon: true,
        appleStartup: true,
        coast: true,
        favicons: true,
        firefox: true,
        opengraph: false,
        twitter: false,
        windows: true,
        yandex: false
      },
      html: kc.src.system + 'favicon.html'
    }))
    .pipe(gulp.dest(kc.src.system + 'favicons/'))
}

gulp.task('build:favicon', buildFaviconTask)
module.exports = buildFaviconTask
