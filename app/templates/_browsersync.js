/**
 * Browser Sync
 * @description Refresh the Browser after File Change.
 */

import kc from '../../config.json'
import gulp from 'gulp'
import browserSync from 'browser-sync'

const browserSyncTask = () => {
  // Build a condition when Proxy is active
  var bsProxy, bsServer;

  // Condition for Proxy
  if(kc.browsersync.proxy) {
    bsProxy = kc.browsersync.proxy;
    bsServer = false;
  } else {
    bsProxy = false;
    bsServer = { baseDir : kc.dist.browserSyncDir};
  }

  // Browser Sync
  browserSync.init([<% if (projectvue == false ) { %>
    kc.dist.js + '**/*.js',<% } %>
    kc.dist.css + '**/*.css',<% if (projectUsage == 'Integrate in CraftCMS' ) { %>
    kc.dist.markup + 'templates/**/*.{php,html,twig}',<% } else { %>
    kc.dist.base + '**/*.{php,html}',<% } %>
    kc.dist.cssimg + '**/*.{jpg,gif,png,svg}'],
    { options: {
      debugInfo: true,
      watchTask: true,
      proxy: bsProxy,
      ghostMode: {
        clicks : true,
        scroll : true,
        links  : true,
        forms  : true }
      },
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
      open: kc.browsersync.openbrowser
    });
};

gulp.task('browser-sync', browserSyncTask)
module.exports = browserSyncTask
