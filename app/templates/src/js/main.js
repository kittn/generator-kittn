// Main JS File<% if (projectjquery === true) { %>
import $ from 'jquery'<% } %>
import eq from 'eqcss'<% if ( projectJSFramework === 'Vue.js' ) { %>
import Vue from 'vue'
import { sync } from 'vuex-router-sync'
import axios from 'axios'
import VueAxios from 'vue-axios'
import router from './router/router'
import store from './store/store'<% } %><% if (projectcraftbp === true || projectwordpressbp === true) { %>
import progressLoader from './partial/progressloader'
import initPhotoSwipeFromDOM from './partial/init-photoswipe' // eslint-disable-line
import './partial/init-heighttransition'
import './partial/init-autoscroll'
import 'flickity'
import 'flickity-imagesloaded'<% } %>
import lazySizes from 'lazysizes'
import lazybgset from 'lazysizes/plugins/bgset/ls.bgset'
import './partial/kittnad' // Small Advertising for Kittn :)
import './partial/modernizer-loader'
import './partial/conditionizr-init'
import './partial/disable-pointerevents'<% if ( projectJSFramework === 'Vue.js') { %>
import App from './app.vue'

require('es6-promise').polyfill()

// keep vue-router and vuex store in sync
sync(store, router)

// Adding Vue Plugins
Vue.use(VueAxios, axios)

// Vue App
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})<% } %>

// Lasysizes Lazyload Config
window.lazySizesConfig = window.lazySizesConfig || {}
window.lazySizesConfig.expand = 130
lazySizesConfig.expFactor = 1.3

// Lazy Sizes Init
lazySizes.init()<% if (projectcraftbp === true || projectwordpressbp === true) { %>

// Init Photoswipe
initPhotoSwipeFromDOM('.is-photoswipped')

// Activate Progressloader
progressLoader()<% } %>
