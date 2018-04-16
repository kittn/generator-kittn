// Main JS File<% if (projectusage === 'webpackApp') { %>
import '../style/style.scss'<% } %><% if ( typeof projectjsframework !== 'undefined' && projectjsframework === 'react' ) { %>
import React from 'react'
import ReactDOM from 'react-dom'<% } %><% if ((typeof projectcontainerqueries !== 'undefined' && projectcontainerqueries === true) || (typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB'))  { %>
import cq from 'cq-prolyfill' // eslint-disable-line<% } %><% if ( projectusage === 'webpackApp' || (typeof projectjsframework !== 'undefined' && projectjsframework === 'vue' )) { %>
import Vue from 'vue'<% } %><% if (projectusage === 'webpackApp' || (typeof projectvueplugins !== 'undefined' && projectvueplugins === true)) { %>
import { sync } from 'vuex-router-sync'
import router from './router'
import store from './store'<% } %><% if ((typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB')) { %>
import './partial/contentBuilder'<% } %><% if ( projectusage !== 'webpackApp' ) { %>
import lazySizes from 'lazysizes'
import lazybgset from 'lazysizes/plugins/bgset/ls.bgset' // eslint-disable-line<% } %>
import 'svgxuse' // eslint-disable-line
import './partial/kittnad' // Small Advertising for Kittn :)
import './partial/detect-browser'
import './partial/disable-pointerevents'<% if (projectusage === 'webpackApp' || (typeof projectjsframework !== 'undefined' && projectjsframework === 'vue')) { %>
import App from './app'<%}%><% if ( projectusage !== 'webpackApp' ) { %>
if (window.HTMLPictureElement) {
  import('lazysizes/plugins/respimg/ls.respimg.js' /* webpackChunkName: "picturePolyfill" */)
}<%}%><% if (projectusage === 'webpackApp' || (typeof projectvueplugins !== 'undefined' && projectvueplugins === true))  { %>

// keep vue-router and vuex store in sync
sync(store, router)<% } %><% if (typeof projectjsframework !== 'undefined' && projectjsframework === 'vue' && typeof projectvueplugins !== 'undefined' && projectvueplugins === false) { %>
// Vue App
/* eslint-disable no-new */
new Vue({
  el: '#app',
  render: (h) => h(App)
})<% } %><% if ( projectusage === 'webpackApp' || (typeof projectjsframework !== 'undefined' && projectjsframework === 'vue' && typeof projectvueplugins !== 'undefined' && projectvueplugins === true)) { %>
// Vue App
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  render: (h) => h(App)
})<% } %><% if ( typeof projectjsframework !== 'undefined' && projectjsframework === 'react') { %>
ReactDOM.render(
<h1>Hello, world! from React</h1>,
  document.getElementById('app')
)<% } %><% if ( projectusage !== 'webpackApp' ) { %>

// Lasysizes Lazyload Config
const lazySizesConfig = window.lazySizesConfig || {}
window.lazySizesConfig = lazySizesConfig
window.lazySizesConfig.expand = 130
lazySizesConfig.expFactor = 1.3

// Lazy Sizes Init
lazySizes.init()<% } %><% if ((typeof projectcontainerqueries !== 'undefined' && projectcontainerqueries === true) || (typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB') ) { %>

// Activate Container Queries
cq({ postcss: true })<% } %>
