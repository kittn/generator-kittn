// Main JS File<% if ( projectusage === 'webpackApp' || (typeof projectjsframework !== 'undefined' && projectjsframework === 'vue' )) { %>
  import Vue from 'vue'<% } %><% if (projectusage === 'webpackApp' || (typeof projectvueplugins !== 'undefined' && projectvueplugins === true)) { %>
  import { sync } from 'vuex-router-sync'
  import router from './router'
  import store from './store'<% } %><% if (projectusage === 'webpackApp' || (typeof projectjsframework !== 'undefined' && projectjsframework === 'vue')) { %>
  import App from './app'<%}%><% if (projectusage === 'webpackApp' || (typeof projectvueplugins !== 'undefined' && projectvueplugins === true))  { %>

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
  })<% } %>
