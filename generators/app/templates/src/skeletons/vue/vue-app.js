import Vue from 'vue'<% if (projectusage === 'webpackApp' || (typeof projectvueplugins !== 'undefined' && projectvueplugins === true)) { %>
  import {sync} from 'vuex-router-sync'
  import router from './router'
  import store from './store'<% if ( projectusage === 'webpackApp' ) { %>
  import App from './app'<% } %>

  // keep vue-router and vuex store in sync
  sync(store, router)

  <% } %><% if ( projectusage === 'webpackApp' ) { %>
  // Vue App
  /* eslint-disable no-new */
  new Vue({
    el: '#app',
    router,
    store,
    render: (h) => h(App)
  })
  <% } else { %>
  // const MyApp = () => import('./app' /* webpackChunkName: "MyApp" */)

  // Vue App
  /* eslint-disable no-new */
  new Vue({
    el: '.js-vue',
    router,
    store,
    components: {
      // MyApp
    }
  })
  <% } %>
