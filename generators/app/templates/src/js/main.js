// Main JS File<% if (projectjquery === true) { %>
import $ from 'jquery' // eslint-disable-line<% } %><% if ( projectjsframework === 'react' ) { %>
import React from 'react'
import ReactDOM from 'react-dom'<% } %><% if ( projectcontainerqueries === true)  { %>
import cq from 'cq-prolyfill' // eslint-disable-line<% } %><% if ( projectjsframework === 'vue' ) { %>
import Vue from 'vue'<% } %><% if (typeof projectvueplugins !== 'undefined' && projectvueplugins === true)  { %>
import { sync } from 'vuex-router-sync'
import axios from 'axios'
import VueAxios from 'vue-axios'
import router from './router'
import store from './store'<% } %><% if ( (typeof projectcraftbp !== 'undefined' && projectcraftbp === true) || (typeof projectwordpressbp !== 'undefined' && projectwordpressbp === true) ) { %>
import progressLoader from './partial/progressLoader'
import initPhotoSwipeFromDOM from './partial/init-photoswipe' // eslint-disable-line
import disqusLoader from './partial/disqusComments'
import offCanvasToggle from './partial/offcanvas-trigger'
import './partial/init-heighttransition'
import './partial/init-autoscroll'
import './partial/flickity-package'<% } %>
import lazySizes from 'lazysizes'
import lazybgset from 'lazysizes/plugins/bgset/ls.bgset' // eslint-disable-line
import 'babel-polyfill'
import 'svgxuse' // eslint-disable-line
import './partial/kittnad' // Small Advertising for Kittn :)
import './partial/modernizer-loader'
import './partial/conditionizr-init'
import './partial/disable-pointerevents'<% if ( projectjsframework === 'vue') { %>
import App from './app'<%}%><% if (typeof projectvueplugins !== 'undefined' && projectvueplugins === true)  { %>

// keep vue-router and vuex store in sync
sync(store, router)

// Adding Vue Plugins
Vue.use(VueAxios, axios)<% } %><% if ( projectjsframework === 'vue' && projectvueplugins === false) { %>
// Vue App
/* eslint-disable no-new */
new Vue({
  el: '#app',
  render: (h) => h(App)
})<% } %><% if ( projectjsframework === 'vue' && projectvueplugins === true) { %>
// Vue App
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  render: (h) => h(App)
})<% } %><% if ( projectjsframework === 'react') { %>
ReactDOM.render(
<h1>Hello, world! from React</h1>,
  document.getElementById('app')
)<% } %>

// Lasysizes Lazyload Config
const lazySizesConfig = window.lazySizesConfig || {}
window.lazySizesConfig = lazySizesConfig
window.lazySizesConfig.expand = 130
lazySizesConfig.expFactor = 1.3

// Lazy Sizes Init
lazySizes.init()<% if ( projectcontainerqueries === true ) { %>

// Activate Container Queries
cq({ postcss: true })<% } %><% if ( (typeof projectcraftbp !== 'undefined' && projectcraftbp === true) || (typeof projectwordpressbp !== 'undefined' && projectwordpressbp === true) ) { %>

// Init Photoswipe
initPhotoSwipeFromDOM('.is-photoswipped')

// Activate Progressloader
progressLoader()

// Activate Disqus Button
disqusLoader('.c-disqusComments__button')

// Add Offcanvas Trigger
offCanvasToggle('.c-offCanvas__trigger')<% } %>
