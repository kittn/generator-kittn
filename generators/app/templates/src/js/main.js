// Main JS File<% if (projectusage === 'webpackApp') { %>
import '../style/style.scss'<% } %><% if ( typeof projectjsframework !== 'undefined' && projectjsframework === 'react' ) { %>
import React from 'react'
import ReactDOM from 'react-dom'<% } %><% if ((typeof projectcontainerqueries !== 'undefined' && projectcontainerqueries === true) || (typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'joomlaCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB'))  { %>
import cq from 'cq-prolyfill' // eslint-disable-line<% } %><% if ((typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'joomlaCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB')) { %>
import contentBuilder from './partial/contentBuilder'<% } %><% if ( projectusage !== 'webpackApp' ) { %>
import lazySizeInit from './partial/lazysize-init'<% } %>
import 'svgxuse' // eslint-disable-line
import '@babel/polyfill'
import './partial/kittnad' // Small Advertising for Kittn :)
import './partial/detect-browser'
import './partial/disable-pointerevents'<% if ( typeof projectjsframework !== 'undefined' && projectjsframework === 'react') { %>
ReactDOM.render(
<h1>Hello, world! from React</h1>
  document.getElementById('app')
)<% } %><% if (typeof projectjsframework !== 'undefined' && projectjsframework === 'vue') { %>

if (document.querySelectorAll('.js-vue').length > 0) {
  import('./vue-app' /* webpackChunkName: "vueapp" */)
}<% } %><% if ( projectusage !== 'webpackApp' ) { %>

// Init Lazysizes
lazySizeInit()<% } %><% if ((typeof projectcontainerqueries !== 'undefined' && projectcontainerqueries === true) || (typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'joomlaCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB') ) { %>

// Activate Container Queries
cq({ postcss: true })<% } %><% if (projectusage === 'webpackApp' || projectjsframework === 'vue') { %>

if (document.querySelectorAll('.js-vue').length > 0) {
  import('./vue-app' /* webpackChunkName: "vueApp" */)
}
<% } %><% if ((typeof projectusage !== 'undefined' && projectusage === 'craftCB') || (typeof projectusage !== 'undefined' && projectusage === 'joomlaCB') || (typeof projectusage !== 'undefined' && projectusage === 'wordpressCB')) { %>
contentBuilder()<% } %>
