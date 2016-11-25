import Vue from 'vue'
import VueRouter from 'vue-router'

// Components
// import Index from '../components/Index.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'hash',
  base: __dirname,
  routes: [
    // { name: 'index', path: '/index', component: Login, alias: ['/', '/home'] }
  ]
})

export default router
