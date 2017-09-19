// Main JS File<% if (projectjquery === true) { %>
import $ from 'jquery' // eslint-disable-line<% } %><% if ( projectjsframework === 'react' ) { %>
import React from 'react'
import ReactDOM from 'react-dom'<% } %><% if ((typeof projectcontainerqueries !== 'undefined' && projectcontainerqueries === true) || (typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB') )  { %>
import cq from 'cq-prolyfill' // eslint-disable-line<% } %><% if ( projectjsframework === 'vue' ) { %>
import Vue from 'vue'<% } %><% if (typeof projectvueplugins !== 'undefined' && projectvueplugins === true)  { %>
import { sync } from 'vuex-router-sync'
import router from './router'
import store from './store'<% } %><% if ( (typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB') ) { %>
import './partial/contentBuilder'<% } %>
import lazySizes from 'lazysizes'
import lazybgset from 'lazysizes/plugins/bgset/ls.bgset' // eslint-disable-line
import 'babel-polyfill'
import 'svgxuse' // eslint-disable-line
import './partial/kittnad' // Small Advertising for Kittn :)
import './partial/modernizer-loader'
import './partial/detect-browser'
import './partial/disable-pointerevents'<% if ( projectjsframework === 'vue') { %>
import App from './app'<%}%><% if (typeof projectvueplugins !== 'undefined' && projectvueplugins === true)  { %>

// keep vue-router and vuex store in sync
sync(store, router)<% } %><% if ( projectjsframework === 'vue' && projectvueplugins === false) { %>
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
lazySizes.init()<% if ((typeof projectcontainerqueries !== 'undefined' && projectcontainerqueries === true) || (typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB') ) { %>

// Activate Container Queries
cq({ postcss: true })<% } %>
