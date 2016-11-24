// Main JS File<% if (projectjquery === true) { %>
import $ from 'jquery'<% } if (projectquery === 'ElementQuery') { %>
import eq from 'css-element-queries'<% } else if (projectquery === 'ContainerQuery') { %>
import cq from 'cq-prolyfill'<% } if ( projectJSFramework === 'Vue.js' ) { %>
import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueRouter from 'vue-router'<% } %>
import './partial/kittnad' // Small Advertising for Kittn :)
import modernizrLoad from './partial/modernizer-loader' // eslint-disable-line
import conditionizrInit from './partial/conditionizr-init' // eslint-disable-line <% if ( projectJSFramework === 'Vue.js') { %>
import App from './app.vue'
import store from './store/store'<% if ( projectJSFramework === 'Vue.js' ) { %>

require('es6-promise').polyfill()<% } %>

// Adding Vue Plugins
Vue.use(VueAxios, axios)
Vue.use(VueRouter)<% } %><% if (projectquery === 'ContainerQuery') { %>

// Init Container Queries
cq({ postcss: true })<% } if ( projectJSFramework === 'Vue.js' ) { %>
// Vue App
new Vue({
  el: '#app',
  store,
  render: h => h(App)
})<% } %>
