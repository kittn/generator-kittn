/**
 * Browser Sync
 * @description Refresh the Browser after File Change.
 */

import kc from '../../config.json'
import gulp from 'gulp'
import browserSync from 'browser-sync'
import webpack from 'webpack'
import webpackDevMiddleware from 'webpack-dev-middleware'
import webpackHotMiddleware from 'webpack-hot-middleware'
import webpackSettings from '../../webpack.dev.config.babel'

const bundler = webpack(webpackSettings)

const browserSyncTask = () => {
  // Build a condition when Proxy is active
  let bsProxy
  let bsServer

  // Condition for Proxy
  if(kc.browsersync.proxy) {
    bsProxy = {
      target: kc.browsersync.proxy,
      ws: true
    }
    bsServer = false
  } else {
    bsProxy = false
    bsServer = { baseDir : kc.dist.browserSyncDir }
  }

  // Browser Sync
  browserSync.init({
      debugInfo: true,
      watchTask: true,
      proxy: bsProxy,
      middleware: [
        webpackDevMiddleware(bundler, {
          publicPath: webpackSettings.output.publicPath,
          stats: { colors: true }
        }),
        webpackHotMiddleware(bundler)
      ],

      ghostMode: {
        clicks: true,
        scroll: true,
        links: true,
        forms: true
      },

      logLevel: 'info',

      notify: {
        styles: [
          'padding: 8px 16px;',
          'position: fixed;',
          'font-size: 12px;',
          'font-weight: bold',
          'z-index: 9999;',
          'top: inherit',
          'border-radius: 0',
          'right: 0;',
          'bottom: 0;',
          'color: #f4f8f9;',
          'background-color: #026277;',
          'text-transform: uppercase'
        ]
      },

      server: bsServer,
      open: kc.browsersync.openbrowser,
      files: [
        kc.dist.js + '**/*.js',
        kc.dist.css + '**/*.css',<% if (projectUsage == 'Integrate in CraftCMS' ) { %>
    kc.dist.markup + 'templates/**/*.{php,html,twig}',<% } else if (projectUsage == 'Integrate in Wordpress') { %>
    kc.dist.markup + '**/*.{php,html,png,txt,md}',<% } else { %>
    kc.dist.base + '**/*.{php,html}',<% } %>
  kc.dist.cssimg + '**/*.{jpg,gif,png,svg}'

]
    });
};

gulp.task('browser-sync', browserSyncTask)
module.exports = browserSyncTask
