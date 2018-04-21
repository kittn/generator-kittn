import Vue from 'vue'
import {sync} from 'vuex-router-sync'
import router from './router'
import store from './store'

// const MyApp = () => import('./app' /* webpackChunkName: "MyApp" */)

// keep vue-router and vuex store in sync
sync(store, router)

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
